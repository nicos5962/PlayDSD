package Plugins::PlayDSD::Formats::DSF;

# Core already handles DSF tags. This class only adds an external album id
# (from Discogs) so that different releases of the same album / artist are not
# merged into one album. The DFF class uses setExtId from here too.

use strict;
use warnings;
use base qw(Slim::Formats::DSF);

# Normalized names (upper case, letters and digits only) of the tags holding
# the Discogs release id, in order of preference.
my @extIdNames = qw(DISCOGSRELEASEID DISCOGSID DISCOGSRELEASE);

sub getTag {
    my ($class, $file, $anchor) = @_;

    my $tags = $class->SUPER::getTag($file, $anchor) or return;

    $class->setExtId($tags);

    return $tags;
}

sub setExtId {
    my ($class, $tags) = @_;

    return if $tags->{ALBUM_EXTID};

    my %byName;

    for my $key (keys %$tags) {
        (my $name = uc $key) =~ s{^WM/}{};
        $name =~ s/[^A-Z0-9]//g;

        $byName{$name} //= $tags->{$key};
    }

    for my $name (@extIdNames) {
        my $value = $byName{$name};
        $value = $value->[0] if ref $value eq 'ARRAY';

        next if !defined $value || ref $value;

        $value =~ s/^\s+|\s+$//g;

        if (length $value) {
            $tags->{ALBUM_EXTID} = $value;
            return;
        }
    }
}

1;
