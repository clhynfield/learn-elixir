# Learn Elixir

## Install

Using nix-shell, add `elixir_1_16` to shell.nix:

```nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    …
    elixir_1_16
    …
  ];
}
```

And then start `nix-shell`:

```shell-session
~/workspace/learn-elixir master*
❯ nix-shell

~/workspace/learn-elixir master*
nix-shell ❯
```

## Check version

```shell-session
~/workspace/learn-elixir master*
nix-shell ❯ elixir --version
Erlang/OTP 25 [erts-13.2.2.4] [source] [64-bit] [smp:10:10] [ds:10:10:10] [async-threads:1]

Elixir 1.16.0 (compiled with Erlang/OTP 25)
```

## Try interactive mode

```shell-session
~/workspace/learn-elixir master*
nix-shell ❯ iex
Erlang/OTP 25 [erts-13.2.2.4] [source] [64-bit] [smp:10:10] [ds:10:10:10] [async-threads:1]

Interactive Elixir (1.16.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 2+3
5
iex(2)> 2+3 == 5
true
iex(3)> String.length("The quick brown fox jumps over the lazy dog")
43
iex(4)>
```

To exit the interactive mode, press `Ctrl+C` twice.

## Basic data types

### Integer

```shell-session
iex(1)> 123
123
iex(2)> 0x1F
31
iex(3)> 0b1010
10
iex(4)> 0o777
511
```

### Float

```shell-session
iex(1)> 3.14
3.14
iex(2)> .14
** (SyntaxError) invalid syntax found on iex:2:1:
    error: syntax error before: '.'
    │
  2 │ .14
    │ ^
    │
    └─ iex:2:1
    (iex 1.16.0) lib/iex/evaluator.ex:294: IEx.Evaluator.parse_eval_inspect/4
    (iex 1.16.0) lib/iex/evaluator.ex:187: IEx.Evaluator.loop/1
    (iex 1.16.0) lib/iex/evaluator.ex:32: IEx.Evaluator.init/5
    (stdlib 4.3.1.3) proc_lib.erl:240: :proc_lib.init_p_do_apply/3
iex(2)> 1.0e-10
1.0e-10
```

### Boolean

```shell-session
iex(1)> true
true
iex(2)> false
false
```

### Atom

An atom is a constant whose name is its value. If you’re familiar with Ruby, these are synonymous with Symbols:

```shell-session
iex(1)> :foo
:foo
iex(2)> :foo == :bar
false
```

Note that the booleans `true` and `false` are actually atoms in Elixir:

```shell-session
iex(3)> is_atom(true)
true
iex(4)> is_boolean(:true)
true
iex(5)> :true === true
true
```

Names of modules, functions, and named arguments are atoms:

```shell-session
iex(6)> is_atom(MyApp.MyModule)
true
iex(7)> :crypto.strong_rand_bytes 3
<<222, 209, 2>>
```

### String

Strings in Elixir are UTF-8 encoded and are wrapped in double quotes:

```shell-session
iex(1)> "Hello!"
"Hello!"
iex(2)> "Écôle"
"Écôle"
```

Strings support line breaks and escape sequences:

```shell-session
iex(3)> "foo
...(3)> bar"
"foo\nbar"
iex(4)> "foo\nbar"
"foo\nbar"
```

## Basic operations

### Arithmetic operations

```shell-session
iex(1)> 2 + 2
4
iex(2)> 2 - 1
1
iex(3)> 2 * 5
10
iex(4)> 10 / 5
2.0
```

Elixir has handy functions for integer division and getting the remainder:

```shell-session
iex(5)> div(10, 5)
2
iex(6)> rem(10, 3)
1
```

### Boolean operations

```shell-session
iex(1)> true && true
true
iex(2)> false && false
false
iex(3)> true || false
true
```

These operators also support any type:

```shell-session
iex(4)> 1 && true
true
iex(5)> 1 && 2
2
iex(6)> -20 || true
-20
```

There are two more operators for working with booleans: `and` and `or` whose
first operand must be a boolean:

```shell-session
iex(7)> true and true
true
iex(8)> true or false
true
iex(9)> 1 and true
** (BadBooleanError) expected a boolean on left-side of "and", got: 1
    iex:6: (file)
```

Note: Elixir’s `adn` and `or` actually map to `andalso` and `orelse` in Erlang.

### Comparison operators

```shell-session
iex(1)> 1 == 1
true
iex(2)> 1 != 2
true
iex(3)> 1 < 2
true
iex(4)> 1 <= 2
true
iex(5)> 1 > 2
false
```

For strict comparison, you can use `===` and `!==`:

```shell-session
iex(6)> 1 == 1.0
true
iex(7)> 1 === 1.0
false
iex(8)> 1 !== 1.0
true
```

Any two types may be compared, and the comparison is based on their sort order:

```shell-session
iex(9)> 1 < :atom
true
iex(10)> 1 < "string"
true
iex(11)> :atom < "string"
true
```

### String interpolation

```shell-session
iex(1)> name = "Sean"
"Sean"
iex(2)> "Hello, #{name}"
"Hello, Sean"
```

### String concatenation

```shell-session
iex(3)> name = "Sean"
"Sean"
iex(4)> "Hello, " <> name
"Hello, Sean"
```
