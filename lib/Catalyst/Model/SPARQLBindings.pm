package Catalyst::Model::SPARQLBindings;
use Moose;
use namespace::autoclean;
use Carp qw(croak);


=head1 NAME

Catalyst::Model::SPARQLBindings - A Catalyst Model to use SPARQL queries

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 new

Instantiate a new model object.

=head2 query($query)

Pass a L<RDF::Query> object with a SPARQL SELECT query.

=cut

has 'query' => (is => 'rw', isa => 'RDF::Query');

=head2 endpoint($uri)

The endpoint to be used for a L<RDF::Query::Client>.

=cut

has 'endpoint' => (is => 'rw', isa => 'Str');

=head2 model($uri)

The model to be used for a L<RDF::Query>.

=cut

has 'model' => (is => 'rw', isa => 'RDF::Trine::Model');


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
    croak "No model given for RDF::Query::Client" unless $self->model;
    return $query->execute($self->model);
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
