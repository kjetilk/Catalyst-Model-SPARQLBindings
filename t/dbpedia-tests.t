#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

if ($ENV{RDFQUERY_NETWORK_TESTS}) {
#        plan tests => 5;
} else {
        plan skip_all => 'No network. Set RDFQUERY_NETWORK_TESTS to run these tests.';
        return;
}



done_testing();
