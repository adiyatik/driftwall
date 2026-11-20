# Driftwall

Live wallpapers for macOS: animated shaders, videos and GIFs running behind your desktop icons. Most of the built-in wallpapers react to your cursor.

![Some of Driftwall's built-in wallpapers](docs/wallpapers.png)

## Features

- **18 built-in wallpapers**, rendered with Metal. Many are minimal and follow your cursor: Graphite Dots, Gravity Grid, Halftone, Deep Stars, Magnet Field, Night Rain and more.
- **Your own media:** drag in MP4, MOV, GIF, APNG, WebP, HEIC, PNG or JPEG files.
- **Light on battery:** a frame-rate cap, an auto-drop to 15 fps when the Mac runs hot, and pausing when windows cover the screen, on battery or in Low Power Mode.
- **Multi-display:** each screen gets its own wallpaper window, rebuilt automatically when displays change.
- **Menu bar app:** pause, switch wallpapers or quit from the menu bar. Closing the dashboard keeps the wallpaper running.
- **Your normal wallpaper is never touched.** It comes back as soon as Driftwall quits.

### Built-in wallpapers

Aurora · Plasma Flow · Ripple Pool · Dusk Gradient · Graphite Dots · Mono Rings · Navy Lines · Slate Contours · Magnet Field · Gravity Grid · Halftone · Deep Stars · Slate Tiles · Night Rain · Blocklands · Orbit · Signal Lines · Lantern Fog

## Install

You need macOS 13 Ventura or newer and Apple's Command Line Tools (Swift 5.9+).

```bash
xcode-select --install          # skip if you already have Xcode / the tools
git clone https://github.com/adiyatik/driftwall.git
cd driftwall
chmod +x build_app.sh
./build_app.sh --install        # builds, copies to /Applications and launches
```

Full instructions, settings and troubleshooting are in **[INSTALL.md](INSTALL.md)**.

## Project layout

```
Sources/Driftwall/
  DriftwallApp.swift      app entry, dashboard window + menu bar
  WallpaperEngine.swift   per-display windows, pausing, frame pacing
  LibraryStore.swift      wallpaper library + settings
  MediaImporter.swift     importing your own videos / images
  Renderers/              Metal shaders, video, image and GIF renderers
  UI/                     SwiftUI dashboard + menu bar
Support/                  Info.plist and the icon generator
build_app.sh              one-command build + install
```

## Made by

[adi](https://aidaid.lol)
