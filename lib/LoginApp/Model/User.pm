#! /usr/bin/perl -w

package LoginApp::Model::User;

use Moo;
extends 'LoginApp::Model';

sub getUserByFBId
{
  my $class = shift;
  my ($fbid) = @_;
  
  return $class->getDbh->resultset('User')->search({
   'fbid' => $fbid
  })->first;
}

1;