-- Clear existing data (optional - only if you want to start fresh)
DELETE FROM white_cards;
DELETE FROM black_cards;
DELETE FROM card_packs;

-- Insert preset packs
INSERT INTO card_packs (name, description, is_preset, is_custom) VALUES
  ('Cards Against Humanity - Starter', 'The original Cards Against Humanity starter pack (English)', true, false),
  ('Kampf gegen das Bünzlitum', 'Swiss edition in Swiss German', true, false);

-- ============================================
-- CARDS AGAINST HUMANITY (ENGLISH)
-- ============================================

-- Insert Cards Against Humanity black cards (English)
INSERT INTO black_cards (pack_id, text, pick) VALUES
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'What is Batman''s guilty pleasure?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'I got 99 problems but _ ain''t one.', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), '_ + _ = _', 2),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'What''s that smell?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'This is the way the world ends / Not with a bang but with _.', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'What gives me uncontrollable gas?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'What would grandma find disturbing, yet oddly charming?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'What''s my secret power?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'What ended my last relationship?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'What''s the next Happy Meal toy?', 1);

-- Insert Cards Against Humanity white cards (English)
INSERT INTO white_cards (pack_id, text) VALUES
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Bees?'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'A mime having a heart attack'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Pac-Man uncontrollably guzzling cum'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Coat hanger abortions'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Dead parents'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Being a motherfucking sorcerer'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Jerking off into a pool of children''s tears'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Flying sex snakes'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'A big hoopla about nothing'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Vigorous jazz hands'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Raptor attacks'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Concealing a boner'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'A sad handjob'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Grandma'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Explosions'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'The Donald Trump presidency'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Getting really high'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'Poor life choices'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'A windmill full of corpses'),
  ((SELECT id FROM card_packs WHERE name = 'Cards Against Humanity - Starter'), 'White privilege');

-- ============================================
-- KAMPF GEGEN DAS BÜNZLITUM (SWISS GERMAN)
-- ============================================

-- Insert Kampf gegen das Bünzlitum black cards (Swiss German)
INSERT INTO black_cards (pack_id, text, pick) VALUES
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Was isch s Schlimmste a de Schwiiz?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Wenn ich Bundesrat wär, würdi _ verbiete.', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'D SVP findet _ nöd lustig.', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Was mached Schwiizer am liebste am Sunntig?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Was bringt Schwiizer uf d Palme?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), '_ het mis Läbe veränderet.', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Was findet me i jedem Schwiizer Huushalt?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Die nöchsti 1. August Rede handlet vo _.', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Was darf a keinere Schwiizer Party fehle?', 1),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Was macht Züri zu Züri?', 1);

-- Insert Kampf gegen das Bünzlitum white cards (Swiss German)
INSERT INTO white_cards (pack_id, text) VALUES
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Roger Federer'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Cervelat mit Senf'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'D Migros'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Rassistischi Grosselterä'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Schwiizer Pünktlichkeit'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Rivella'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'D SBB wo wieder mal z spat isch'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Fondue am Stubete'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Morn um 7i e Gipfeli hole'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Schwingfest'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Toblerone'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'DJ Bobo'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'S Matterhorn'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Bankisgheimnis'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Raclette am Wuchenänd'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'D Armee'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Stau uf de Gotthard'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Läberkäse'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Meh Stüüre zahle'),
  ((SELECT id FROM card_packs WHERE name = 'Kampf gegen das Bünzlitum'), 'Zürich Hauptbahnhof am Frittig Obe');
