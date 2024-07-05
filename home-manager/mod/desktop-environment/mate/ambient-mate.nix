{ lib
, fetchFromGitHub
, stdenv
, gnome-icon-theme
, gtk3
, hicolor-icon-theme
, humanity-icon-theme
}:

stdenv.mkDerivation rec {
  pname = "ambiant-mate";
  version = "22.04.2";

  src = fetchFromGitHub {
    owner = "lah7";
    repo = "Ambiant-MATE";
    rev = "${version}";
    sha256 = "sha256-aartl7KYMFoUsW8RoF27/BRL/i6Mpy+WhVG8F0A8QRA=";
  };

  #dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share
    cp -a usr/share/themes $out/share/
    cp -a usr/share/icons $out/share/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Ubuntu MATE theme";
    homepage = "https://github.com/lah7/Ambiant-MATE";
    license = licenses.cc-by-sa-30;
    platforms = platforms.linux;
    maintainers = with maintainers; [ rafameou ];
  };
}
