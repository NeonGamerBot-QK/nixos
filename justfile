default: build


build:
    bash scripts/build_nixos.sh

check:
    nix flake check

update:
    nix flake update -v --commit-lock-file

clean target:
    bash scripts/cleanup_{{target}}.sh 

cm:
    git add .
    git commit -m 'chore: automated commit zeon:ai_comment'