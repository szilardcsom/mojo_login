package LoginApp::Database;

use warnings;
use strict;

use Moo;
with 'MooX::Singleton';

use DBI;
use LoginApp::Model;

has DBHost => ( is => 'ro', lazy => 1, default => sub { "localhost" } );
has DBName => ( is => 'ro', lazy => 1, default => sub { 'szilardDB' } );
has DBUser => ( is => 'ro', lazy => 1, default => sub { 'szilard' } );
has DBPass => ( is => 'ro', lazy => 1, default => sub { 'secret' } );

has dbh     => ( is => 'rwp' );

sub connectToMainDBs
{
  my $self = shift;
   
  my $dbh = DBI->connect("DBI:mysql:" . $self->DBName,
    $self->DBUser,$self->DBPass);
    
  $self->_set_dbh($dbh);
   
  return $self->dbh;
}

sub schemaConnect
{
  my $self = shift;
  
  return LoginApp::Schema->connect(sprintf("DBI:mysql:host=%s;database=%s", 
    $self->DBHost, $self->DBName),$self->DBUser,$self->DBPass,
    {
      on_connect_call => [
        [ do_sql => "SET NAMES utf8" ],
      ],
      auto_savepoint => 1,
    });   
}

1;