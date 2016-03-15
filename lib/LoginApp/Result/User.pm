use utf8;
package LoginApp::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

LoginApp::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fbid

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 priv

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 flags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 firstname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 127

=head2 lastname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 127

=head2 userpass

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 photo

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 last_login

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 last_pwdchange

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fbid",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "priv",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "deleted",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "flags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "firstname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 127 },
  "lastname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 127 },
  "userpass",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "photo",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "last_login",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "last_pwdchange",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-15 18:22:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5cULGqislhNbVoG+lYIJcg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
