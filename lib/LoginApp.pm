package LoginApp;
use Mojo::Base 'Mojolicious';

use LoginApp::Database;
use Mojolicious::Plugin::Authentication;

use Data::Dumper qw( Dumper );

use Mojolicious::Plugins;


# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  #$self->helper(mainDbh => sub { return $dbInstance->dbh});
  
#  $self->plugin('authentication' => {
#    'autoload_user' => 1,
#    'session_key' => 'wickedapp',
#    'load_user' => sub {
#    	warn 'load user';
#    },
#    'validate_user' => sub {
#    	warn 'validate user';
#    },
#    'current_user_fn' => 'user', # compatibility with old code
#  });

  # Router
  my $r = $self->routes;

  $r->any('/')->to('Login#display');
  
  $r->get('/login')->to('Login#display');
  $r->post('/login')->to('Login#do_login');
  
  my $rn = $r->under->to('auth#check');
  $rn->route('/home')->via('get')->to('example#home')->name('home');  
}

1;
