[![Actions Status](https://github.com/raku-community-modules/IRC-TextColor/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/IRC-TextColor/actions) [![Actions Status](https://github.com/raku-community-modules/IRC-TextColor/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/IRC-TextColor/actions) [![Actions Status](https://github.com/raku-community-modules/IRC-TextColor/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/IRC-TextColor/actions)

NAME
====

IRC::TextColor - Color/Style text for IRC

SYNOPSIS
========

```raku
use IRC::TextColor;

say ircstyle 'text', :bold, :green;

say irc-style-text 'text', :style<bold>, :color<green>;
```

DESCRIPTION
===========

A plugin to style and color text for IRC. It can also convert the ANSIColor text and style from your terminal to IRC Text and style.

EXPORTED SUBROUTINES
====================

ircstyle
--------

```raku
say ircstyle("text", :bold, :green);
```

A shortened function. Like `irc-style-text` but shorter and with fewer options. But allows specification by style and color directly. Does not allow for setting background color.

irc-style-text
--------------

```raku
say irc-style-text("text", :$style, :$color, :$bgcolor);
```

Allows setting of a style, a color and a background color.

Allowed colors are:

    white black blue green red brown purple orange yellow
    light-green teal light-cyan light-blue pink grey light-grey

Allowed styles are:

    bold italic underline inverse

head
====

ansi-to-irc

Convert ANSI style/colored text from your terminal output to IRC styled/colored text. Supports both foreground and background color, as well as italic, underline and bold.

```raku
say ansi-to-irc($ansi);
```

AUTHOR
======

Samantha McVey

Source can be located at: https://github.com/raku-community-modules/IRC-TextColor . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2016 - 2017 Samantha McVey

Copyright 2024, 2026 The Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

