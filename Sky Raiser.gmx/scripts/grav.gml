///grav(Gravity);
var gravit = argument0;

if timetomodifygrav < 0 {
   vspd += gravit;
}
else if timetomodifygrav <= 1.5{
   vspd += gravit*1;
}
else if timetomodifygrav <= 2{
   vspd += gravit*1.25;
}
else if timetomodifygrav <= 2.5{
   vspd += gravit*1.5;
}

if disablehormov = 1 and vspd > -5.5 {disablehormov = 0}

