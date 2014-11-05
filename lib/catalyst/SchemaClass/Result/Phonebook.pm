use utf8;
package catalyst::SchemaClass::Result::Phonebook;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

catalyst::SchemaClass::Result::Phonebook

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components( "InflateColumn::DateTime",  "Core" );

=head1 TABLE: C<Phonebook>

=cut

__PACKAGE__->table("Phonebook");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 phone

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 birthday

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 note

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "phone",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "birthday",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00",
    is_nullable => 0
  },
  "note",
  { data_type => "varchar", is_nullable => 0, size => 200 },
);



=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2014-09-03 13:21:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VC7kipxTyrLXnOykPlOEOg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
