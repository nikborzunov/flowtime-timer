# Telegram Flowtime Timer Bot

[![Built with TypeScript](https://img.shields.io/badge/Built%20with-TypeScript-blue.svg)](https://www.typescriptlang.org/)
[![Telegram Bot](https://img.shields.io/badge/Telegram-Bot-blue.svg)](https://core.telegram.org/bots/api)

A smart Telegram bot implementing the Flowtime Technique—automatically tracking productive sessions and scheduling rest breaks (approximately 80% work / 20% rest).

## What Is the Flowtime Technique?

Flowtime is a flexible productivity method similar to Pomodoro but without rigid time blocks. Instead, it adapts rest intervals based on your work duration, making sessions dynamic, personalized, and efficient.

## Bot Features

- Automatically tracks work sessions and calculates optimal break times.
- Sends real-time timer updates directly in Telegram.
- Persists daily session data using local storage.
- Displays ASCII charts illustrating work, rest, and idle time.
- Provides intuitive commands (`start`, `end`, `idle`, `status`, `reset`) through Telegram’s interface.

## Finite State Machine

The bot is engineered using the Finite State Machine (FSM) pattern, defining explicit states and transitions to ensure a robust workflow:

- **Work**: Active productive session. Transitions to Rest or Idle.
- **Rest**: Break period calculated from work duration. Transitions back to Work or Idle.
- **Idle**: Paused state; can resume work at any time.

Each state features dedicated entry and exit actions, leading to cleaner logic and easier maintenance.

## Technologies

- TypeScript
- Telegram Bot API
- Moment & moment-duration-format (for time formatting)
- LocalStorage (persistent data storage)
- tcharts.js (ASCII data visualization in Telegram)

## Installation

1. Clone the repository and install dependencies:
   ```bash
   git clone https://github.com/nikborzunov/flowtime-timer.git
   cd flowtime-timer
   npm install
   ```
2. Set your Telegram bot token in your environment:
   ```bash
   export FLOWTIME_BOT_TOKEN="your-telegram-bot-token-from-BotFather"
   ```
3. Start the bot:
   ```bash
   npm start
   ```

## Available Commands

| Command  | Description                                    |
| -------- | ---------------------------------------------- |
| `start`  | Begins a work session                          |
| `end`    | Ends the current work session and schedules a rest break |
| `idle`   | Pauses the session and enters idle mode        |
| `status` | Displays an ASCII-style chart of today's productivity |
| `reset`  | Clears all daily statistics                    |

## Contact

For feedback, feature requests, or questions, reach out on Telegram: [@kupilulitku](https://t.me/kupilulitku).

---

Made with ❤️ and 🍵 by **nikborzunov**
