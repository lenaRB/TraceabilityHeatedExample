within HeatedExample.Requirements;

model energyLoss
  extends VVDRlib.Verification.Requirement;
 Modelica.Blocks.Interfaces.RealInput voltage annotation(
    Placement(visible = true, transformation(origin = {-120, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    
  parameter Real timeToAlarm;
  Real tPowerLoss;
  Boolean powerLost (start = false);
 Modelica.Blocks.Interfaces.BooleanInput alarmOn annotation(
    Placement(visible = true, transformation(origin = {-120, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 Modelica.Blocks.Interfaces.BooleanInput isOn annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  
  when (isOn and voltage < 0.05 and not(pre(powerLost))) then
  powerLost = true; 
  tPowerLoss = time; 
  end when;
  
  status = if (powerLost and tPowerLoss + timeToAlarm < time) then if (alarmOn) then VVDRlib.ReqStatus.NOT_VIOLATED else VVDRlib.ReqStatus.NOT_VIOLATED else VVDRlib.ReqStatus.NOT_APPLICABLE ;

end energyLoss;