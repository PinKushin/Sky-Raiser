///jumperidle()
statetext = "idle"
if instance_exists (oplayer) {
    var dis = distance_to_object (oplayer);
    
    if dis < sight && alarm[ATTACK] <=0 {
        image_speed = 0.5;
        
        //make sure we face the player
        if oplayer.x != x {
            image_xscale = sign (oplayer.x - x);
        }
    }
}
