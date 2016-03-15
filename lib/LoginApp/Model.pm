package LoginApp::Model;

use Moo;
with 'MooX::Singleton';

use LoginApp::Database;
use LoginApp::Schema;

my $dbix;

sub getDbh
{
  my $class = shift;
  
  if (!$dbix) {
    $dbix = LoginApp::Database->instance()->schemaConnect();
    return $dbix;
  } else {
    return $dbix;
  }
}

1;