# Installing Driftwall

Driftwall ships as source code plus a one-command build script. Building on your own Mac takes about a minute and produces a normal `Driftwall.app` in `/Applications`.

## Requirements

- macOS 13 Ventura or newer (Apple silicon or Intel)
- Apple's Command Line Tools with Swift 5.9+ (free, ~1 GB). Full Xcode also works.

## Steps

1. **Install the Command Line Tools** (skip if you already have Xcode or ran this before):

   ```
   xcode-select --install
   ```

   Click *Install* in the dialog and wait for it to finish. Check with `swift --version` — it should print 5.9 or higher.

2. **Get the code** — either clone it:

   ```
   git clone https://github.com/adiyatik/driftwall.git ~/Downloads/Driftwall
   ```

   or click **Code → Download ZIP** on GitHub and unzip it into your Downloads folder.

3. **Open Terminal** and go into the folder:

   ```
   cd ~/Downloads/Driftwall
   ```

4. **Build and install:**

   ```
   chmod +x build_app.sh
   ./build_app.sh --install
   ```

   This compiles a release build, assembles `Driftwall.app`, signs it ad-hoc, copies it to `/Applications` and launches it. Leave off `--install` to only build into `build/Driftwall.app`.

5. **Use it.** The dashboard opens and the Aurora wallpaper starts behind your desktop icons. A menu bar icon (stacked photos) gives Pause, wallpaper switching and Quit.

## Using your own media

- Drag MP4, MOV, M4V, GIF, APNG, WebP, HEIC, PNG, JPEG or TIFF files onto the dashboard window, or click the dashed *Add media* card.
- Files are copied into `~/Library/Application Support/Driftwall/Media/`; your originals are never touched.
- Right-click an item for *Reveal in Finder* or *Remove*.
- Best results: HEVC (H.265) or H.264 MP4 at your screen's resolution, 24–30 fps, a few seconds to a minute long, looping cleanly.

## Settings (bottom bar)

| Setting | Default | Effect |
| --- | --- | --- |
| Frame rate | 30 fps | Cap for shader wallpapers (auto-drops to 15 when the Mac runs hot) |
| Pause on battery | Off | Stops animation when unplugged |
| Pause when covered | On | Stops a screen's rendering when windows fully cover it |
| Pause in Low Power Mode | On | Stops all animation in Low Power Mode |
| Open at login | Off | Registers Driftwall as a login item (needs the app in /Applications) |

## Troubleshooting

- **"swift: command not found"** – run step 1 again, then open a new Terminal window.
- **Build error mentioning the SDK or `MenuBarExtra`** – your tools are too old; update macOS/Command Line Tools (Software Update) or run `sudo xcode-select -s /Applications/Xcode.app` if you have Xcode.
- **Wallpaper doesn't appear on a second display** – unplug/replug or change the arrangement; Driftwall rebuilds windows on every display change.
- **A video won't import** – WebM/MKV and some codecs aren't supported by macOS. Convert to MP4 (HEVC or H.264), e.g. with QuickTime Player → File → Export As.
- **Open at login fails** – make sure you're running the copy in `/Applications`.

## Uninstall

1. Quit from the menu bar icon.
2. Delete `/Applications/Driftwall.app`.
3. Optionally delete your library: `rm -rf ~/Library/Application\ Support/Driftwall`
4. Optionally reset settings: `defaults delete app.driftwall.Driftwall`

Your normal macOS wallpaper was never changed, so it shows again as soon as Driftwall quits.
