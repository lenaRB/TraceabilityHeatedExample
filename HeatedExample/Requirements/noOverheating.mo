within HeatedExample.Requirements;

model noOverheating
extends VVDRlib.Verification.Requirement;
  Modelica.Blocks.Interfaces.RealInput temp annotation(
    Placement(visible = true, transformation(origin = {-120, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real maxT;
equation
  status = if (temp >= maxT) then VVDRlib.ReqStatus.VIOLATED else VVDRlib.ReqStatus.NOT_VIOLATED;
end noOverheating;