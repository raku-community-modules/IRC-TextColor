[![Actions Status](https://github.com/raku-community-modules/IRC-TextColor/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/IRC-TextColor/actions) [![Actions Status](https://github.com/raku-community-modules/IRC-TextColor/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/IRC-TextColor/actions) [![Actions Status](https://github.com/raku-community-modules/IRC-TextColor/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/IRC-TextColor/actions)

NAME
====

IRC::TextColor - Color/Style text for IRC

DESCRIPTION
===========

A plugin to style and color text for IRC. It can also convert the ANSIColor text and style from your terminal to IRC Text and style.

### sub ircstyle

```raku
sub ircstyle(
    Str(Any) $text,
    *%args
) returns Mu
```

a shortened function. Like irc-style-text but you can use shorter versions like C<ircstyle('text', :bold, :green)

### sub irc-style-text

```raku
sub irc-style-text(
    Str(Any) $text is copy,
    :$style = 0,
    :$color = 0,
    :$bgcolor = 0
) returns Str
```

styles and colors text. returns a copy. Colors allowed: white, blue, green, red, brown, purple, orange, yellow, light_green, teal, light_cyan, light_blue, pink, grey, light_grey.

### sub ansi-to-irc

```raku
sub ansi-to-irc(
    Str(Any) $text is copy
) returns Str
```

Convert ANSI style/colored text from your terminal output to IRC styled/colored text. Supports both foreground and background color, as well as italic, underline and bold.

AUTHOR
======

Samantha McVey

Source can be located at: https://github.com/raku-community-modules/IRC-TextColor . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2016 - 2017 Samantha McVey

Copyright 2024 The Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

