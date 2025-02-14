;; Este arquivo "home-environment" pode ser passado para 'guix home
;; reconfigure' para reproduzir o conteúdo do seu perfil. Isto é "simbólico":
;; ele apenas especifica nomes de pacotes. Para reproduzir exatamente o mesmo
;; perfil, você também precisa capturar os canais que estão sendo usados,
;; conforme retornado por "guix describe".
;; Veja a seção "Replicando Guix" no manual.

(use-modules (gnu home)
	     (gnu packages)
	     (gnu services)
	     (guix gexp)
	     (gnu home services shells)
	     (gnu home services dotfiles))

(home-environment
  ;; Abaixo está a lista de pacotes que aparecerão no seu
  ;; perfil pessoal, em ~/.guix-home/profile.
  (packages (specifications->packages 
	      (list "waybar"
		    "i3status-rust"
		    "fuzzel"
		    "foot"
		    "dmenu"
		    "wlogout"
		    "nm-tray"
		    "swaybg"
		    "swaynotificationcenter"
		    "octave"
		    "slurp"
		    "grim"
		    "swappy"
		    "wireplumber"
		    "playerctl"
		    "brightnessctl"
		    "wl-clipboard"
		    "cliphist"
		    "udiskie"
		    "gammastep"
		    ;;"blueman"
		    "mate-polkit"

		    "qt5ct"
		    "qt6ct"

		    "font-fira-sans"
		    "font-fira-mono"
		    "font-fira-code"
		    "font-awesome"

		    ;;"neovim"
		    "lf"
		    ;;"ctpv"

		    "gimp"
		    "libreoffice" "hunspell"
		    "strawberry"
		    "ghostwriter"
		    "zathura"
		    "krita"

		    "qutebrowser"
		    "luakit"

		    "rclone"
		    "octave"
		    "virt-viewer"
		    "pavucontrol-qt"
		    "pcmanfm-qt"
		    "freerdp"
		    "htop"
		    "xsane"
		    "lm-sensors"
		    "unzip"
		    "nicotine+"
		    "qbittorrent")))

  ;; Abaixo está a lista de serviços Home. Para procurar por serviços
  ;; disponíveis, execute 'guix home search KEYWORD' em um terminal.
  (services
    (append (list (service home-bash-service-type)
		  (service home-dotfiles-service-type
			   (home-dotfiles-configuration
			     (layout 'plain)
			     (directories `("files")))))
	    %base-home-services)))
