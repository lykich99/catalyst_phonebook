use strict;
use warnings;

use catalyst;

my $app = catalyst->apply_default_middlewares(catalyst->psgi_app);
$app;

