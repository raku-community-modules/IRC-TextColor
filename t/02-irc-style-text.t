#!/usr/bin/env perl6
use v6;
use Test;
plan 1;
use lib '.';
use IRC::TextColor;

my $irc = slurp 't/02-irc.txt';
is irc-style-text('text', :style<bold>, :color<teal>, :bgcolor<blue>), $irc, "irc-style-text works";
