package Catalyst::Model::SPARQLBindings;
use Moose;
extends 'Catalyst::Model';
use namespace::autoclean;
use Carp qw(croak);

our $VERSION = '0.01';


=head1 NAME

Catalyst::Model::SPARQLBindings - A Catalyst Model to use SPARQL queries

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 new

Instantiate a new model object.

=head2 query($query)

Pass a L<RDF::Query> or subclass thereof object with a SPARQL SELECT query.

=cut

has 'query' => (is => 'rw', isa => 'RDF::Query');

=head2 endpoint($uri)

The endpoint to be used for a L<RDF::Query::Client>.

=cut

has 'endpoint' => (is => 'rw', isa => 'Str');

=head2 rdf_model($rdf_model)

The L<RDF::Trine::Model> to be used for a L<RDF::Query>.

=cut

has 'rdf_model' => (is => 'rw', isa => 'RDF::Trine::Model', builder => '_build_model', lazy => 1 );

sub _build_model {
  use Data::Dumper; warn Dumper(@_);
}

=head2 iterator

Returns an L<RDF::Trine::Iterator> object with the query results.

=cut

sub iterator {
  my $self = shift;
  my $query = $self->query;

  if ($query->isa('RDF::Query::Client')) {
    croak "No endpoint given for RDF::Query::Client" unless $self->endpoint;
    return $query->execute($self->endpoint);
  }
  if ($query->isa('RDF::Query')) {
    croak "No rdf_model given for RDF::Query" unless $self->rdf_model;
    return $query->execute($self->rdf_model);
  }

  croak "No query given";
}


=head1 BUGS

=head1 AUTHOR

Kjetil Kjernsmo

=head1 COPYRIGHT & LICENSE

Copyright 2010 Kjetil Kjernsmo C<<kjetilk@cpan.org>>

This software is free software, and is licensed under the same terms as perl itself.

=cut

1;
