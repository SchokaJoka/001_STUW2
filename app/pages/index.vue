<template>
  <div class="min-h-screen bg-white px-4 py-8">
    <div class="max-w-md mx-auto">
      <!-- Header -->
      <div class="text-center mb-8">
        <h1 class="text-4xl font-bold text-black mb-2">
          Cards Against Humanity
        </h1>
        <p class="text-gray-600">Choose your game and players</p>
      </div>

      <!-- Player Count Selector -->
      <div class="border-2 border-black p-6 mb-6">
        <h2 class="text-xl font-semibold text-black mb-4">Number of Players</h2>
        <div class="flex items-center justify-center gap-6">
          <button
            @click="decrementPlayers"
            :disabled="playerCount <= 3"
            class="w-12 h-12 border-2 border-black bg-black text-white text-2xl font-bold hover:bg-white hover:text-black disabled:bg-gray-200 disabled:border-gray-400 disabled:text-gray-400 disabled:cursor-not-allowed transition"
          >
            -
          </button>
          <div class="text-4xl font-bold text-black min-w-[60px] text-center">
            {{ playerCount }}
          </div>
          <button
            @click="incrementPlayers"
            :disabled="playerCount >= 10"
            class="w-12 h-12 border-2 border-black bg-black text-white text-2xl font-bold hover:bg-white hover:text-black disabled:bg-gray-200 disabled:border-gray-400 disabled:text-gray-400 disabled:cursor-not-allowed transition"
          >
            +
          </button>
        </div>
        <p class="text-sm text-gray-600 text-center mt-3">
          Minimum 3 players required
        </p>
      </div>

      <!-- Game Selection -->
      <div class="border-5 border-black p-6 mb-6">
        <h2 class="text-xl font-semibold text-black mb-4">Choose Your Game</h2>
        <div v-if="loading" class="text-center py-8">
          <div
            class="animate-spin rounded-full h-12 w-12 border-b-2 border-purple-600 mx-auto"
          ></div>
          <div class="border-5 border-black"></div>
          <p class="text-black mt-4">Loading card packs...</p>
        </div>
        <div v-else class="space-y-3">
          <button
            v-for="pack in cardPacks"
            :key="pack.id"
            @click="selectedGame = pack.id"
            :class="[
              'w-full p-4 border-2 transition text-left',
              selectedGame === pack.id
                ? 'border-black bg-black text-white'
                : 'border-black bg-white text-black hover:bg-black hover:text-white',
            ]"
          >
            <div class="flex items-center justify-between">
              <div>
                <h3 class="font-semibold">{{ pack.name }}</h3>
                <p class="text-sm opacity-70">{{ pack.description }}</p>
                <span
                  v-if="pack.is_preset"
                  :class="[
                    'inline-block mt-1 px-2 py-1 text-xs border',
                    selectedGame === pack.id ? 'border-white' : 'border-black',
                  ]"
                >
                  Preset Pack
                </span>
              </div>
              <div
                v-if="selectedGame === pack.id"
                class="w-6 h-6 border-2 border-white flex items-center justify-center"
              >
                <svg
                  class="w-4 h-4 text-white"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M5 13l4 4L19 7"
                  ></path>
                </svg>
              </div>
            </div>
          </button>
        </div>
      </div>

      <!-- Start Game Button -->
      <button
        @click="startGame"
        :disabled="!selectedGame"
        class="w-full bg-black text-white py-4 border-2 border-black font-bold text-lg hover:bg-white hover:text-black disabled:bg-gray-200 disabled:text-gray-400 disabled:border-gray-400 disabled:cursor-not-allowed transition"
      >
        Start Game
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";
import type { CardPack } from "~/types/database";

const playerCount = ref(3);
const selectedGame = ref<string | null>(null);
const cardPacks = ref<CardPack[]>([]);
const loading = ref(true);

onMounted(async () => {
  try {
    const { getCardPacks } = useCards();
    cardPacks.value = await getCardPacks();
  } catch (error) {
    console.error("Error loading card packs:", error);
  } finally {
    loading.value = false;
  }
});

const incrementPlayers = () => {
  if (playerCount.value < 10) {
    playerCount.value++;
  }
};

const decrementPlayers = () => {
  if (playerCount.value > 3) {
    playerCount.value--;
  }
};

const startGame = () => {
  if (selectedGame.value) {
    // Navigate to game page with selected options
    console.log(
      `Starting game: ${selectedGame.value} with ${playerCount.value} players`,
    );
    // TODO: Navigate to game page
  }
};
</script>
