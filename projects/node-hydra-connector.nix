{ hydraLib, ... }: {
  node-hydra-connector-master = {
    description = "Node Hydra connector master";
    nixexprinput = "node_hydra_connector";
    checkinterval = 300;
    schedulingshares = 1;
    inputs = {
      nixpkgs = mkNixpkgsChannel "18.03";
      node_hydra_connector = mkInput { type = "git"; value = "https://github.com/svanderburg/node-hydra-connector.git"; };
      officalRelease = mkInput { type = "boolean"; value = "false"; };
    };
  };
}
