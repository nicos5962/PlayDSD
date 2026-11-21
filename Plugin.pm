package Plugins::PlayDSD::Plugin;

use strict;
use warnings;

use base qw(Slim::Plugin::Base);

use Slim::Utils::Log;
use Plugins::PlayDSD::Register;

my $log = Slim::Utils::Log->addLogCategory({
    category     => 'plugin.playdsd',
    defaultLevel => 'INFO',
    description  => 'PLUGIN_PLAYDSD',
});

sub initPlugin {
    my $class = shift;

    my $version = $class->_pluginDataFor('version') || 'unknown';
    $log->info("Initializing PlayDSD plugin $version");

    Plugins::PlayDSD::Register->registerFormatHandler();

    $class->SUPER::initPlugin(@_);
}

sub getDisplayName { 'PLUGIN_PLAYDSD' }

1;
