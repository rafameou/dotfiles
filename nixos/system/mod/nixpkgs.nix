{ inputs, pkgs, ... }:
{
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })

      (final: prev: {
        xfce = prev.xfce.overrideScope (
          gfinal: gprev: {
            xfdesktop = gprev.xfdesktop.overrideAttrs (oldAttrs: {
              patches = (oldAttrs.patches or []) ++ [
                ./0001-Fix-the-broken-background-picture-setup-on-Wayland.patch
              ];
            });
          }
        );
      })

      /*
        (final: prev: {
        nixpkgs-stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.system};
        nixpkgs-unstable = inputs.nixpkgs-unstable-legacyPackages.${pkgs.system};
        nixpkgs-master = inputs.nixpkgs-master.legacyPackages.${pkgs.system};
        nixpkgs-staging-next = inputs.nixpkgs-staging-next.legacyPackages.${pkgs.system};
        })
      */

      (final: prev: { flameshot = prev.flameshot.override { enableWlrSupport = true; }; })

      (
        self: super:
        let
          img-clip-nvim = super.vimUtils.buildVimPlugin {
            name = "img-clip-nvim";
            src = inputs.img-clip-nvim;
          };
        in
        {
          vimPlugins = super.vimPlugins // {
            inherit img-clip-nvim;
          };
        }
      )
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };
}
