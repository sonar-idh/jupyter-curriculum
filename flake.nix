{
  description = "Sonar";

  inputs.nixpkgs.url = "github:NixOS/Nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {

      checks.x86_64-linux = pkgs.lib.mapAttrs
        (name: nbfile: pkgs.runCommand name
          {
            src = ./notebooks;
            nativeBuildInputs = with pkgs.python3Packages; [
              ipywidgets
              autopep8
              pandas
              # nbdime
              networkx
              pyvis
              python-louvain
              pyyaml
              matplotlib
            ];
          } ''
          mkdir -p $out
          cp -r $src notebooks
          chmod u+rw -R notebooks
          jupyter nbconvert \
            --to notebook \
            --execute \
            --output-dir=$out \
            "notebooks/${nbfile}"
        '')
        {
          notebook1 = "Notebook 1 - Jupyter and Python.ipynb";
          notebook2 = "Notebook 2 - Historical Network Analysis.ipynb";
          notebook3 = "Notebook 3 - SoNAR (IDH).ipynb";
          notebook4 = "Notebook 4 - Exploring the Network of Physiologists.ipynb";
          notebook5 = "Notebook 5 - Analyzing Gustav von Schmoller.ipynb";
        };

      devShell.x86_64-linux =
        pkgs.mkShell {
          buildInputs = (with pkgs; [
            python3
            pandoc
            (pkgs.writeShellScriptBin "start-jupyter.sh" ''
              jupyter notebook \
                --ip 127.0.0.1 \
                --port 8888 \
                --no-browser \
                --NotebookApp.password="" \
                --NotebookApp.token=""
            '')
            docker-compose
          ]) ++ (with pkgs.python3Packages; [
            ipywidgets
            autopep8
            pandas
            # nbdime
            networkx
            pyvis
            python-louvain
          ]) ++ [
            (pkgs.python3Packages.buildPythonPackage rec {
              pname = "neo4j-python-driver";
              version = "4.3.3";

              src = pkgs.fetchFromGitHub {
                owner = "neo4j";
                repo = pname;
                rev = version;
                sha256 = "sha256-h/3f4fv7fgO/auBD6R2zRcDZVgSm0mvDFxK9eNEmnIs=";
              };

              buildInputs = with pkgs.python3Packages; [ pytz pytest ];

              doCheck = false;

            })
          ];
        };

    };
}
