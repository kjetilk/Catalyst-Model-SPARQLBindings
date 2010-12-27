#!/usr/bin/perl

use strict;
use warnings;

use Test::More; # tests => 3;
use lib qw( t/lib );


# Make sure the Catalyst app loads ok...
use_ok('TestApp');


my $sparql = TestApp->model('SPARQLBindings');
isa_ok( $sparql, 'Catalyst::Model::SPARQLBindings' );
can_ok( $sparql, 'query' );
can_ok( $sparql, 'endpoint' );
can_ok( $sparql, 'rdf_model' );
can_ok( $sparql, 'iterator' );

print $sparql->rdf_model;

done_testing;

1;
