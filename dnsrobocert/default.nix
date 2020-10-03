{ lib
, python3Packages
, fetchFromGitHub
}:

python3Packages.buildPythonApplication rec {
  pname = "dnsrobocert";
  version = "3.7.0";
  format = "pyproject";

  propagatedBuildInputs = with python3Packages; [
      poetry
      acme
      certbot
      dns-lexicon
      zeep
      xmltodict
      transip
      softlayer
      pynamecheap
      localzone
      boto3
      cryptography
      cffi
      lxml
      dnspython
      jsonschema
      # pem
      pyopenssl
      pyyaml
      schedule
      coloredlogs
      colorama
  ];

  checkInputs = with python3Packages; [ pytest pytestcov ];

  src = fetchFromGitHub {
    owner = "adferrand";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-HvAhKcdcXqPyCtuyITHz5DiFDfaElOUWFvMMW3eZqTQ=";
  };

  meta = with lib; {
    description = "Orchestrate Certbot and Lexicon together to provide Let's Encrypt TLS certificates validated by DNS challenges";
    homepage = "https://github.com/adferrand/dnsrobocert";
    maintainers = with maintainers; [ wheatdog ];
    license = licenses.mit;
  };
}
