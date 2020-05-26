within EEB.CaseStudies.DEIB.TemperatureControl.Electric_equivalent.Rooms;

model RoomsElectrical
  Modelica.Electrical.Analog.Sources.SignalCurrent Heater1 annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-172, 0})));
  Modelica.Electrical.Analog.Basic.Capacitor Air1(C = Ca1) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-130, 0})));
  Modelica.Electrical.Analog.Basic.Capacitor Wall1(C = 3 * Cw) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-56, 2})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 1 / Gaw1) annotation(
    Placement(transformation(extent = {{-80, 14}, {-60, 34}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(
    Placement(transformation(extent = {{6, -6}, {-6, 6}}, rotation = 90, origin = {-90, 0})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent1 annotation(
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 90, origin = {-112, 0})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(transformation(extent = {{-10, -54}, {10, -34}})));
  Modelica.Electrical.Analog.Basic.Capacitor Wall2(C = 3 * Cw) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {62, 0})));
  Modelica.Electrical.Analog.Basic.Capacitor Air2(C = Ca2) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {134, 0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1 / Gaw2) annotation(
    Placement(transformation(extent = {{70, 14}, {90, 34}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 1 / Gwe1) annotation(
    Placement(transformation(extent = {{-28, 14}, {-8, 34}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R = 1 / Gwe2) annotation(
    Placement(transformation(extent = {{10, 14}, {30, 34}})));
  Modelica.Blocks.Interfaces.RealInput heater1 annotation(
    Placement(transformation(extent = {{-216, -16}, {-184, 16}}), iconTransformation(extent = {{-100, -38}, {-80, -18}})));
  Modelica.Blocks.Interfaces.RealOutput Troom1 annotation(
    Placement(transformation(extent = {{186, 72}, {214, 100}}), iconTransformation(extent = {{84, 40}, {104, 60}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {0, -2})));
  Modelica.Blocks.Interfaces.RealInput heater2 annotation(
    Placement(transformation(extent = {{-216, -108}, {-184, -76}}), iconTransformation(extent = {{-100, -60}, {-80, -40}})));
  Modelica.Blocks.Interfaces.RealInput Texternal annotation(
    Placement(transformation(extent = {{-216, -76}, {-184, -44}}), iconTransformation(extent = {{-100, -10}, {-80, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Troom2 annotation(
    Placement(transformation(extent = {{186, 46}, {214, 74}}), iconTransformation(extent = {{84, 20}, {104, 40}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(transformation(extent = {{6, -6}, {-6, 6}}, rotation = 90, origin = {96, 0})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent2 annotation(
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 90, origin = {114, 0})));
  Modelica.Electrical.Analog.Sources.SignalCurrent Heater2 annotation(
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {174, 0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R = 1 / Gi_aw1) annotation(
    Placement(transformation(extent = {{-60, 60}, {-40, 80}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R = 1 / Gi_aw2) annotation(
    Placement(transformation(extent = {{40, 60}, {60, 80}})));
  Modelica.Electrical.Analog.Basic.Capacitor Inside_Wall(C = Cwi) annotation(
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = -90, origin = {-8, 62})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(transformation(extent = {{-14, 34}, {-2, 46}})));
  parameter SI.Conductance Gaw1 = 35 "Air-Wall thermal conductance";
  parameter SI.Conductance Gaw2 = 35 "Air-Wall thermal conductance";
  parameter SI.Conductance Gwe1 = 37.5 "Wall-external thermal conductance";
  parameter SI.Conductance Gwe2 = 37.5 "Wall-external thermal conductance";
  parameter SI.Conductance Gi_aw1 = 28 "Wall-wall thermal conductance";
  parameter SI.Conductance Gi_aw2 = 28 "Wall-wall thermal conductance";
  parameter SI.Conductance Gdoor = 8 "Air-Door thermal conductance";
  parameter SI.Conductance Gloss1 = 0.0001 "Loss heater1";
  parameter SI.Conductance Gloss2 = 0.0001 "Loss heater2";
  parameter SI.Capacitance Cw = 3 * 5 * 0.4 * 1500 * 0.22 * 1000 * 4.184 "Capacitance of Wall";
  parameter SI.Capacitance Cwi = 3 * 5 * 0.01 * 1500 * 0.22 * 1000 * 4.184 "Capacitance of Wall";
  parameter SI.Capacitance Ca1 = 5 * 5 * 3 * 1.225 * 1010 "Capacitance of Air";
  parameter SI.Capacitance Ca2 = 5 * 5 * 3 * 1.225 * 1010 "Capacitance of Air";
  Modelica.Blocks.Interfaces.RealInput Room1Noise annotation(
    Placement(transformation(extent = {{-216, 32}, {-184, 64}}), iconTransformation(extent = {{-100, 40}, {-80, 60}})));
  Modelica.Blocks.Interfaces.RealInput Room2Noise annotation(
    Placement(transformation(extent = {{-216, 64}, {-184, 96}}), iconTransformation(extent = {{-100, 18}, {-80, 38}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor6(R = 1 / Gdoor) annotation(
    Placement(transformation(extent = {{-10, 88}, {10, 108}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor7(R = 1 / Gloss1) annotation(
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = -90, origin = {-150, 0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor8(R = 1 / Gloss2) annotation(
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = -90, origin = {152, 0})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor2 annotation(
    Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-38, 0})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor3 annotation(
    Placement(transformation(extent = {{6, -6}, {-6, 6}}, rotation = 90, origin = {40, 0})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor4 annotation(
    Placement(transformation(extent = {{6, -6}, {-6, 6}}, rotation = 90, origin = {14, 58})));
  Modelica.Blocks.Interfaces.RealOutput TinsideWall annotation(
    Placement(transformation(extent = {{186, -64}, {214, -36}}), iconTransformation(extent = {{84, -20}, {104, 0}})));
  Modelica.Blocks.Interfaces.RealOutput TWall2 annotation(
    Placement(transformation(extent = {{186, -106}, {214, -78}}), iconTransformation(extent = {{84, -60}, {104, -40}})));
  Modelica.Blocks.Interfaces.RealOutput TWall1 annotation(
    Placement(transformation(extent = {{186, -86}, {214, -58}}), iconTransformation(extent = {{84, -40}, {104, -20}})));
equation
  connect(Wall1.n, Air1.n) annotation(
    Line(points = {{-56, -8}, {-56, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Wall1.p, resistor.n) annotation(
    Line(points = {{-56, 12}, {-56, 24}, {-60, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Heater1.n, resistor.p) annotation(
    Line(points = {{-172, 10}, {-172, 24}, {-80, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Air1.p, resistor.p) annotation(
    Line(points = {{-130, 10}, {-130, 24}, {-80, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor.n, Air1.n) annotation(
    Line(points = {{-90, -6}, {-90, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor.p, resistor.p) annotation(
    Line(points = {{-90, 6}, {-90, 24}, {-80, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor2.n, resistor3.p) annotation(
    Line(points = {{-8, 24}, {10, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor3.n, Wall2.p) annotation(
    Line(points = {{30, 24}, {62, 24}, {62, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalVoltage.n, Air1.n) annotation(
    Line(points = {{-1.77636e-015, -12}, {-1.77636e-015, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Heater1.p, Air1.n) annotation(
    Line(points = {{-172, -10}, {-172, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalVoltage.p, resistor3.p) annotation(
    Line(points = {{1.77636e-015, 8}, {1.77636e-015, 24}, {10, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Wall2.n, Air1.n) annotation(
    Line(points = {{62, -10}, {62, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalCurrent1.n, resistor.p) annotation(
    Line(points = {{-112, 8}, {-112, 24}, {-80, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalCurrent1.p, Air1.n) annotation(
    Line(points = {{-112, -8}, {-112, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor2.p, resistor.n) annotation(
    Line(points = {{-28, 24}, {-60, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ground1.p, Air1.n) annotation(
    Line(points = {{0, -34}, {0, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor1.p, Wall2.p) annotation(
    Line(points = {{70, 24}, {62, 24}, {62, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor1.n, Air2.p) annotation(
    Line(points = {{90, 24}, {134, 24}, {134, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Air2.n, Air1.n) annotation(
    Line(points = {{134, -10}, {134, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor1.p, Air2.p) annotation(
    Line(points = {{96, 6}, {96, 24}, {134, 24}, {134, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor1.n, Air1.n) annotation(
    Line(points = {{96, -6}, {96, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalCurrent2.n, Air2.p) annotation(
    Line(points = {{114, 8}, {114, 24}, {134, 24}, {134, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(signalCurrent2.p, Air1.n) annotation(
    Line(points = {{114, -8}, {114, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Heater2.n, Air2.p) annotation(
    Line(points = {{174, 10}, {174, 24}, {134, 24}, {134, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Heater2.p, Air1.n) annotation(
    Line(points = {{174, -10}, {174, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor1.v, Troom2) annotation(
    Line(points = {{102, 0}, {102, 60}, {200, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageSensor.v, Troom1) annotation(
    Line(points = {{-84, 0}, {-84, 86}, {200, 86}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heater1, Heater1.i) annotation(
    Line(points = {{-200, 0}, {-179, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal, signalVoltage.v) annotation(
    Line(points = {{-200, -60}, {-20, -60}, {-20, -2}, {-7, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(resistor4.p, resistor.p) annotation(
    Line(points = {{-60, 70}, {-130, 70}, {-130, 24}, {-80, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor4.n, Inside_Wall.p) annotation(
    Line(points = {{-40, 70}, {-8, 70}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor5.p, Inside_Wall.p) annotation(
    Line(points = {{40, 70}, {-8, 70}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor5.n, Air2.p) annotation(
    Line(points = {{60, 70}, {134, 70}, {134, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(ground2.p, Inside_Wall.n) annotation(
    Line(points = {{-8, 46}, {-8, 54}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Room1Noise, signalCurrent1.i) annotation(
    Line(points = {{-200, 48}, {-117.6, 48}, {-117.6, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Room2Noise, signalCurrent2.i) annotation(
    Line(points = {{-200, 80}, {108.4, 80}, {108.4, 4.44089e-016}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(resistor6.p, resistor.p) annotation(
    Line(points = {{-10, 98}, {-130, 98}, {-130, 24}, {-80, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor6.n, Air2.p) annotation(
    Line(points = {{10, 98}, {134, 98}, {134, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor7.p, resistor.p) annotation(
    Line(points = {{-150, 8}, {-150, 24}, {-80, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor7.n, Air1.n) annotation(
    Line(points = {{-150, -8}, {-150, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor8.p, Air2.p) annotation(
    Line(points = {{152, 8}, {152, 24}, {134, 24}, {134, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistor8.n, Air1.n) annotation(
    Line(points = {{152, -8}, {152, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor2.p, resistor.n) annotation(
    Line(points = {{-38, 6}, {-38, 24}, {-60, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor2.n, Air1.n) annotation(
    Line(points = {{-38, -6}, {-38, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor3.p, Wall2.p) annotation(
    Line(points = {{40, 6}, {40, 24}, {62, 24}, {62, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor3.n, Air1.n) annotation(
    Line(points = {{40, -6}, {40, -24}, {-130, -24}, {-130, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor4.p, Inside_Wall.p) annotation(
    Line(points = {{14, 64}, {14, 70}, {-8, 70}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor4.n, ground2.p) annotation(
    Line(points = {{14, 52}, {14, 46}, {-8, 46}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor2.v, TWall1) annotation(
    Line(points = {{-44, 0}, {-44, -72}, {200, -72}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heater2, Heater2.i) annotation(
    Line(points = {{-200, -92}, {-156, -92}, {-156, -76}, {144, -76}, {144, -32}, {186, -32}, {186, 0}, {181, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageSensor3.v, TWall2) annotation(
    Line(points = {{46, 0}, {48, 0}, {48, -92}, {200, -92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageSensor4.v, TinsideWall) annotation(
    Line(points = {{20, 58}, {52, 58}, {52, -50}, {200, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = false), graphics = {Rectangle(extent = {{-90, 60}, {90, -60}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {0, 128, 255}), Text(extent = {{-50, 20}, {56, -10}}, lineColor = {0, 0, 0}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid, textString = "Rooms")}));
end RoomsElectrical;