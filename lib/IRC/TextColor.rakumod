my constant %irc-styles =
  bold      => 2.chr,
  bold_off  => 2.chr,
  bold-off  => 2.chr,
  italic    => 29.chr,
  underline => 31.chr,
  reset     => 15.chr,
  inverse   => 22.chr,
  color     => 3.chr,
;
my constant $COLOR  = %irc-styles<color>;
my constant $RESET  = %irc-styles<reset>;
my constant @styles = eager %irc-styles.keys.sort;

my constant %irc-colors =
  white       => '00',
  black       => '01',
  blue        => '02',
  green       => '03',
  red         => '04',
  brown       => '05',
  purple      => '06',
  orange      => '07',
  yellow      => '08',
  light_green => '09',
  light-green => '09',
  teal        => '10',
  light-cyan  => '11',
  light_cyan  => '11',
  light-blue  => '12',
  light_blue  => '12',
  pink        => '13',
  grey        => '14',
  light-grey  => '15',
  light_grey  => '15',
;
my constant @irc-colors = eager %irc-colors.keys.sort;

my constant %ansi-style =
  reset         => "0",
  bold          => "1",
  underline     => "4",
  inverse       => "7",
  bold-off      => "22",
  bold_off      => "22",
  underline-off => "24",
  underline_off => "24",
  inverse-off   => "27",
  inverse_off   => "27",
;

my constant %ansi-colors =
  black      => "30",
  red        => "31",
  green      => "32",
  yellow     => "33",
  blue       => "34",
#  magenta    => "35",
  purple     => "35",
#  cyan       => "36",
  light-cyan => "36",
  light_cyan => "36",
  white      => "37",
  default    => "39",
;

my constant %ansi-back-colors =
  black      => "40",
  red        => "41",
  green      => "42",
  yellow     => "43",
  blue       => "44",
  magenta    => "45",
#  cyan       => "46",
  light-cyan => "46",
  light_cyan => "46",
  white      => "47",
  default    => "49",
;

# This appears to be dead code.  Keeping it anyway just in case something
# in the ecosystem depends on it
my sub style-char(Str() $style) is export {  # UNCOVERABLE
     $_ with %irc-styles{$style}  # UNCOVERABLE
}
my sub color-start( Str() $color) is export {
    "$COLOR$_" with %irc-colors{$color}
}

my sub ircstyle(Str() $text, *%args) is export {
    my @color = %irc-colors{%args.keys}:k;
    my @style = %irc-styles{%args.keys}:k;

    any(@color, @style) > 1
      ?? die "Cannot specify two styles or two colors at the same time."
      !! irc-style-text $text, :color(@color[0] // ""), :style(@style[0] // "")
}

my sub irc-style-text(
  Str() $text,
       :$style   = "",
       :$color   = "",
       :$bgcolor = "",
--> Str:D) is export {

    my $styling = %irc-styles{$style} // "";

    if %irc-colors{$color} -> $fg {
        (my $bg = %irc-colors{$bgcolor})
          ?? "$styling$COLOR$fg,$bg$text$RESET"
          !! "$styling$COLOR$fg$text$RESET"
    }
    elsif $styling {  # UNCOVERABLE
        "$styling$text$RESET"
    }
    else {
        $text
    }
}

my sub ansi-to-irc(Str() $text is copy --> Str:D) is export {
    my constant $escape  = "\e[";
    my constant $end     = 'm';
    my constant $mescape = "m$escape";

    if $text ~~ /$escape/ {

        # For when there are multiple codes in one block
        # \e[01;10m => \e[01m\e[10m so down below works correctly FIXME
        $text ~~ s:g/($escape \d+ )';'( \d+ m)/$0$mescape$1/;

        # To replace leading zeros on numbers so it matches properly FIXME
        $text ~~ s:g/$escape 0 (\d) /$escape$0/;

        for %ansi-colors -> $pair {
            if %irc-colors{$pair.key} {
                $text .= subst(
                  "$escape$pair.value()$end",
                  color-start($pair.key),
                  :global
                );
            }
        }
        for %ansi-back-colors -> $pair {
            if %irc-colors{$pair.key} -> $selected {
                $text .= subst(
                  "$escape$pair.value()$end",
                  "$COLOR,$selected",
                  :global
                )
            }
        }

        for %ansi-style -> $pair {
            if %irc-styles{$pair.key} -> $selected {
                $text .= subst("$escape$pair.value()$end", $selected, :global);
            }
        }
    }

    $text
}

# vim: expandtab shiftwidth=4
