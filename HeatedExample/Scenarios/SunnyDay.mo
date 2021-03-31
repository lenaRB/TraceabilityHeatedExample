within HeatedExample.Scenarios;

model SunnyDay
extends VVDRlib.Verification.Scenario;
  Modelica.Blocks.Interfaces.RealOutput timeVal annotation(
      Placement(visible = true, transformation(origin = {162, 60}, extent = {{-22, -22}, {22, 22}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 0; 10, 5; 15, 10; 20, 5; 50, 0])  annotation(
      Placement(visible = true, transformation(origin = {10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b roomT annotation(
      Placement(visible = true, transformation(origin = {148, -12}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T = 20)  annotation(
      Placement(visible = true, transformation(origin = {86, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(timeTable.y, timeVal) annotation(
      Line(points = {{22, 8}, {88, 8}, {88, 60}, {162, 60}}, color = {0, 0, 127}));
connect(fixedTemperature.port, roomT) annotation(
      Line(points = {{96, -12}, {148, -12}}, color = {191, 0, 0}));
  annotation(
      Diagram(coordinateSystem(extent = {{0, 100}, {140, -60}})));

end SunnyDay;