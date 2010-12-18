use strict;
use warnings;
use inc::Module::Install 0.91;
use Module::Install::AuthorRequires;
use Module::Install::AuthorTests;

name 'Catalyst-Model-SPARQLBindings';
all_from 'lib/Catalyst/Model/SPARQLBindings.pm';

requires 'Moose';
requires 'RDF::Trine';
requires 'namespace::autoclean';
requires 'Catalyst::Runtime' => '5.80015';

recommends 'RDF::Query'; # To use a local model
recommends 'RDF::Query::Client'; # To query a remote endpoint

test_requires 'Test::WWW::Mechanize::Catalyst';
test_requires 'Test::More' => '0.88';

author_requires 'Test::Pod::Coverage' => '1.04';
author_requires 'Test::Pod' => '1.14';

author_tests 'xt/';

resources repository => 'git://somewhere.com/myproject.git';


WriteAll();
