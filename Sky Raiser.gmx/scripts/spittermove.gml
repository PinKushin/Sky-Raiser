///spittermove()
image_speed = 0;
image_index = 0;

// Check if we've run out of floor
if (place_meeting(x + lengthdir_x(speed + 1,direction - 90),y + lengthdir_y(speed + 1,direction - 90),osolidpar) = false) {

    // Rotate it so it's moving onto the next surface
    direction -= 90;
    
    // Make sure it's all the way onto the next side before doing any collision checks
    // (otherwise it bounces as it goes around the corner)
    x += hspeed;
    y += vspeed;
    
    // Make contact with the new surface
    move_contact_solid(direction - 90,speed);
}

// Else, check if we've run into a wall
else if (place_meeting(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),osolidpar)) {
    
    // Rotate it so it's moving up the wall
    direction += 90;
    
    // Make full contact with the wall
    move_contact_solid(direction - 90,speed);
}

image_angle = direction;

///attack
var dis = point_distance(x, y, oplayer.x, oplayer.y);
var dir = point_direction(x, y, oplayer.x, oplayer.y);

if lineofsight(oplayer) && dis <= sightrange {
   image_index = 1;
   speed = 0;
   if alarm[ATTACK] <= 0 {
      var myspit = instance_create(x, y, ospit);
      myspit.direction = dir;
      alarm[0] = room_speed / 2;
   }
   
}else{
      speed = 2;
      image_index = 0;
}
death();
