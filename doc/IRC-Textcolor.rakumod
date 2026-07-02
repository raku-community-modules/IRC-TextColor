=begin pod

=head1 NAME

IRC::TextColor - Color/Style text for IRC

=head1 SYNOPSIS

=begin code :lang<raku>
use IRC::TextColor;

say ircstyle 'text', :bold, :green;

say irc-style-text 'text', :style<bold>, :color<green>;
=end code

=head1 DESCRIPTION

A plugin to style and color text for IRC. It can also convert the ANSIColor
text and style from your terminal to IRC Text and style.

=head1 EXPORTED SUBROUTINES

=head2 ircstyle

=begin code :lang<raku>
say ircstyle("text", :bold, :green);
=end code

A shortened function. Like C<irc-style-text> but shorter and with fewer
options.  But allows specification by style and color directly.  Does not
allow for setting background color.

=head2 irc-style-text

=begin code :lang<raku>
say irc-style-text("text", :$style, :$color, :$bgcolor);
=end code

Allows setting of a style, a color and a background color.

Allowed colors are:
=begin output
white black blue green red brown purple orange yellow
light-green teal light-cyan light-blue pink grey light-grey
=end output

Allowed styles are:
=begin output
bold italic underline inverse
=end output

=head ansi-to-irc

Convert ANSI style/colored text from your terminal output to IRC
styled/colored text.  Supports both foreground and background color,
as well as italic, underline and bold.

=begin code
say ansi-to-irc($ansi);
=begin pod

=head1 AUTHOR

Samantha McVey

Source can be located at: https://github.com/raku-community-modules/IRC-TextColor .
Comments and Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2016 - 2017 Samantha McVey

Copyright 2024, 2026 The Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
