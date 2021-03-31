within HeatedExample.Requirements;

model switchingDelay
extends VVDRlib.Verification.Requirement;
  Modelica.Blocks.Interfaces.BooleanInput isOn annotation(
    Placement(visible = true, transformation(origin = {-120, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real howLong;
  Real timerS, timerF;
  Integer counter (start=0);
equation
  when(change(isOn)) then
    timerF = time;
    timerS=pre(timerF);
    counter = pre(counter) + 1;
    end when;
    status = if counter <2 then VVDRlib.ReqStatus.NOT_APPLICABLE elseif (timerF-timerS<howLong) then VVDRlib.ReqStatus.VIOLATED else VVDRlib.ReqStatus.NOT_VIOLATED;
end switchingDelay;