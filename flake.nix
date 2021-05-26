{
  description = "Sonar";

  inputs.nixpkgs.url = "github:NixOS/Nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {

    devShell.x86_64-linux =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in
      pkgs.mkShell {
        buildInputs = (with pkgs; [
          python3
          pandoc
          texlive.combined.scheme-full
          (pkgs.writeShellScriptBin "start-jupyter.sh" ''
            jupyter notebook \
              --ip 127.0.0.1 \
              --port 8888 \
              --no-browser \
              --NotebookApp.password="" \
              --NotebookApp.token=""
          '')
        ]) ++ (with pkgs.python3Packages; [
          ipywidgets
          autopep8
          pandas
          # nbdime
        ]);
      };

  };
}
