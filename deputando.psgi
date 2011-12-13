use strict;
use warnings;

use Deputando;

my $app = Deputando->apply_default_middlewares(Deputando->psgi_app);
$app;

