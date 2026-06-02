# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Development
```bash
bin/rails server -p 3000   # Start web server
yarn build --watch          # Watch and bundle JavaScript
yarn build:css --watch      # Watch and compile SCSS
```

Run all three in parallel using Foreman (Procfile):
```bash
foreman start
```

### Database
```bash
bin/rails db:migrate
bin/rails db:seed           # Loads db/seeds.rb + all megapolis7/ seed files
```

### Rake Tasks
```bash
rails delete_day[<id>]       # Remove a day with all games, goals, day_players
rails delete_season[<id>]    # Reset season data and reload all seed files
rails sort_commands[<id>]    # ELO-based team balancing (space-separated player IDs)
rails calc_elo[<id>]         # Print current ELO ratings by hardcoded team assignments
```

### Deployment (Capistrano)
```bash
cap production deploy        # Deploy to pipiper.ru:2222
```

### Telegram Webhook
```bash
# Register webhook (replace with actual domain and bot token)
# GET /telegram/:bot_token
```

## Architecture

### Domain Model

This is a sports league management app (small-sided football) with Telegram bot integration.

**Core hierarchy:** `Sport → Championship → Season → Day → Game → Goal`

**Key models:**
- **Player** — Devise + OmniAuth (Telegram) authenticated user. Tracks ELO rating (`K_ELO = 0.2`, `K_ATTENDANCE = 10%`). Has `firstname`, `lastname`, `nickname` with helper methods (`full_name`, `short_name`, `with_initial`).
- **Day** — A match day/event. Tracks team placements (1st–4th) and video URLs. All game data is nested under a day.
- **Game** — A single match between two teams. Stores `goals_left`/`goals_right` and ELO deltas.
- **DayPlayer** — Junction table linking Player↔Day↔Team↔Season. Stores per-day stats: `new_elo`, `games`, `wins`, `draws`, `losses`. This is the primary stats table.
- **Goal** — Individual goal with optional `assist_player_id`.
- **Team** — 4 fixed teams: Purple (1), Green (2), White (3), Other (4).
- **Message / MessageFile** — Stores Telegram messages and their media file metadata.

### ELO System
- ELO is stored on both `Player` (current) and `DayPlayer` (per-day snapshot as `new_elo`)
- Calculation is done in the `Game` model and `DayPlayer` model
- `sort_commands` rake task uses snake-draft ordering to balance teams by ELO

### Controllers
- **DaysController** is the most complex — handles player/team assignment, statistics aggregation, and a `next` action that fetches recent Telegram messages for match day preview
- **TelegramWebhooksController** delegates to `MessageService` for processing incoming messages
- **CallbacksController** handles OmniAuth Telegram login flow

### Services (`app/services/`)
- **MessageService** — Processes Telegram webhook payloads; downloads and stores media (photos, videos, documents)
- **StatService** — Calculates team game stats (Win3 = clean sheet, Win2 = 2-point win, Win1 = 1-point win)
- **TeamStat** — Aggregates team statistics for display
- Separate small services: `About`, `Common`, `Webcam`, `Webcam2`, `Fractal`

### Frontend
- **Slim** templates (`.html.slim`) throughout views
- **Bulma** CSS framework with SCSS
- **Stimulus** controllers for interactivity
- **Turbo** (Hotwire) for dynamic page updates
- **ActionCable** WebSocket channel (`ChatChannel`) for real-time chat
- JavaScript bundled with **esbuild** (`esbuild.config.js`)
- CSS compiled with **sass**

### Seeding
Match day data lives in `db/seeds/megapolis7/YYYYMMDD.rb` files (one per match day). The `delete_season` rake task wipes season data and reloads all seed files. New season template is at `db/2026_template.rb`.

### Authentication
- Devise with Telegram OmniAuth (password/email are optional — Telegram-first)
- `Authorization` model stores provider + UID pairs
- `Player.find_for_oauth(auth)` upserts from OAuth data

### Environment Variables
- `BOT_TOKEN` — Telegram bot token
- `CHAT_NAME` — Telegram group chat identifier
- `DB_NAME`, `DB_USERNAME`, `DB_PASSWORD` — Database credentials
- `POSTGRES_PORT` — Optional, for Docker setups

### No Test Suite
There are no `spec/` or `test/` directories. Testing is manual via seeds and the Rails console.