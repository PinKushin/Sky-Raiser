///lineofsight(thing your looking for)

//line of site artificial intelligence
var thing = argument0;
var result = false;

if instance_exists (thing)
{
    if collision_line (x, y, thing.x, thing.y, osolidpar, true, true) = noone 
    {
        result = true;
    }else{
        result = false;
    }
}

return result;
