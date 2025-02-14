(use-modules (guix ci))

(cons* (channel
	 (name 'efraim-dfsg)
	 (url "https://git.sr.ht/~efraim/my-guix")
	 ;; Enable signature verification:
	 (introduction
	   (make-channel-introduction
	     "61c9f87404fcb97e20477ec379b643099e45f1db"
	     (openpgp-fingerprint
	       "A28B F40C 3E55 1372 662D  14F7 41AA E7DC CA3D 8351"))))
       channel-with-substitutes-available 
       %default-guix-channel 
       "https://ci.guix.gnu.org")
