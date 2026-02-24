# homebrew-tools

A custom [Homebrew](https://brew.sh/) tap for my personal tools and utilities.

## Available Tools

| Tool | Description |
| --- | --- |
| **[mac-port-bar](https://github.com/lfx/mac-port-bar)** | A lightweight macOS menu bar utility that automatically scans for and lists locally running HTTP services. |

*(More tools will be added here in the future)*

## Installation

You can install tools from this repository using the standard Homebrew commands. 

*(Note: The commands below assume this repository is hosted at `https://github.com/lfx/homebrew-tools`. Adjust `lfx` if your GitHub username is different).*

### Option 1: Tap and Install

First, tap the repository so Homebrew knows where to find the formulas:

```sh
brew tap lfx/tools
```

Then, you can install any tool from the tap just like a standard Homebrew package:

```sh
brew install mac-port-bar
```

### Option 2: Install directly

Alternatively, you can install a tool in a single command without explicitly tapping the repository first:

```sh
brew install lfx/tools/mac-port-bar
```

## Updating

Once installed, these tools will be updated automatically along with your other Homebrew packages when you run:

```sh
brew update
brew upgrade
```

To upgrade a specific tool:

```sh
brew upgrade mac-port-bar
```
