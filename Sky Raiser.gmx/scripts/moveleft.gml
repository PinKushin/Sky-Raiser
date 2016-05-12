///moveleft()
var wallatleft = position_meeting (bbox_left - 1, y, osolidpar)
var ledgeatleft = !position_meeting (bbox_left - 1, bbox_bottom + 1, osolidpar);

statetext = "move left";

if wallatleft || ledgeatleft {
    state = moveright;
}

///control sprite
image_xscale = -1;

///move the snake
x -= spd;

