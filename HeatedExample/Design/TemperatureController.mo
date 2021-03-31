within HeatedExample.Design;

model TemperatureController
parameter Real referenceT = 25;
parameter Real tolerance = 3;
Modelica.Blocks.Interfaces.RealInput u annotation(
  Placement(visible = true, transformation(origin = {-140, -7.99361e-15}, extent = {{-40, -40}, {40, 40}}, rotation = 0), iconTransformation(origin = {-118, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.BooleanOutput y annotation(
  Placement(visible = true, transformation(origin = {139, -41}, extent = {{-39, -39}, {39, 39}}, rotation = 0), iconTransformation(origin = {114, 14}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
Boolean on;
  Modelica.Blocks.Interfaces.BooleanOutput alarm (start = false) annotation(
    Placement(visible = true, transformation(origin = {140, 20}, extent = {{-40, -40}, {40, 40}}, rotation = 0), iconTransformation(origin = {114, -34}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
initial equation
y = false;
equation
on = not pre(y);
when sample(1, 1) and (u < referenceT - tolerance and not on or u > referenceT + tolerance and on) then
  y = not pre(y);
end when;

when u < 0.03 then alarm = true; end when;
annotation(
  Icon(graphics = {Text(origin = {-1, 62}, extent = {{-59, 28}, {59, -28}}, textString = "%name"), Line(origin = {-0.167127, -26.0946}, points = {{-67.8329, -21.9054}, {-43.8329, 28.0946}, {0.167127, -35.9054}, {26.1671, 10.0946}, {46.1671, -17.9054}, {68.1671, 36.0946}, {68.1671, 34.0946}})}));

end TemperatureController;