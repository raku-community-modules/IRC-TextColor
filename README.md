IRC::TextColor
==============

A plugin to style and color text for IRC. It can also convert the ANSIColor text and style from your terminal to IRC Text and style.

### sub irc-style-text

```
sub irc-style-text(
    Str $text is copy, 
    :$style = 0, 
    :$color = 0, 
    :$bgcolor = 0
) returns Str
```

styles and colors text. returns a copy. Colors allowed: white, blue, green, red, brown, purple, orange, yellow, light_green, teal, light_cyan, light_blue, pink, grey, light_grey.
