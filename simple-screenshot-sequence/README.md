# simple_screenshot_sequence.lua

This script takes a sequence of equispaced screenshots, where you can set the number of screenshots and the video fragment to which it will be applied (even 100% of the video). The script is based on [Arieleg's script](https://github.com/Arieleg/mpv-takeSsSequence) but rewritten in Lua with a config file and the key binding changed to `ctrl+shift+t`.

## Requirements

None.

## Installation

Put the `simple_screenshot_sequence.lua` file in the script folder (usually in `~/.config/mpv/scripts/` or `%APPDATA%\mpv\scripts\` on Windows) and the `simple_screenshot_sequence.conf` file in the config folder (usually in `~/.config/mpv/script-opts/` or `%APPDATA%\mpv\script-opts\` on Windows). Be sure to set the desired settings for the [screenshots](https://mpv.io/manual/stable/#screenshot) in your `mpv.conf` file.

## Configuration

Go to the config file, and change the option `n` to the number of screenshots you want (the default value is 12 screenshots). The option `st` *(start)* defines the first screenshot, which is at 5% of the video. The option `ed` *(end)* is set to 95% that doesn't define exactly the last screenshot, this option is used to define how often a screenshot is taken (`step` variable in `simple_screenshot_sequence.lua`), so the last screenshot in this case is at *end - step*, which is at 87.5% approximately or exactly 87.454835199982% of the video.

## Screenshots

[simple_screenshot_sequence.webm](https://github.com/user-attachments/assets/02600e18-ee68-45a5-bea5-a987248ae825)

## Changelog

### v1.0

- Initial release.
