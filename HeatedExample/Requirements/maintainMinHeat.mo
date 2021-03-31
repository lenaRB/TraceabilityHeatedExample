within HeatedExample.Requirements;

model maintainMinHeat
extends VVDRlib.Verification.Requirement;
Modelica.Blocks.Interfaces.RealInput temp annotation(
    Placement(visible = true, transformation(origin = {-120, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real minT;
  parameter Real startT ; 
equation
  status = if time <startT then VVDRlib.ReqStatus.NOT_APPLICABLE elseif (temp < minT) then VVDRlib.ReqStatus.VIOLATED else VVDRlib.ReqStatus.NOT_VIOLATED;
end maintainMinHeat;