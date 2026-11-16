{ username, ...}:
let
  toPath = baseDir: name: baseDir + "/${name}";

  importDirs = baseDir:
    builtins.map ({ name: ...}: toPath baseDir name)
      (builtins.filter ({ value, ...}: value == "directory")
        (pkgs.lib.attrsToList
	  (builtins.readDir baseDir)));
in
{
  programs.home-manager.enable = true;
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.11";
  };

  imports = importDirs ./.;
}