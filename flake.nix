{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, utils, ... }@inputs: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      devPkgs = with pkgs; [
        awscli2
        nodePackages.typescript
        nodePackages.typescript-language-server
      ];
      runtimePkgs = with pkgs; [
        nodejs
        nodePackages.npm
      ];
      runtime = pkgs.buildEnv {
        name = "dev-env";
        paths = runtimePkgs;
      };
      runserver = pkgs.writeShellScriptBin "run" ''
        ${runtime}/bin/npx concurrently 'npm run dev' 'npx ampx sandbox'
      '';
    in {
      devShell = pkgs.mkShell {
        buildInputs=devPkgs ++ runtimePkgs;
      };
      apps = {
        default = {
          type = "app";
          program = "${runserver}/bin/run";
        };
      };
    }
  );
}
