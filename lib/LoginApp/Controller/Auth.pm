package LoginApp::Controller::Auth;
use Mojo::Base 'Mojolicious::Controller';

 sub check 
 {
   my $self = shift;
   $self->redirect_to('/login') and return 0 unless($self->is_user_authenticated);
   
   return 1;
};

1;