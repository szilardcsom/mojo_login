package LoginApp::Controller::MyController;
use Moo;
use Encode qw(decode encode);

extends 'Mojolicious::Controller';

sub getJsonParams
{
  return shift->req->json;
}

sub renderTemplate
{
  my $self = shift;
  
  $self->render(@_);
}

1;