# Food calories bot — Forgeyard toy project

A deliberately small Telegram bot: send a food photo, receive a rough calorie estimate from a local multimodal LLM.

The implementation is intentionally delegated to Forgeyard. See [`spec.md`](spec.md) for the MVP contract.

## Factory quality gate

```bash
make qa
```

No tokens or network access should be needed for the test suite.
