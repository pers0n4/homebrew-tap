# Homebrew Tap

Install [Deltavee](https://github.com/pers0n4/deltavee), a menu bar monitor for Claude and Codex subscription usage. Requires Apple Silicon and macOS 26 or later.

```sh
brew install --cask pers0n4/tap/deltavee
brew upgrade --cask pers0n4/tap/deltavee
```

Homebrew installs the app in `/Applications` by default. If you already have a manually installed copy, quit it and remove that app copy before switching to Homebrew. Keep your Application Support data to retain settings.

The cask does not configure the optional [Claude statusline hook](https://github.com/pers0n4/deltavee#configuring-the-claude-statusline-hook). If you use it, copy the bundled hook from the Homebrew-installed app after each upgrade. Use `/Applications/Deltavee.app` as the source instead of `~/Applications/Deltavee.app`, unless you chose a different app directory.

To uninstall the app while keeping its data, turn off launch at login, quit the app, then run `brew uninstall --cask pers0n4/tap/deltavee`. See [Deltavee’s uninstall instructions](https://github.com/pers0n4/deltavee#uninstall) for removing an optional hook or app data separately.
