<template>
  <div class="min-h-screen bg-gray-50">
    <header class="bg-white shadow-sm sticky top-0 z-50">
      <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <NuxtLink to="/" class="text-xl font-bold text-blue-600">
            MyApp
          </NuxtLink>
          <div class="flex gap-4">
            <NuxtLink to="/" class="text-gray-700 hover:text-blue-600"
              >Start</NuxtLink
            >
            <NuxtLink to="/about" class="text-gray-700 hover:text-blue-600"
              >About</NuxtLink
            >
          </div>
        </div>
      </nav>
    </header>
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <slot />
    </main>
  </div>
</template>
