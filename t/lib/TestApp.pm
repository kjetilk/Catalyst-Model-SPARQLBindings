package TestApp;
use Moose;
use namespace::autoclean;

#use Catalyst qw( ConfigLoader );

extends 'Catalyst';

__PACKAGE__->config(  { foo => 'bar' } );

__PACKAGE__->setup;

1;
