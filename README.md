# Clear Round

A top-down show jumping game. Ride your horse around a numbered course in the ring, time your take-offs, and go for a clear round.

Play it at https://grey-lancaster.github.io/Clear-Round/

## How to ride

- **Steer:** left/right arrows (or the on-screen buttons on a phone)
- **Pace:** up/down to change between walk, trot, canter and gallop
- **Jump:** Space, when the marker reaches the green take-off zone

Rails down and refusals cost 4 faults each. Two refusals and you're eliminated. Finish inside the time allowed to avoid time faults.

The whole game is one file: `docs/index.html`.

## Leaderboard

Each class keeps a top 10. Fewest faults ranks first, so clear rounds always lead, and the fastest time breaks ties. A round that makes the top 10 asks for the rider's name; eliminated rounds don't count.

Until it's connected to Supabase, scores are saved only in each player's browser. To share them with everyone:

1. Create a free project at supabase.com.
2. Open the SQL Editor, paste in `supabase-setup.sql`, and run it.
3. In Project Settings → API, copy the Project URL and the `anon` public key into the `LB` line near the top of the script in `docs/index.html`.
