# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  shaMap = {
    aarch64-darwin = "11jnm0209a1agqfps3zdpfxai335axvj16avs396vvaqc1rvj23m";
    aarch64-linux = "1nnh050s5jcri58krjs4n59zm11bmj906jm6fvmkjy88vd8w4smg";
    i686-linux = "19d4np5c18n6dwm3kg1yi2hd4ax5kwv9s2l70pzf7swy1bcgb3az";
    x86_64-darwin = "192wp5brjgf0av3f99hr3hy9ha360s5j150202d3fgfil39c7bln";
    x86_64-linux = "00pisiw04324s9i5mawfrfnrd65wjhdjfrmi96axw3c26fa8wq0d";
  };

  urlMap = {
    aarch64-darwin = "https://download.runway.horse/runway/1.3.5/runway_Darwin_arm64.tar.gz";
    aarch64-linux = "https://download.runway.horse/runway/1.3.5/runway_Linux_arm64.tar.gz";
    i686-linux = "https://download.runway.horse/runway/1.3.5/runway_Linux_i386.tar.gz";
    x86_64-darwin = "https://download.runway.horse/runway/1.3.5/runway_Darwin_x86_64.tar.gz";
    x86_64-linux = "https://download.runway.horse/runway/1.3.5/runway_Linux_x86_64.tar.gz";
  };

  sourceRootMap = {
    aarch64-darwin = "runway_Darwin_arm64";
    aarch64-linux = "runway_Linux_arm64";
    i686-linux = "runway_Linux_i386";
    x86_64-darwin = "runway_Darwin_x86_64";
    x86_64-linux = "runway_Linux_x86_64";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "runway";
  version = "1.3.5";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = sourceRootMap.${system};

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./runway $out/bin/runway
  '';

  system = system;

  meta = {
    description = "The runway CLI.";
    homepage = "https://runway.planetary-quantum.com/";
    license = lib.licenses.unfree;

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
