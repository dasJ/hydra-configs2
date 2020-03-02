{ hydraLib, ... }: with hydraLib; {
  master = {
    description = "node2nix master";
    nixexprinput = "node2nix";
    checkinterval = 300;
    schedulingshares = 1;
    keepnr = 1;
    inputs = {
      nixpkgs = mkNixpkgsChannel "18.03";
      node2nix = mkInput { type = "git"; value = "https://github.com/svanderburg/node2nix.git"; };
      systems = mkInput { type = "nix"; value = ''[ "i686-linux" "x86_64-linux" "x86_64-darwin" ]''; };
    };
  };

  nijs-master = {
    description = "NiJS master";
    nixexprinput = "nijs";
    checkinterval = 300;
    schedulingshares = 1;
    inputs = {
      nixpkgs = mkNixpkgsChannel "18.03";
      nijs = mkInput { type = "git"; value = "https://github.com/svanderburg/nijs.git"; };
      systems = mkInput { type = "nix"; value = ''[ "x86_64-linux" "x86_64-darwin" ]''; };
    };
  };
}
