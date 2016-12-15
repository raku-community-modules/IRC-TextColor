#!/usr/bin/env perl6
use v6;
use Test;
#plan 64;
use lib '.';
use IRC::TextColor;
my $ansi = slurp 't/ansi.txt';
my $irc = slurp 't/irc.txt';
is ansi-to-irc($ansi), $ansi, "ANSI to irc conversion works";
done-testing;
