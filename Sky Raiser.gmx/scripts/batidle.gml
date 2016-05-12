///batidle()
if instance_exists(oplayer) {

    var dis = point_distance(x, y, oplayer.x, oplayer.y);

    statetext = "idle"
    
    if dis <= sightrange {
       state = batchase;
    }
}
