# PlayDSD

Lyrion Music Server (LMS) plugin: **DSD (DSF / DFF)**. Adds DSD file support: tags, and transcoding to PCM / FLAC / MP3 (DSD is decoded to 176.4 kHz 24 bit).

## Features

- File types: `dsf, dff`
- Discogs release id (tag such as `DISCOGS_RELEASE_ID`) is used as the album id, so different releases of the same album / artist are not merged into one album
- Scanner-safe registration (`Register.pm`): the tag handler is registered both in the server and in the scanner (`Importer.pm`), without any web / UI dependency
- DSD is converted by ffmpeg to PCM (`s24le` at 176.4 kHz), FLAC or MP3
- Transcoding through `ffmpeg` (and `lame` for MP3 output) via `custom-convert.conf`; FLAC is preferred over PCM

## Requirements

- Lyrion Music Server 7.7 or newer (developed on 9.1.1)
- `ffmpeg`, `lame` (MP3 output) available to the server

## Installation

Copy the `PlayDSD` folder into the `Plugins` directory of the server cache (for example `/config/cache/Plugins`), then restart Lyrion and rescan the library.

## Files

| File | Purpose |
| --- | --- |
| `install.xml` | Plugin manifest |
| `Plugin.pm` | Server plugin, registers the handler |
| `Importer.pm` | Scanner entry point |
| `Register.pm` | Registers the tag handler (shared by server and scanner) |
| `Formats/` | Tag handler for the file type |
| `custom-convert.conf` | Transcoding rules |
| `strings.txt` | Text strings |

## Version

1.0

## Author

nicos
