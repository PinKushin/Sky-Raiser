///jumpermove
//apply gravity
if !place_meeting (x, y + 1, osolidpar) {
    vspd += 1; //gravity value
}else{
    vspd = 0;
    hspd = 0;
    //check for idle state
    if hspd == 00 && vspd == 0 {
        state = jumperidle;
        alarm[ATTACK] = 15;
        image_speed = 0;
        image_index = 0;
    }
}

if hspd != 0 { image_xscale = sign(hspd)};

