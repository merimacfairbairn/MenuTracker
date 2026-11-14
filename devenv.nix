{pkgs, ...}: {
  languages.python = {
    enable = true;
    version = "3.11";
    venv.enable = true;
    venv.requirements = ./requirements.txt;
  };

  # Optional: R for the cleaning step
  languages.r.enable = true;

  packages = with pkgs; [
    chromium
    chromedriver
    ghostscript # Camelot
    tk # Camelot
  ];

  env.CHROMEDRIVER_PATH = "${pkgs.chromedriver}/bin/chromedriver";
  env.CHROME_BIN = "${pkgs.chromium}/bin/chromium";
}
