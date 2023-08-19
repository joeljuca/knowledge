# 💻 editors

Annotations about the code editors I use.

## VS Code/Codium

The editor I use most of the time. Years of configuration tweaks and muscle memory over keyboard shortcuts!

### Error _"Cannot find runtime 'node' on PATH. Is 'node' installed?"_

I had this error when I was trying to debug a Node.js project using VS Code's built-in debugger. It happens because VS Code is unable to find `node` in your `$PATH`. No news here, but I both my Bash and Zsh configured to add `/usr/local/bin` to my `$PATH`, but no luck so far.

I never managed to fix this bug - but I found a workaround so good that this solution becomes unnecessary: running VS Code as a subprocess of your current shell.

In practice, it's quite simple actually. Just run VS Code from your command-line instead of opening it directly. Go to your project directory and run `code` from it. Ex.:

```sh
cd path/your/project
code .
```

It opens VS Code with your project directory already loaded - but the important thing is that, since you ran it from your current shell session, it will inherint your current `$PATH`, and `node` (or in my case, `nodemon`) will be there. 🙂

### Extension management from the command line

It's possible to manage VS Code extensions through the command line, using the following commands:

```
code --extensions-dir <dir>
    Set the root path for extensions.
code --list-extensions
    List the installed extensions.
code --show-versions
    Show versions of installed extensions, when using --list-extension.
code --install-extension (<extension-id> | <extension-vsix-path>)
    Installs an extension.
code --uninstall-extension (<extension-id> | <extension-vsix-path>)
    Uninstalls an extension.
code --enable-proposed-api (<extension-id>)
    Enables proposed API features for extensions. Can receive one or more extension IDs to enable individually.
```

Read more at https://code.visualstudio.com/docs/editor/extension-gallery

## Neovim

Tips and tricks for the most insane code editor out there.

### ctrlp

A Vim/Neovim plugin to open files with `Ctrl+P` and fuzzy search.

Invoke it project-wide using `Ctrl+P` or `:CtrlP`, or from a specific directory w/ `:CtrlP [directory name]`.

Once it's open:

- `<F5>` to refresh the cache (get new files, rm deleted ones, etc.)
- `<Ctrl>D` to switch between filepath-based and filename-based searching
- `<Ctrl>R` to switch to regex-based searching
