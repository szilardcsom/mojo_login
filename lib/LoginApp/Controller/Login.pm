package LoginApp::Controller::Login;
use Mojo::Base 'Mojolicious::Controller';

sub display
{
  my $self = shift;
	
  $self->render(template => 'Login/login', format => 'html', layout => 'common_templates/pagewrapper');	
}

sub do_login
{
	
}

1;