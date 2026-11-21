package Plugins::PlayDSD::Register;

# Registers the PlayDSD tag handlers. Kept free of any web/UI dependency so it
# can be used by both the server plugin and the scanner importer.

use strict;
use warnings;

use Slim::Formats;
use Slim::Utils::Log;

my $log = logger('plugin.playdsd');

my %handlers = (
    dsf => 'Plugins::PlayDSD::Formats::DSF',
    dff => 'Plugins::PlayDSD::Formats::DFF',
);

sub registerFormatHandler {
    my ($class, $tagClasses) = @_;

    Slim::Formats->init();

    $tagClasses ||= \%Slim::Formats::tagClasses;

    return 0 unless ref($tagClasses) eq 'HASH';

    for my $type (sort keys %handlers) {
        my $handler = $handlers{$type};

        next if defined $tagClasses->{$type} && $tagClasses->{$type} eq $handler;

        $tagClasses->{$type} = $handler;

        main::DEBUGLOG && $log->is_debug && $log->debug("PlayDSD: registered tag handler for $type");
    }

    return 1;
}

1;
