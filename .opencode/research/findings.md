# Research: Typing Practice App Enhancements

## User Goal
The user wants to research the implementation details for two main features:
1. Modifying `run.sh` to listen on localhost and automatically open the browser.
2. Implementing audio feedback (different notes/tones) for keypresses.

## Project Context
- Tech stack: Python (hosting server via `http.server`), HTML, JavaScript (jQuery + Vanilla JS).
- Current structure: 
    - `run.sh`: Currently just runs `python -m http.server`.
    - `index.html`: Contains the primary client-side logic and styling.

## Requirements
### 1. `run.sh` Modifications
- **Host Binding**: Currently uses default host (0.0.0.0). Needs to bind specifically to `127.0.0.1`.
- **Auto-open Browser**: Need a method in the shell script or a helper to open the browser automatically on start.
- **Port Detection**: The current command `python -m http.server` defaults to port 8000 if not specified. No specific port is currently defined in files, but needs confirmation from inspection.

### 2. Audio Feedback implementation
- **Approach Analysis**: Web Audio API vs. Server-side MIDI.
    - *Web Audio API (Client-side)*: Better for real-time responsiveness and low latency. Suitable for generating notes/tones directly in the browser.
    - *Server-side MIDI*: Requires a server capable of handling MIDI output or translating requests to system midi, which is complex and introduces networking overhead.
- **Execution Point**: Keypresses are handled in `index.html` inside the `checkKeycode` function (lines 23-41).

## Research Findings
- **Current Port**: The command `python -m http.server` without arguments defaults to port 8000. I need to verify if any other config files exist, but none were found in a globe of .env or .json.
- **Code Entry Point**: Key presses are caught via `document.onkeypress = checkKeycode;`. The function `checkKeycode` at line 23 is the primary place to inject audio logic.
- **Audio Selection**: Web Audio API is recommended because:
    1. It's much closer to the user (client-side).
    2. No additional server-side dependencies or libraries are needed.
    3. It can easily map keys/notes to frequencies.

## Open Questions
- Does the user have a preferred port other than the default 8000? (Usually defaults to 8000 if not specified).
- Specific "mild tones" - should I provide a mapping of specific notes or just different frequencies for each keycode?
