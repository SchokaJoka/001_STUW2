import { defineConfig } from "vitest/config";
import vue from "@vitejs/plugin-vue";
import tsconfigPaths from "vite-tsconfig-paths";
import { resolve } from "path";

export default defineConfig({
  plugins: [vue(), tsconfigPaths()],
  resolve: {
    alias: {
      "@": resolve(__dirname, "./app"),
      "~": resolve(__dirname, "."),
    },
  },
  test: {
    environment: "jsdom",
    globals: true,
  },
});
