{ projectName, ... }: let
  # Helper functions
  hydraLib = rec {
    inherit cfg;
  };

  jobsets = import (./projects + "/${projectName}.nix") { inherit hydraLib; };
in {
  jobsets = derivation {
    name = "${projectName}-spec.json";
    system = builtins.currentSystem;

    builder = "/bin/sh";
    args = [
      (builtins.toFile "spec-builder.sh" ''
        echo '${builtins.toJSON (builtins.mapAttrs (_: v: hydraLib.cfg.defaultJobset // v) jobsets)}' > "$out"
      '')
    ];
  } // {
    meta.maintainers = hydraLib.cfg.jobsetMaintainers;
  };
}
