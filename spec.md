# Food calories bot — MVP

## Goal
Build a minimal Telegram bot that accepts one food photo and replies with an **approximate** calorie estimate. Accuracy is not the goal: this is a test project for Forgeyard and a local multimodal LLM.

## User flow
1. A user sends a photo to the bot.
2. The bot downloads the largest available image variant.
3. It sends the image plus a short instruction to a local OpenAI-compatible multimodal endpoint.
4. The bot replies in plain text with:
   - a short description of the detected food;
   - a calorie estimate in kcal (a range is preferred);
   - the sentence: `This is only a rough estimate, not nutritional advice.`

## Technical requirements
- Use Python 3.11+ and `python-telegram-bot`.
- Entry point: `python -m food_bot`.
- Read configuration only from environment variables:
  - `TELEGRAM_BOT_TOKEN` — required to run;
  - `OPENAI_BASE_URL` — local API base URL, e.g. `http://192.168.31.31:1234/v1`;
  - `OPENAI_API_KEY` — optional for local LM Studio; use `dummy` if absent;
  - `OPENAI_MODEL` — optional; use the first available model or a documented default if absent.
- Use the OpenAI-compatible `chat/completions` API and pass the photo as an image URL/data URL supported by that API.
- If no token is configured, exit with a helpful message; never commit secrets.
- If the model call fails or its output cannot be used, reply with a friendly error instead of crashing.
- Ignore non-photo Telegram updates safely.

## Scope limits
- No database, user accounts, meal history, payments, or calorie tracking.
- Do not claim medical or nutritional accuracy.
- A hard-coded, concise prompt is sufficient.

## Acceptance criteria
- `make qa` passes on a clean checkout without real tokens or network access.
- Tests cover configuration validation, prompt/result formatting, and at least one failed-model-call path using mocks.
- The README explains setup and how to run the bot against LM Studio.
