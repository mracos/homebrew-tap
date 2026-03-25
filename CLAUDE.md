# homebrew-tap

Homebrew tap with custom formulas and casks.

## Linting (same as CI)

Run before committing:

```bash
# Style check (RuboCop with Homebrew cops)
brew style <name>

# Audit (checks desc, URLs, dependencies, etc.)
brew audit --online --git --skip-style <name>
```

Where `<name>` is the formula/cask name (e.g. `toastty`, `gws`).

To lint everything: `brew style mracos/homebrew-tap`
