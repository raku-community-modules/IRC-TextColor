IRC::TextColor
==============

A plugin to style and color text for IRC. It can also convert the ANSIColor text and style from your terminal to IRC Text and style.

### sub irc-text

```
sub irc-text(
    $text is copy, 
    :$style = 0, 
    :$color = 0, 
    :$bgcolor = 0
) returns Mu
```

style and colors text. returns a copy.

### sub irc-style

```
sub irc-style(
    Str $text is rw, 
    :$color = 0, 
    :$style = 0
) returns Mu
```

styles and colors text. modifies the original string

### sub ansi-to-irc

```
sub ansi-to-irc(
    $text is rw
) returns Mu
```

`ansi-to-irc( $string )` to convert ANSI style/colored text to IRC style/colored. Supports both foreground and background color, as well as italic underline and bold.
