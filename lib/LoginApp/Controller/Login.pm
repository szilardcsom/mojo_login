package LoginApp::Controller::Login;

use Moo;
extends 'LoginApp::Controller::MyController';

sub display
{
  my $self = shift;
	
  $self->renderTemplate(template => 'Login/login', format => 'html', layout => 'common_templates/pagewrapper');	
}

sub do_login
{  
	my $self = shift;
}

1;