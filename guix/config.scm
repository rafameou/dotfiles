;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu) (gnu services linux))
(use-modules (rosenthal services networking))
(use-modules (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups desktop networking ssh xorg)
;;(use-package-modules wm)

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "pt_BR.utf8")
  (timezone "America/Sao_Paulo")
  (keyboard-layout (keyboard-layout "br"))
  (host-name "oshawott")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
		  (name "rafameou")
		  (comment "Rafael Mazzutti")
		  (group "users")
		  (home-directory "/home/rafameou")
		  (supplementary-groups '("wheel" "netdev" "audio" "video")))
		%base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (list (specification->package "git")
			  (specification->package "neovim")
			  (specification->package "labwc")
        (specification->package "flatpak")
        
        (specification->package "xfce4-places-plugin")
        (specification->package "xfce4-weather-plugin"))
		    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
    (append (list (service xfce-desktop-service-type)
	    (service cups-service-type)
      (service bluetooth-service-type)
      (service gnome-keyring-service-type)
      (service tailscale-service-type)
		  (service zram-device-service-type
			   (zram-device-configuration
			     (size "8G")
			     (compression-algorithm 'zstd)))
		  (set-xorg-configuration
		    (xorg-configuration (keyboard-layout keyboard-layout)))

      ;; substitutes for rosenthal
      (simple-service 'guix-moe guix-service-type
        (guix-extension
          (authorized-keys
          (list (plain-file "guix-moe-old.pub"
                  "(public-key (ecc (curve Ed25519) (q #374EC58F5F2EC0412431723AF2D527AD626B049D657B5633AAAEBC694F3E33F9#)))")
                ;; New key since 2025-10-29.
                (plain-file "guix-moe.pub"
                  "(public-key (ecc (curve Ed25519) (q #552F670D5005D7EB6ACF05284A1066E52156B51D75DE3EBD3030CD046675D543#)))")))
          (substitute-urls
          '("https://cache-cdn.guix.moe")))))

	    ;; substitutes for non-guix
	    (modify-services %desktop-services
          (guix-service-type config => (guix-configuration
            (inherit config)
            (substitute-urls
              (append (list "https://substitutes.nonguix.org")
                %default-substitute-urls))
             (authorized-keys
               (append (list (local-file "./signing-key.pub"))
                %default-authorized-guix-keys)))))))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "f2574144-806a-44d6-b020-8a569381040a")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "9EED-5315"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "7645536e-a9df-4876-996a-1b6407013175"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
