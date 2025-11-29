(cons* (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
        (channel
        (name 'radix)
        (url "https://codeberg.org/anemofilia/radix.git")
        (branch "main")
        (introduction
            (make-channel-introduction
            "f9130e11e35d2c147c6764ef85542dc58dc09c4f"
            (openpgp-fingerprint
                "F164 709E 5FC7 B32B AEC7  9F37 1F2E 76AC E3F5 31C8"))))
        (channel
        (name 'sijo)
        (url "https://git.sr.ht/~simendsjo/dotfiles")
        (branch "main")
        (introduction
            (make-channel-introduction
            "c352f7331b1722b2ffb964572c7f7fbec585bd2f"
            (openpgp-fingerprint
                "B0F2 D6C5 2936 95FD 57B5  D255 77BC 6345 B65D 6CFB"))))
       %default-channels)