# [shell](https://en.wikipedia.org/wiki/Shell_script)

All things command-line wizardry.

## Infinite loop

You'll often need to run a command over and over again for some reason (mine right now is: I have to check if a file exists). There are obviously better options - but doing things through command-line [ninjutsu](https://en.wikipedia.org/wiki/Ninjutsu) is always funnier. So, one-line infinite loops in Shell (both sh and Bash):

```sh
while true; do echo "Hello!" && sleep 1 done
```

This will run `echo "Hello!"` forever, "sleeping" for one second between each execution.
