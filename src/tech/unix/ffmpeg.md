# ffmpeg 📼

[FFmpeg](https://ffmpeg.org) is a cross-platform tool to record, convert and stream audio and video. It's the de-facto standard for everything related to video processing, etc. - and I use it to perform basic video editing from the command line (yep, it's kind of using a bazooka to kill a single cockroach - but it's practical and easy to use).

## TL;DR

To convert video formats, run:

```
ffmpeg -i movie.mp4 movie.avi
```

To cut a movie from the moment _1min 23s_ up to the moment _23min 45s_, run:

```
ffmpeg -ss 01:23 -to 23:45 -i ./movie.mp4 -c copy out.mp4
```

## Usage

The `ffmpeg` command, at its most basic format, accepts an input file (with the parameter `-i`) and an output file (given as the last argument):

```
ffmpeg -i movie.mp4 movie.avi
```

That's all it needs to convert a MP4 movie to the AVI format. See the file extensions? `ffmpeg` understands that it's a convertion operation by relying on the file extensions you're providing. Pretty clever, huh?!

Well, the things I do the most is: cutting a video from moment X to moment Y. I do it mostly to edit the recordings of the meetups I ran on Elug CE. With `ffmpeg` you can do it by using the parameters `-ss <position>`. It must be used before the parameter `-i`, so it affects the decoding of the input file. So, when using `ffmpeg` to cut videos, the order of these parameters does affect how `ffmpeg` works.

The value `<position>` must be a time duration specification

Here's an example of how

```
ffmpeg -ss 01:23 -t 23:45 -i ./movie.mp4 -c copy out.mp4
```

## Time duration specification

There are two syntaxes for expression time durations:

```
[-][<HH>:]<MM>:<SS>[.<m>...]
```

`HH` expresses the number of hours, `MM` the number of minutes for a maximum of 2 digits, and `SS` the number of seconds for a maximum of 2 digits. The `m` at the end expresses decimal value for `SS`.

So, if you got two numbers of two digits separated by a collon

```
[-]<S>+[.<m>...]
```

`S` expresses the number of seconds, with the optional decimal part `m`.

In both expressions, the optional `-` indicates negative duration.

### Examples

- **`55`:** 55 seconds
- **`0.2`:** 0.2 seconds
- **`200ms`:** 200 milliseconds (or 0.2s)
- **`200000us`:** 200000 microseconds, (or 0.2s)
- **`12:03:45`:** 12 hours, 03 minutes and 45 seconds
- **`23.189`:** 23.189 seconds

So, for a quick reference:

- `12:34`: 12 minutes and 34 seconds
- `01:23.567`: 1 minute, 23 seconds, and 567 milliseconds
- `12:34:56`: 12 hours, 34 minutes, and 56 seconds
- `12:34:56.789`: 12 hours, 34 minutes, 56 seconds, and 789 milliseconds

---

> -ss position (input/output)
> When used as an input option (before "-i"), seeks in this input file to position. Note that in most
> formats it is not possible to seek exactly, so ffmpeg will seek to the closest seek point before
> position. When transcoding and -accurate_seek is enabled (the default), this extra segment between
> the seek point and position will be decoded and discarded. When doing stream copy or when
> -noaccurate_seek is used, it will be preserved.
>
> When used as an output option (before an output url), decodes but discards input until the timestamps
> reach position.
>
> position must be a time duration specification, see the Time duration section in the ffmpeg-utils(1)
> manual.

---

ffmpeg -ss 11:58 -t 12:30 -i ./elug-ce-meetup-5-eceba7abc25e241c41f43a898ea32dd49a9bf71b\ on\ 2020-11-04\ 23-20.mp4 -c copy out.mp4

position must be a time duration specification, see the Time duration section in the ffmpeg-utils(1)
manual.

ffmpeg buddy: https://evanhahn.github.io/ffmpeg-buddy/
