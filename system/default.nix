{ username, lib, ...}:
let
  toPath = baseDir: name: baseDir + "/${name}";

  importDirs = baseDir:
    builtins.map ({ name, ...}: toPath baseDir name)
      (builtins.filter ({ value, ...}: value == "directory")
        (lib.attrsToList
	  (builtins.readDir baseDir)));
in
{
  imports = importDirs ./.;
}