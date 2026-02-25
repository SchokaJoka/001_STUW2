export default defineNuxtConfig({
  compatibilityDate: "2026-02-25",
  modules: ["@nuxtjs/tailwindcss"],
  runtimeConfig: {
    public: {
      supabaseUrl: process.env.SUPABASE_URL,
      supabaseKey: process.env.SUPABASE_KEY,
    },
  },
});
