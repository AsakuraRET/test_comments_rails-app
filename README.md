# Comments & Notifications (Rails 8)

This is a test task implementing a comment system with @mentions and full-text search. The main focus was to keep the codebase clean, predictable, and close to standard Rails conventions.

## Tech Stack
* Ruby 3.2+ / Rails 8.0
* PostgreSQL
* Redis & Sidekiq (for background jobs)
* Meilisearch (via `meilisearch-rails`)
* TailwindCSS + Turbo Streams
* Devise

## Local Setup

You'll need PostgreSQL, Redis, and Meilisearch running locally. 

1. **Clone the repository and install dependencies:**
   ```bash
   git clone <your-repo-url>
   cd comments_app
   bundle install
   ```

2. **Setup the database:**
   ```bash
   rails db:create db:migrate
   ```

3. **Start background services:**
   Ensure your Redis server is running. Then, open a new terminal tab and start Meilisearch:
   ```bash
   meilisearch
   ```

4. **Boot the application:**
   The project uses `Procfile.dev` to orchestrate everything. This single command will start the Puma server, the Tailwind CSS watcher, and the Sidekiq worker simultaneously:
   ```bash
   bin/dev
   ```

The app will be available at `http://localhost:3000`.
<img width="1331" height="828" alt="Снимок экрана 2026-06-02 в 18 40 11" src="https://github.com/user-attachments/assets/052b4c9b-9fb6-44cb-996d-a7ae5f84aad3" />
