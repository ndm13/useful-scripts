# useful-scripts
Some convenient scripts for file management

## find-bad-1080.ps1
A Powershell script to find MKV files that are 1080p but are encoded in H.264.

[Generated by ChatGPT](https://github.com/ndm13/useful-scripts/raw/main/docs/chatgpt-1672527510109.png),
refined with iteration.  Only manual changes were changing the first filter
pattern from `resolution: 1920x1080` to `Pixel height: 1080` and removing piping
the errors to the log file.  Assumes that `mkvinfo` is installed at `C:\Program
Files\MKVToolNix\mkvinfo.exe` and will search the current directory and all
subdirectories for MKV files that meet the criteria, writing their names to the
terminal and to `./mkv_info.log`.
