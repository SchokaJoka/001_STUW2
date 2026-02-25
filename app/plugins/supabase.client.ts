import { createClient } from "@supabase/supabase-js";

export default defineNuxtPlugin(() => {
  const config = useRuntimeConfig();

  console.log("Supabase URL:", config.public.supabaseUrl);
  console.log("Supabase Key exists:", !!config.public.supabaseKey);

  if (!config.public.supabaseUrl || !config.public.supabaseKey) {
    console.error("Supabase credentials missing!");
    return;
  }

  const supabase = createClient(
    config.public.supabaseUrl,
    config.public.supabaseKey,
  );

  return {
    provide: {
      supabase,
    },
  };
});
