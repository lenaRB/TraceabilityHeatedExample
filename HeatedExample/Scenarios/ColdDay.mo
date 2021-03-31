within HeatedExample.Scenarios;

model ColdDay
extends VVDRlib.Verification.Scenario;
  Modelica.Blocks.Interfaces.RealOutput timeVal annotation(
      Placement(visible = true, transformation(origin = {157, 55}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {108, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 0; 10, 5; 15, 5;  50, 0])  annotation(
      Placement(visible = true, transformation(origin = {10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b roomT annotation(
      Placement(visible = true, transformation(origin = {144, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T = 17)  annotation(
      Placement(visible = true, transformation(origin = {86, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(timeTable.y, timeVal) annotation(
      Line(points = {{22, 8}, {88, 8}, {88, 55}, {157, 55}}, color = {0, 0, 127}));
connect(fixedTemperature.port, roomT) annotation(
      Line(points = {{96, -12}, {144, -12}}, color = {191, 0, 0}));
  annotation(
      Diagram(coordinateSystem(extent = {{0, 100}, {140, -60}})));

end ColdDay;