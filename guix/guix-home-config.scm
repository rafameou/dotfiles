;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (gnu system shadow)

  #:use-module (nongnu packages password-utils)
  #:use-module (nongnu packages editors)
  #:use-module (nongnu packages messaging)

  #:use-module (radix packages toys)

  #:use-module (sijo packages github-cli))

(define home-config
  (home-environment
  ;; Abaixo está a lista de pacotes que aparecerão no seu
  ;; perfil pessoal, em ~/.guix-home/profile.
    (packages (specifications->packages 
	      (list "foot"
		    "glib:bin"
        "fuzzel"
        "swaylock"

		    "gimp"
		    "libreoffice" "hunspell"
		    "strawberry"
		    "zathura"
        "vlc"

        "flameshot"

		    "librewolf"
		    "ungoogled-chromium"

        "telegram-desktop"

		    "rclone"
		    "octave"
		    "htop"
		    "xsane"
		    "lm-sensors"
		    "unzip"
		    "nicotine+"
		    "qbittorrent"
        
        ;; nongnu
        "bitwarden-desktop"
        "vscodium"
        "signal-desktop"
        
        ;;radix
        "wayneko"
        
        ;;sijo
        "github-cli")))
    (services
      (append
        (list
          ;; Uncomment the shell you wish to use for your user:
          ;(service home-bash-service-type)
          ;(service home-fish-service-type)
          ;(service home-zsh-service-type)

          (service home-files-service-type
           `((".guile" ,%default-dotguile)
             (".Xdefaults" ,%default-xdefaults)))

          (service home-xdg-configuration-files-service-type
           `(("gdb/gdbinit" ,%default-gdbinit)
             ("nano/nanorc" ,%default-nanorc))))

        %base-home-services))))

home-config