# Clear Round

- The game is a single file: `docs/index.html`, served by GitHub Pages from `main` /docs.
- **Build tag:** every change that gets pushed bumps the build number by **0.17**
  (1.17 → 1.34 → 1.51 …). Update both places in `docs/index.html`:
  the `<meta name="build">` tag and the `Build x.xx` label on the main menu.
- Favicon: `docs/favicon.ico` (the fox, same file as the Fishtank-Deer-Hunt-combo repo).
- Leaderboard: Supabase table `scores` (see `supabase-setup.sql`). Never commit a secret/service_role key.
- Backups: `.github/workflows/backup-scores.yml` copies the table nightly to the `backups` branch (scores.json / scores.csv).
