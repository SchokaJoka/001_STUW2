import type { CardPack, BlackCard, WhiteCard } from "~/types/database";

export const useCards = () => {
  const { $supabase } = useNuxtApp();

  if (!$supabase) {
    console.error("Supabase client not initialized");
    throw new Error("Supabase client not available");
  }

  // Fetch all card packs
  const getCardPacks = async () => {
    const { data, error } = await $supabase
      .from("card_packs")
      .select("*")
      .order("is_preset", { ascending: false })
      .order("name");

    if (error) {
      console.error("Error fetching card packs:", error);
      return [];
    }

    return data as CardPack[];
  };

  // Fetch black cards for a specific pack
  const getBlackCards = async (packId: string) => {
    const { data, error } = await $supabase
      .from("black_cards")
      .select("*")
      .eq("pack_id", packId);

    if (error) {
      console.error("Error fetching black cards:", error);
      return [];
    }

    return data as BlackCard[];
  };

  // Fetch white cards for a specific pack
  const getWhiteCards = async (packId: string) => {
    const { data, error } = await $supabase
      .from("white_cards")
      .select("*")
      .eq("pack_id", packId);

    if (error) {
      console.error("Error fetching white cards:", error);
      return [];
    }

    return data as WhiteCard[];
  };

  // Fetch a pack with all its cards
  const getPackWithCards = async (packId: string) => {
    const [pack, blackCards, whiteCards] = await Promise.all([
      $supabase.from("card_packs").select("*").eq("id", packId).single(),
      getBlackCards(packId),
      getWhiteCards(packId),
    ]);

    if (pack.error) {
      console.error("Error fetching pack:", pack.error);
      return null;
    }

    return {
      pack: pack.data as CardPack,
      blackCards,
      whiteCards,
      totalCards: blackCards.length + whiteCards.length,
    };
  };

  // Fetch cards from multiple packs
  const getCardsFromPacks = async (packIds: string[]) => {
    const blackCardsPromises = packIds.map((id) => getBlackCards(id));
    const whiteCardsPromises = packIds.map((id) => getWhiteCards(id));

    const [blackCardsArrays, whiteCardsArrays] = await Promise.all([
      Promise.all(blackCardsPromises),
      Promise.all(whiteCardsPromises),
    ]);

    // Flatten and shuffle
    const allBlackCards = blackCardsArrays.flat();
    const allWhiteCards = whiteCardsArrays.flat();

    return {
      blackCards: shuffleArray(allBlackCards),
      whiteCards: shuffleArray(allWhiteCards),
    };
  };

  // Create a custom card pack
  const createCustomPack = async (name: string, description?: string) => {
    const { data, error } = await $supabase
      .from("card_packs")
      .insert({
        name,
        description,
        is_custom: true,
        is_preset: false,
      })
      .select()
      .single();

    if (error) {
      console.error("Error creating custom pack:", error);
      return null;
    }

    return data as CardPack;
  };

  // Add custom black card
  const addBlackCard = async (
    packId: string,
    text: string,
    pick: number = 1,
  ) => {
    const { data, error } = await $supabase
      .from("black_cards")
      .insert({
        pack_id: packId,
        text,
        pick,
      })
      .select()
      .single();

    if (error) {
      console.error("Error adding black card:", error);
      return null;
    }

    return data as BlackCard;
  };

  // Add custom white card
  const addWhiteCard = async (packId: string, text: string) => {
    const { data, error } = await $supabase
      .from("white_cards")
      .insert({
        pack_id: packId,
        text,
      })
      .select()
      .single();

    if (error) {
      console.error("Error adding white card:", error);
      return null;
    }

    return data as WhiteCard;
  };

  return {
    getCardPacks,
    getBlackCards,
    getWhiteCards,
    getPackWithCards,
    getCardsFromPacks,
    createCustomPack,
    addBlackCard,
    addWhiteCard,
  };
};

// Helper function to shuffle array
function shuffleArray<T>(array: T[]): T[] {
  const shuffled = [...array];
  for (let i = shuffled.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }
  return shuffled;
}
