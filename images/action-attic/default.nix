{
  docker-nixpkgs,
  pkgs,
  attic-client,
  nodejs_24,
  nix-fast-build,
  findutils,
  util-linux,
}:
(docker-nixpkgs.nix.override {
  nix = pkgs.nixVersions.latest;

  extraContents = [
    attic-client
    nodejs_24
    nix-fast-build
    findutils
    util-linux
  ];
}).overrideAttrs
  (prev: {
    meta = (prev.meta or { }) // {
      description = "Forgejo action image, with Nix and Attic client";
    };
  })
