# go 🐹

The new popular boy in the tech landscape.

## `fmt` formatting opts

When using functions from the `fmt` package, there are some formatting codes one must use to print out values to the console. Eg.:

```go
package main

type User struct {
  Id   int
  Name string
}

func main() {
  user := User{Id: 123, Name: "Joel"}

  fmt.Println("User: %+v", user) // => {Id:123 Username:joeljuca}
}
```

At first sight, the question that comes to mind is: **WTF is `%+v`?**

Below I list these notations and WTF each of them are.

### General

- **`%v`:** the value in a default format when printing structs
  - **`%+v`:** same as `%v` but adds field names
- **`%#v`:** a Go-syntax representation of the value
- **`%T`:** a Go-syntax representation of the type of the value
- **`%%`:** a literal percent sign; consumes no value

### Boolean

- **`%t`:** the word true or false

### Integer

- **`%b`:** base 2
- **`%c`:** the character represented by the corresponding Unicode code point
- **`%d`:** base 10
- **`%o`:** base 8
- **`%O`:** base 8 with 0o prefix
- **`%q`:** a single-quoted character literal safely escaped with Go syntax
- **`%x`:** base 16, with lower-case letters for `a-f`
- **`%X`:** base 16, with upper-case letters for `A-F`
- **`%U`:** Unicode format: `U+1234`; same as `U+%04X`

See: [pkg.go.dev/fmt](https://pkg.go.dev/fmt)
