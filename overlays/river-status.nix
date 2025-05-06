self: super:

{
  river-status = super.rustPlatform.buildRustPackage rec {
    pname = "river-status";
    version = "0.1.0"; # Replace with the actual version if known

    src = super.fetchFromGitHub {
      owner = "grvn";
      repo = "river-status";
      rev = "main"; # Replace with a specific commit hash or tag if needed
      sha256 = "sha256-QTHn3+8CRpm5CoTwuhoMjBG16CYcOb79cOXgcgzimkc="; # Placeholder
    };

    cargoHash = "sha256-DPsQE71sEpfVnyI6V/da5n9V9pbItPZMuu/EM/30Jyo="; # Placeholder
    nativeBuildInputs = [
      super.pkg-config # If you're dealing with C libraries or dependencies
    ];

    buildInputs = [
      super.wayland-utils # Add this or other dependencies if they are required for building
    ];

    meta = with super.lib; {
      description = "A client for fetching status information from the River Wayland compositor";
      homepage = "https://github.com/grvn/river-status";
      license = licenses.mit;
      maintainers = with maintainers; [ "Elias Schröter" ];
    };
  };
}
