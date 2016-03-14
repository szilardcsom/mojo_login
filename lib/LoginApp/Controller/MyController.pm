package LoginApp::Controller::MyController;
use Moo;

extends 'Mojolicious::Controller';

sub renderTemplate
{
  my $self = shift;
  
  $self->render(@_);
}

1;