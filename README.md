# Leaderboard backups

Nightly copy of the Clear Round `scores` table from Supabase, made by
`.github/workflows/backup-scores.yml` on the main branch.

- `scores.json` and `scores.csv` hold every score at the last backup.
- Each day's copy is a commit on this branch, so older versions are in the history.

To restore: in Supabase open Table Editor → scores → Insert → Import data from CSV,
and choose `scores.csv` (or the version you want from the history).
