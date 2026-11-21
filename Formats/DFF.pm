package Plugins::PlayDSD::Formats::DFF;

# Core already handles DFF tags. This class only adds an external album id,
# using the lookup of the DSF class.

use strict;
use warnings;
use base qw(Slim::Formats::DFF);

use Plugins::PlayDSD::Formats::DSF;

sub getTag {
    my ($class, $file, $anchor) = @_;

    my $tags = $class->SUPER::getTag($file, $anchor) or return;

    Plugins::PlayDSD::Formats::DSF->setExtId($tags);

    return $tags;
}

1;
