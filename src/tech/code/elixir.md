# elixir 💜

The most pleasant programming language and runtime I've worked with through my entire career.

## Installing Phoenix

[Phoenix](https://phoenixframework.org/) is the most used Elixir framework for web development. Below is a series of commands required to install the Phoenix project bootstrapper (`mix phx.new`), extracted from its official documentation:

```sh
# Ensure Hex is installed
mix local.hex

# Installs the project bootstrapper
mix archive.install hex phx_new
```

## LiveView

In 2025, LV (short for LiveView) is a thing. In this section I list the things I've been systematically learning about it.

### The bare minimal

A LiveView is an Elixir module that `use Phoenix.LiveView` and implements a fn `render/1`:

```ex
# file: lib/hello.ex

MyApp.Hello do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <p>Hello there!</p>
    """
  end
end
```

The param `assigns` is a map. You won't use it directly; instead, you'll use special syntax, like `@name`, to use values coming in it.

> 💡 It is best practice to suffix LV modules and files with "Live"; so we'd do `MyApp.HelloLive` instead, in a file named `hello_live.ex`.

Phoenix has some built-in facilities to integrate your LVs with Phoenix' default layouts, so instead of `use Phoenix.LiveView` directly, in Phoenix you'd do `use MyWeb, :live_view`:

```ex
# file: lib/hello_live.ex

MyApp.HelloLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <p>Hello there!</p>
    """
  end
end
```

To see it in action, you'd have to set up a route in `lib/my_app_web/router.ex`:

```ex
defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  # (...)

  # Below is the important part: the main `scope`
  scope "/", MyAppWeb do
    pipe_through :browser

    # (...)

    # Live routes are set like this
    live "/hi", HelloLive

    # Live routes accepting params look like this
    live "/hi/:name", HelloLive
  end

  # (...)
end
```

There it is. You'll be able to see it in action at http://localhost:4000/hi.
