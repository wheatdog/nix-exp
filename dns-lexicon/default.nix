{ lib
, buildPythonPackage
, fetchPypi
, requests 
, tldextract 
, future 
, cryptography 
, pyyaml 
, boto3 
, zeep 
, xmltodict 
, beautifulsoup4 
, pynamecheap 
, softlayer 
, transip 
, pytest
, pytestcov
, pytest_xdist
, vcrpy
, mock
}:

buildPythonPackage rec {
  pname =  "dns-lexicon";
  version = "3.4.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-GuUmFBk/qY9gyccPRBWM49Z28IZuw70/mC0/KchPD9I=";
  };

  propagatedBuildInputs = [ requests tldextract future cryptography pyyaml boto3 zeep xmltodict beautifulsoup4 pynamecheap softlayer transip ];

  checkInputs = [ pytest pytestcov pytest_xdist vcrpy mock ];

  checkPhase = ''
    #py.test -k 'not test_auto and not test_localzone'
    py.test -k 'not providers'
    #py.test lexicon/tests/providers/test_vultr.py
  '';

  meta = with lib; {
    description = "Manipulate DNS records on various DNS providers in a standardized way.";
    homepage = "https://github.com/AnalogJ/lexicon";
    maintainers = with maintainers; [ flyfloh wheatdog ];
    license = licenses.mit;
  };
}
