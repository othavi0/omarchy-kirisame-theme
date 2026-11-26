# Repository Guidelines

## Project Structure & Module Organization
- Targets Omarchy 4. `colors.toml` is the source: Omarchy generates the terminal configs, `hyprland.lua` (window borders from `hyprland_active_border`), the omarchy-shell `shell.toml`, and the Neovim/VS Code/Helix/Obsidian themes from it via `/usr/share/omarchy/default/themed/*.tpl`.
- `shell.<section>.toml` replaces that whole section of the generated `shell.toml` (e.g., `shell.menu.toml` replaces `[menu]`). The body has no `[section]` header, and text keys (`text`, `selected-text`) take hex only.
- A theme installed from git never ships `*.lua`, `vscode.json`, `alacritty.toml`, `foot.ini`, `ghostty.conf` or `kitty.conf`: Omarchy drops them and regenerates from `colors.toml`. Do not add them; Window shape and opacity go in the README as Omarchy commands (`omarchy hyprland corners`, `omarchy hyprland window transparency`).
- The theme ships no manual extras and no `btop.theme`, `chromium.theme` or `icons.theme`: Omarchy generates those from `colors.toml`.
- Kirisame is a rebuild of Amekoji (atif-1402/omarchy-amekoji-theme) for Omarchy 4. Surfaces stay solid: every `background-alpha` in `shell.*.toml` is `1.0`.
- `backgrounds/` contains the bundled wallpapers used by the theme. Omarchy scans this directory and treats every image in it as a selectable wallpaper — never put non-wallpaper assets here.
- `.github/assets/` holds README-only assets (palette SVG, wallpaper thumbnails).
- `scripts/` holds the palette generator and the README integrity checker.
- `preview.png` is the visual snapshot used in the README.

## Build, Test, and Development Commands
This repo is configuration-only; there is no build system or automated test runner.
- Install the theme with Omarchy: `omarchy-theme-install https://github.com/othavi0/omarchy-kirisame-theme`.
- For local iteration, edit the installed copy in `~/.config/omarchy/themes/kirisame/`, run `omarchy-theme-set kirisame`, and open the menu with Super+Space to check `shell.menu.toml`.

## Coding Style & Naming Conventions
- Follow the existing formatting in each file type; do not reformat unrelated sections.
- Indentation: `shell.*.toml` aligns `=` in one column like the generated `shell.toml`.
- Colors use hex (`#dcd6d6`). Gradient values (`hyprland_active_border`, `border` in `shell.*.toml`) are space-separated colors plus an angle, and each color is `rgb(RRGGBB)` or `rgba(RRGGBBAA)` with no spaces inside the parentheses.
- Keep filenames descriptive and lowercase, especially for wallpapers in `backgrounds/`.

## Testing Guidelines
- Run `python3 scripts/check_readme.py` after touching the README or renaming any asset; it fails if a referenced path is missing or a theme file is undocumented.
- After changing `colors.toml`, run `python3 scripts/gen_palette.py` to redraw the palette, and update the same hex values by hand in the `shell.*.toml` files.
- No other automated tests are defined.
- Verify changes visually in the target app and update `preview.png` when the UI changes.
- Neovim has no file here: Omarchy generates `neovim.lua` from `colors.toml` (aether.nvim), so check Neovim colors by changing `colors.toml`.
- Check what Omarchy resolves from `colors.toml` with `omarchy-theme-color --file colors.toml --all`.

## Commit & Pull Request Guidelines
- Commit history is short and direct (e.g., “update readme”, “color corrections”); keep messages concise and action-focused.
- In PRs, list the files/apps affected and include screenshots when UI output changes.
- If you add or rename assets, update the README’s “What’s included” or wallpapers table accordingly.
