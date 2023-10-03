 #!/bin/sh

nix profile install nixpkgs#picom
picom -f -b
