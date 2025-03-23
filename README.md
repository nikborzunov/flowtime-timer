```markdown
# ⏳ Telegram Flowtime Timer Bot (State Machine)

[![built-with](https://img.shields.io/badge/Built%20with-TypeScript-blue.svg)](https://www.typescriptlang.org/)
[![Telegram](https://img.shields.io/badge/Telegram-Bot-blue.svg)](https://core.telegram.org/bots/api)

> **A smart Telegram bot implementing a Flowtime technique timer (80% work / 20% rest)**

## 💡 What is the Flowtime Technique?

Flowtime is a productivity technique similar to Pomodoro, but flexible. Instead of fixed intervals, it adapts rest times according to the productive work session duration, typically suggesting about 20–25% rest. This makes your productivity sessions dynamic, personalized, and effective.

## 🤖 What Does This Bot Do?

This Telegram bot implements the Flowtime method automatically:

- **Tracks your productive time and automatically calculates optimal rest breaks**
- Provides real-time timer updates directly in Telegram
- Saves daily session data persistently using local storage
- Displays visual ASCII-style charts of work vs rest vs idle time
- Offers intuitive commands (`start`, `end`, `idle`, `status`, `reset`) accessible directly via keyboard in Telegram chat

## 📌 State Machine Pattern (Finite State Machine)

### Overview

This bot is based on the **Finite State Machine (FSM)** pattern, enhancing clarity, maintainability, and reliability. Each behavioral state (`work`, `rest`, and `idle`) has explicitly defined behaviors and allowed transitions, which helps accurately control session flow and prevents state conflicts.

### States and Transitions

The bot consists of three main states:

- **`work`**: The user is actively engaging in a productive session.  
  ➡️ Can transition to → `rest` or `idle`
  
- **`rest`**: Calculated based on previous work period (typically about 20–25% of work duration).  
  ➡️ Can transition to → `work` or `idle`

- **`idle`**: Pause without specific activity timer; freely transitions back to productive mode.  
  ➡️ Can transition to → `work`

These states are clearly defined with their entry (`onEnter`) and exit (`onExit`) actions.

### Code Implementation

The FSM pattern implementation here is minimalistic, robust, and efficient, designed from scratch without external libraries, properly utilizing modern ES features:

- Explicit State Definitions  
- Defined State Transitions  
- Entry and Exit callbacks for each state

### Advantages of FSM usage here:

- Robust logic implementation
- Clear state visualization
- Less bug-prone
- Easy to test & extend

## 📦 Technologies & Dependencies

- **TypeScript**
- **Telegram Bot API**
- **Moment & moment-duration-format** (time handling and formatting)
- **LocalStorage** (persistent data storage)
- **tcharts.js** (data visualization in Telegram via ASCII)

## 🛠️ Installation

1. Clone the repository:
```bash
git clone https://github.com/nikborzunov/flowtime-timer.git
cd flowtime-timer 
npm install
```

2. Set your Telegram bot token in environment variables:
```bash
export FLOWTIME_BOT_TOKEN='your-telegram-bot-token-from-BotFather'
```

3. Start bot:
```bash
npm start
```

## 🚩 Bot Commands (Messages):

| Command | What it does |
| ------- | ------------ |
| `start` | Starts a work session ⏳ |
| `end`   | Ends work session, calculates earned rest 💤 |
| `idle`  | Pauses timers, goes into idle mode 🛑 |
| `status`| Provides an ASCII-style chart of today’s productivity statistics 📊 |
| `reset` | Clears your daily statistics 🚾 |

## 📞 Contact

📩 **Telegram:** [@kupilulitku](https://t.me/kupilulitku)

Have feedback, feature requests, or questions? Feel free to reach out and discuss your productivity ideas directly!

---

Made with ❤️ and 🍵 by **nikborzunov**, productivity enthusiast and software architect.
```