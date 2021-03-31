within HeatedExample.Design;

model HeatedElement
  extends VVDRlib.Verification.Design;
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-32, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.HeatingResistor resistor annotation(
    Placement(visible = true, transformation(origin = {36, -16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 2) annotation(
    Placement(visible = true, transformation(origin = {-22, 26}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 5, T(displayUnit = "K")) annotation(
    Placement(visible = true, transformation(origin = {36, -88}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 1.2) annotation(
    Placement(visible = true, transformation(origin = {76, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-22, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch switch annotation(
    Placement(visible = true, transformation(origin = {32, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatedExample.Design.TemperatureController temperatureController annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow sunshine annotation(
    Placement(visible = true, transformation(origin = {-82, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput outsideHeat annotation(
    Placement(visible = true, transformation(origin = {-120, -72}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a roomTemp annotation(
    Placement(visible = true, transformation(origin = {106, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput objectT annotation(
    Placement(visible = true, transformation(origin = {110, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.BooleanOutput switchSignal annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput alarmOn annotation(
    Placement(visible = true, transformation(origin = {110, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(heatCapacitor.port, resistor.heatPort) annotation(
    Line(points = {{36, -78}, {36, -26}}, color = {191, 0, 0}));
  connect(resistor.n, ground.p) annotation(
    Line(points = {{26, -16}, {-32, -16}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground.p) annotation(
    Line(points = {{-32, 26}, {-32, -16}}, color = {0, 0, 255}));
  connect(constantVoltage.p, switch.p) annotation(
    Line(points = {{-12, 26}, {22, 26}}, color = {0, 0, 255}));
  connect(switch.n, resistor.p) annotation(
    Line(points = {{42, 26}, {68, 26}, {68, -16}, {46, -16}}, color = {0, 0, 255}));
  connect(temperatureSensor.T, temperatureController.u) annotation(
    Line(points = {{-32, -52}, {-60, -52}, {-60, 70}, {-2, 70}}, color = {0, 0, 127}));
  connect(outsideHeat, sunshine.Q_flow) annotation(
    Line(points = {{-120, -72}, {-92, -72}}, color = {0, 0, 127}));
  connect(thermalConductor.port_b, roomTemp) annotation(
    Line(points = {{86, -52}, {106, -52}}, color = {191, 0, 0}));
connect(temperatureSensor.T, objectT) annotation(
    Line(points = {{-32, -52}, {-60, -52}, {-60, 90}, {80, 90}, {80, 22}, {110, 22}}, color = {0, 0, 127}));
  connect(temperatureSensor.port, heatCapacitor.port) annotation(
    Line(points = {{-12, -52}, {36, -52}, {36, -78}}, color = {191, 0, 0}));
  connect(thermalConductor.port_a, heatCapacitor.port) annotation(
    Line(points = {{66, -52}, {36, -52}, {36, -78}}, color = {191, 0, 0}));
  connect(sunshine.port, heatCapacitor.port) annotation(
    Line(points = {{-72, -72}, {36, -72}, {36, -78}}, color = {191, 0, 0}));
  connect(temperatureController.y, alarmOn) annotation(
    Line(points = {{22, 72}, {92, 72}, {92, 52}, {110, 52}}, color = {255, 0, 255}));
  connect(temperatureController.alarm, switch.control) annotation(
    Line(points = {{22, 66}, {32, 66}, {32, 38}}, color = {255, 0, 255}));
  connect(temperatureController.alarm, switchSignal) annotation(
    Line(points = {{22, 66}, {88, 66}, {88, -10}, {110, -10}}, color = {255, 0, 255}));
end HeatedElement;