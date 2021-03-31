within HeatedExample.UserGenVerifScenarios;

model UserGenVerifScenario
  extends VVDRlib.Verification.VerificationModel;
  Design.HeatedElement heatedElement annotation(
    Placement(visible = true, transformation(origin = {6, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatedExample.Scenarios.SunnyDay sunnyDay annotation(
    Placement(visible = true, transformation(origin = {-76, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatedExample.Requirements.noOverheating noOverheating(maxT = 35) annotation(
    Placement(visible = true, transformation(origin = {74, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatedExample.Requirements.switchingDelay switchingDelay(howLong = 5) annotation(
    Placement(visible = true, transformation(origin = {74, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatedExample.Requirements.maintainMinHeat minHeat(minT = 21.5, startT = 2)  annotation(
    Placement(visible = true, transformation(origin = {74, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatedExample.Requirements.energyLoss energyLoss annotation(
    Placement(visible = true, transformation(origin = {74, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sunnyDay.timeVal, heatedElement.outsideHeat) annotation(
    Line(points = {{-64, 10}, {-6, 10}}, color = {0, 0, 127}));
  connect(sunnyDay.roomT, heatedElement.roomTemp) annotation(
    Line(points = {{-64, 4}, {-64, -12}, {12, -12}, {12, -6}}, color = {191, 0, 0}));
  connect(heatedElement.objectT, minHeat.temp) annotation(
    Line(points = {{18, 10}, {40, 10}, {40, 52}, {62, 52}}, color = {0, 0, 127}));
  connect(heatedElement.objectT, noOverheating.temp) annotation(
    Line(points = {{18, 10}, {40, 10}, {40, 28}, {62, 28}}, color = {0, 0, 127}));
  connect(heatedElement.objectT, energyLoss.voltage) annotation(
    Line(points = {{18, 10}, {40, 10}, {40, 2}, {62, 2}}, color = {0, 0, 127}));
  connect(heatedElement.switchSignal, switchingDelay.isOn) annotation(
    Line(points = {{18, -2}, {34, -2}, {34, -24}, {62, -24}}, color = {255, 0, 255}));
  connect(heatedElement.alarmOn, energyLoss.alarmOn) annotation(
    Line(points = {{18, 4}, {38, 4}, {38, -4}, {62, -4}}, color = {255, 0, 255}));
  connect(heatedElement.switchSignal, energyLoss.isOn) annotation(
    Line(points = {{18, -2}, {34, -2}, {34, -10}, {62, -10}}, color = {255, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    Diagram(coordinateSystem(extent = {{-100, 60}, {100, -40}}), graphics = {Text(origin = {43, -33}, extent = {{-17, 5}, {17, -5}}, textString = "requirements"), Text(origin = {-76, 42}, extent = {{-16, 4}, {16, -4}}, textString = "scenario"), Text(origin = {8, 39}, extent = {{-10, 5}, {10, -5}}, textString = "design")}));
end UserGenVerifScenario;