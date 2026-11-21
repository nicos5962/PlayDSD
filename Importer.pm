package Plugins::PlayDSD::Importer;

use strict;
use warnings;

use Plugins::PlayDSD::Register;

sub initPlugin {
    my $class = shift;

    Plugins::PlayDSD::Register->registerFormatHandler();
    return 1;
}

sub startScan {
    my $class = shift;
    return;
}

1;
