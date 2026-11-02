-- Clear Round leaderboard table for Supabase.
-- Paste this whole file into the Supabase SQL Editor and click Run.

create table if not exists public.scores (
  id         bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  class      text    not null check (class in ('school', 'novice', 'gp')),
  rider      text    not null check (char_length(btrim(rider)) between 1 and 18),
  horse      text    not null check (char_length(btrim(horse)) between 1 and 18),
  faults     integer not null check (faults between 0 and 199),
  seconds    numeric(6,2) not null check (seconds < 600),
  -- Fastest possible rounds: galloping the straight line between fences
  -- takes about 14s (Schooling), 18s (Novice) and 21s (Grand Prix).
  -- Anything quicker than these floors cannot come from a real round.
  constraint plausible_time check (
    (class = 'school' and seconds >= 12) or
    (class = 'novice' and seconds >= 15) or
    (class = 'gp'     and seconds >= 18)
  )
);

create index if not exists scores_rank on public.scores (class, faults, seconds);

-- Anyone can read the board and add a score. Nobody but you (from the
-- Supabase dashboard) can change or delete scores.
alter table public.scores enable row level security;

drop policy if exists "Anyone can read scores" on public.scores;
create policy "Anyone can read scores" on public.scores
  for select to anon using (true);

drop policy if exists "Anyone can add a score" on public.scores;
create policy "Anyone can add a score" on public.scores
  for insert to anon with check (true);

grant select, insert on public.scores to anon;
