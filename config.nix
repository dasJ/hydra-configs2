{
  # Who to notify if a .jobsets jobset fails
  jobsetMaintainers = [];

  # Default jobset values
  defaultJobset = {
    enabled = 1;
    type = 0;
    description = "";
    nixexprpath = "release.nix";
    hidden = false;
    description = "";
    checkinterval = 86400;
    schedulingshares = 1000;
    enableemail = false;
    emailoverride = "";
    keepnr = 3;
    inputs = {};
  };
}
