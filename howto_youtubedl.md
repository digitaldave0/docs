## How to download youtube audio

YouTube-DL is available for both CentOS/RHEL/Fedora and Ubuntu/Debian/ derivatives and it can be easily installed by using the following commands:

```
$ sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
$ sudo chmod a+rx /usr/local/bin/youtube-dl
```

Youtube-dl has quite an extensive "help" page and if you want to review it, simply type

> # youtube-dl --help

If you are looking for a specific option, I recommend using the “grep” utility and search for specific word as shown.

> youtube-dl --help | grep extract-audio

Now to download a video as mp3 track, we need the following two options:

--extract-audio (short option -x) – Convert video files to audio-only files.
--audio-format  – specifies the audio format in which the file will be downloaded. The supported audio formats are “best”, “aac”, “vorbis”, “mp3”, “m4a”, “opus”, or “wav”; “best” is set by default
To download a video as mp3 file, you can use one of the following commands:

