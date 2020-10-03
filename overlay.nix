self: super: 

rec {
  python3 = super.python3.override {
    packageOverrides = self: super: {
      dns-lexicon = with super; callPackage ./dns-lexicon { };
      localzone = super.localzone.overrideAttrs(old: {
		doCheck = false;
      });
    };
  };
  python3Packages = python3.pkgs;
}
