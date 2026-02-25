export interface CardPack {
  id: string;
  name: string;
  description: string | null;
  is_custom: boolean;
  is_preset: boolean;
  created_at: string;
  updated_at: string;
}

export interface BlackCard {
  id: string;
  pack_id: string;
  text: string;
  pick: number;
  created_at: string;
}

export interface WhiteCard {
  id: string;
  pack_id: string;
  text: string;
  created_at: string;
}

export interface Database {
  public: {
    Tables: {
      card_packs: {
        Row: CardPack;
        Insert: Omit<CardPack, "id" | "created_at" | "updated_at">;
        Update: Partial<Omit<CardPack, "id" | "created_at" | "updated_at">>;
      };
      black_cards: {
        Row: BlackCard;
        Insert: Omit<BlackCard, "id" | "created_at">;
        Update: Partial<Omit<BlackCard, "id" | "created_at">>;
      };
      white_cards: {
        Row: WhiteCard;
        Insert: Omit<WhiteCard, "id" | "created_at">;
        Update: Partial<Omit<WhiteCard, "id" | "created_at">>;
      };
    };
  };
}
