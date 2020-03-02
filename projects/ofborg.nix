{ hydraLib, ... }: let
  jobsetForBranch = branch: {
    nixexprinput = "ofborg";
    checkinterval = 3600;
    schedulingshares = 1000000;
    inputs = {
      nixpkgs = hydraLib.mkNixpkgsChannel "unstable";
      ofborg = hydraLib.mkInput { type = "git"; value = "https://github.com/grahamc/ofborg.git ${branch}"; };
    };
  };
in {
  release = jobsetForBranch "released";
  next = jobsetForBranch "next";
}
