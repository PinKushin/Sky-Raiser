///moveright()
var wallatright = position_meeting (bbox_right + 1, y, osolidpar)
var ledgeatright = !position_meeting (bbox_right + 1, bbox_bottom + 1, osolidpar);

if wallatright || ledgeatright {
    state = moveleft;
}

///control sprite
image_xscale = 1;

///move the snake
x += 1;

