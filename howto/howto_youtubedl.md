## How to download youtube audio

YouTube-DL is available for both CentOS/RHEL/Fedora and Ubuntu/Debian/ derivatives and it can be easily installed by using the following commands:

install on fedora test


```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install ffmpeg ffmpeg-devel
```


```
$ sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
$ sudo chmod a+rx /usr/local/bin/youtube-dl
```

Youtube-dl has quite an extensive "help" page and if you want to review it, simply type

> youtube-dl --help

If you are looking for a specific option, I recommend using the “grep” utility and search for specific word as shown.

> youtube-dl --help | grep extract-audio

Now to download a video as mp3 track, we need the following two options:

--extract-audio (short option -x) – Convert video files to audio-only files.
--audio-format  – specifies the audio format in which the file will be downloaded. The supported audio formats are “best”, “aac”, “vorbis”, “mp3”, “m4a”, “opus”, or “wav”; “best” is set by default
To download a video as mp3 file, you can use one of the following commands:

> youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=jwD4AEVBL6Q


encode mp3 files in batch to Audio: mp3, 48000 Hz, stereo, fltp, 192 kb/s

```bash
for i in *.mp3; do ffmpeg -i "$i" -c:a libmp3lame -b:a 192k  tmp.mp3 && mv tmp.mp3 "$(basename "$i"-192 .mp3)".mp3  ; done
get rid of spaces
rename "s/ *//g" *.mp3

```
