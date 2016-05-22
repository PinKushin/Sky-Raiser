///jumperjump()
image_index = image_number - 1;
statetext = "jumped"
//apply gravity
if !place_meeting (x, y + 1, osolidpar) {
    vspd += grv;
}else{
    vspd = 0;
    
    //use friction
    applyfriction (acc);
    
    //check for idle state
    if hspd == 0 && vspd == 0 {
        state = jumperidle;
        alarm[ATTACK] = 15;
        image_speed = 0;
        image_index = 0;
    }
}

if hspd != 0 { image_xscale = sign(hspd)};

///move
horizontalmovebounce(osolidpar)
