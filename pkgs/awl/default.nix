# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "1nnl2s6jlxdkhbn8my4bqd3f8nab3c1k2k9m0h3rmksgg99j348s";
    x86_64-linux = "14w4ww0hc259wwmnwpzfwc61cgdyq1cs854sbz9lygzxf5grwg8f";
    armv6l-linux = "1gwjjirlhmf29j4lx4y9ssj0ar8a2y3vmqskryzk5xqia4r4la6y";
    aarch64-linux = "099nh20dapxwscrlpxb630m1i6gyxmsig529m864jknw3dhk0mfz";
    x86_64-darwin = "1bknr54ahh7flxaqx19y8b7mpf52qm1si49l7jg084d7zqwrgh2h";
    aarch64-darwin = "1bknr54ahh7flxaqx19y8b7mpf52qm1si49l7jg084d7zqwrgh2h";
  };

  urlMap = {
    i686-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.13/awl_Linux_i386.tar.gz";
    x86_64-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.13/awl_Linux_amd64.tar.gz";
    armv6l-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.13/awl_Linux_arm.tar.gz";
    aarch64-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.13/awl_Linux_arm64.tar.gz";
    x86_64-darwin = "https://git.froth.zone/sam/awl/releases/download/v0.6.13/awl_MacOS_all.tar.gz";
    aarch64-darwin = "https://git.froth.zone/sam/awl/releases/download/v0.6.13/awl_MacOS_all.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "awl";
  version = "0.6.13";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./awl $out/bin/awl
    installManPage ./docs/awl.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "A DNS query client";
    homepage = "https://dns.froth.zone/awl";
    license = lib.licenses.bsd3;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
