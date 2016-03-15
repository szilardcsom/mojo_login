package LoginApp::Controller::Login;

use Moo;
extends 'LoginApp::Controller::MyController';

use Data::Dumper;
use LoginApp::Model::User;

sub display
{
  my $self = shift;
	
  $self->renderTemplate(template => 'Login/login', format => 'html', layout => 'common_templates/pagewrapper');	
}

sub do_login
{   
  my $self = shift;
	
  my $parameters = $self->getJsonParams();
	
  if ($parameters->{'fbId'}) {
    my $user = LoginApp::Model::User->getUserByFBId($parameters->{'fbId'});
	 
    warn Data::Dumper::Dumper($user);
  } else {
    die 'No fb id provided, something is not going well';
  }
}

1;