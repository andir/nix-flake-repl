# Nix Flake Repl

The forgotten feature.

## Usage

```
{
  inputs.nix-flake-repl.url = "github:andir/nix-flake-repl";
  outputs = { self, nix-flake-repl }: {
    defaultApp.x86_64-linux = nix-flake-repl.defaultApp.x86_64-linux;
  };
}
```


## Credits

All credits go to @Ma27 for pointing this out in https://github.com/NixOS/nix/issues/3803.
