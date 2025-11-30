# Personal NixOS Flake

## NixOS

```sh
mkdir ~/.config/nix/
echo "extra-experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
nh os switch . --hostname xyz
```

## Guix

```sh
cd guix
guix pull -C channels.scm
sudo guix system reconfigure config.scm
guix home reconfigure guix-home-config.scm
```

## To-do list

## Places I stole code/info from.
- https://github.com/Misterio77/nix-starter-configs
- https://nixos.org/manual/nixos/unstable/
- https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/
