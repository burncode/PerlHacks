#!perl -w

# -- SOAP::Lite -- guide.soaplite.com -- Copyright (C) 2001 Paul Kulchenko --

use SOAP::Lite
  on_fault => sub { my($soap, $res) = @_; 
    die ref $res ? $res->faultdetail : $soap->transport->status, "\n";
  };

my $soap = SOAP::Lite
  -> uri('http://www.soaplite.com/Temperatures')
  -> proxy('http://services.soaplite.com/temper.cgi');

eval { 
  print $soap->c2f(37.5)->result; 
1 } or die;
