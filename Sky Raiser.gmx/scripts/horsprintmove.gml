///horsprintmove(collision_object)
var collision_object = argument0;

//Horizontal collisions
if place_meeting (x + hspd, y, collision_object) {
    while !place_meeting (x + sign (hspd), y, collision_object) {
        x += sign (hspd);
    }
    hspd = 0;
}
x += hspd;
