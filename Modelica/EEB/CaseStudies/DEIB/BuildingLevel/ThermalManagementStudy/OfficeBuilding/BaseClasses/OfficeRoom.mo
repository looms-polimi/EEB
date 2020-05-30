within EEB.CaseStudies.DEIB.BuildingLevel.ThermalManagementStudy.OfficeBuilding.BaseClasses;

model OfficeRoom
  Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous layeredWall(ro = 1500, cp = 920, lambda = 0.2, A = A13, s = s1, n = n1) annotation(
    Placement(transformation(extent = {{-100, -12}, {-82, 14}})));
  Components.BaseComponents.Air.Volumes.AirVolume airVolume(Tstart = 273.15 + 25, V = Vroom) annotation(
    Placement(transformation(extent = {{-4, -66}, {46, -26}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca6(gamma = 3.5, S = A13) annotation(
    Placement(transformation(extent = {{-12, -10}, {12, 10}}, rotation = -90, origin = {-66, 2})));
  Interfaces.Thermal.HeatPort Wall1 annotation(
    Placement(transformation(extent = {{-120, -6}, {-110, 8}}), iconTransformation(extent = {{-64, -6}, {-58, 6}})));
  Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink_P_fixed annotation(
    Placement(transformation(extent = {{66, -56}, {46, -36}})));
  Interfaces.Thermal.HeatPort Wall3 annotation(
    Placement(transformation(extent = {{110, -8}, {120, 6}}), iconTransformation(extent = {{58, -6}, {64, 6}})));
  Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous layeredWall1(ro = 1500, cp = 920, lambda = 0.2, A = A13, s = s3, n = n3) annotation(
    Placement(transformation(extent = {{86, -14}, {104, 12}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca5(gamma = 3.5, S = A13) annotation(
    Placement(transformation(extent = {{-12, -10}, {12, 10}}, rotation = -90, origin = {72, 0})));
  Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous layeredWall3(ro = 1500, cp = 920, lambda = 0.2, A = A24, s = s4, n = n4) annotation(
    Placement(transformation(extent = {{-9, -13}, {9, 13}}, rotation = -90, origin = {-1, -91})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca3(gamma = 3.5, S = A24) annotation(
    Placement(transformation(extent = {{-12, -10}, {12, 10}}, rotation = 180, origin = {0, -74})));
  Interfaces.Thermal.HeatPort Wall4 annotation(
    Placement(transformation(extent = {{-5, -7}, {5, 7}}, rotation = -90, origin = {-1, -115}), iconTransformation(extent = {{-3.5, -4.5}, {3.5, 4.5}}, rotation = -90, origin = {-0.5, -60.5})));
  Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous layeredWall2(ro = 1500, cp = 920, lambda = 0.2, A = A24, s = s2, n = n2) annotation(
    Placement(transformation(extent = {{-9, -13}, {9, 13}}, rotation = -90, origin = {-1, 95})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca1(gamma = 3.5, S = A24) annotation(
    Placement(transformation(extent = {{-12, -10}, {12, 10}}, rotation = 180, origin = {0, 80})));
  Interfaces.Thermal.HeatPort Wall2 annotation(
    Placement(transformation(extent = {{-5, -7}, {5, 7}}, rotation = -90, origin = {-1, 115}), iconTransformation(extent = {{-3.5, -4.5}, {3.5, 4.5}}, rotation = -90, origin = {-0.5, 61.5})));
  Components.BaseComponents.HVAC.HeatPumps.HeatPump_ConstantCOPcool heatPump_ConstantCOPcool(constCOPcool = 3, Wmax = 1500) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {20, 48})));
  Modelica.Blocks.Interfaces.RealInput DesiredTemperature annotation(
    Placement(transformation(extent = {{-116, 24}, {-100, 40}}), iconTransformation(extent = {{-62, 24}, {-54, 32}})));
  Modelica.Blocks.Math.Gain gain(k = 1 / 3) annotation(
    Placement(transformation(extent = {{4, 18}, {14, 28}})));
  Interfaces.Thermal.HeatPort Texternal annotation(
    Placement(transformation(extent = {{-38, 42}, {-34, 54}}), iconTransformation(extent = {{-62, 36}, {-60, 44}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(transformation(extent = {{38, -12}, {26, 0}})));
  Modelica.Blocks.Interfaces.RealInput Noise "Peolpe+PC" annotation(
    Placement(transformation(extent = {{54, -12}, {42, 0}}), iconTransformation(extent = {{-62, 16}, {-54, 24}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue(Ti = Ti, K = K, CSmin = 0) annotation(
    Placement(transformation(extent = {{12, 13}, {-12, -13}}, rotation = 180, origin = {-30, 23})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor4 annotation(
    Placement(transformation(extent = {{6, -20}, {-2, -12}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin FromKelvin1 annotation(
    Placement(transformation(extent = {{-10, -20}, {-18, -12}})));
  Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous layeredWall4(ro = 1500, cp = 920, lambda = 0.2, s = sc, A = Ac, n = nc) annotation(
    Placement(transformation(extent = {{-48, -42}, {-42, -28}})));
  Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous layeredWall5(ro = 1500, cp = 920, lambda = 0.2, s = sf, A = Af, n = nf) annotation(
    Placement(transformation(extent = {{-48, -64}, {-42, -50}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca2(gamma = 3.5, S = Af) annotation(
    Placement(transformation(extent = {{-8, -4}, {8, 4}}, rotation = -90, origin = {-36, -56})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca4(gamma = 3.5, S = Ac) annotation(
    Placement(transformation(extent = {{-8, -4}, {8, 4}}, rotation = -90, origin = {-36, -34})));
  Interfaces.Thermal.HeatPort Ceiling annotation(
    Placement(transformation(extent = {{-56, -38}, {-52, -32}}), iconTransformation(extent = {{16, -20}, {18, -14}})));
  Interfaces.Thermal.HeatPort Floor annotation(
    Placement(transformation(extent = {{-56, -60}, {-52, -54}}), iconTransformation(extent = {{-20, -20}, {-18, -14}})));
  parameter SI.Area A13 = 15 "wall1 and wall3 surface";
  parameter SI.Area A24 = 15 "wall2 and wall4 surface";
  parameter SI.Area Af = 25 "floor surface";
  parameter SI.Area Ac = 25 "ceiling surface";
  parameter Real K = -3.5 "Gain";
  parameter SI.Time Ti = 220 "Integral time";
  Modelica.Blocks.Interfaces.RealOutput Troom annotation(
    Placement(transformation(extent = {{-78, -30}, {-92, -16}}), iconTransformation(extent = {{56, 50}, {66, 60}})));
  parameter SI.Volume Vroom = 5 * 5 * 3 "volume";
  parameter SI.Length s1 = 0.2 "wall_1 thickness";
  parameter SI.Length s2 = 0.2 "wall_2 thickness";
  parameter SI.Length s3 = 0.2 "wall_3 thickness";
  parameter SI.Length s4 = 0.2 "wall_4 thickness";
  parameter SI.Length sf = 0.2 "floor thickness";
  parameter SI.Length sc = 0.2 "ceiling thickness";
  parameter Integer n1 = 2 "number of layers of wall_1";
  parameter Integer n2 = 2 "number of layers of wall_2";
  parameter Integer n3 = 2 "number of layers of wall1_3";
  parameter Integer n4 = 2 "number of layers of wall1_4";
  parameter Integer nf = 2 "number of layers of floor";
  parameter Integer nc = 2 "number of layers of ceiling";
  Components.BaseComponents.Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX(w0 = 0, T0 = 273.15 + 25) annotation(
    Placement(transformation(extent = {{-24, -56}, {-4, -36}})));
equation
  connect(airVolume.air_flange2, airSink_P_fixed.air_flange) annotation(
    Line(points = {{41, -46}, {47, -46}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(convSca2Sca6.ss2, layeredWall.side2) annotation(
    Line(points = {{-72, 2}, {-74, 2}, {-74, 1}, {-86.5, 1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall1.side1, convSca2Sca5.ss1) annotation(
    Line(points = {{90.5, -1}, {74, -1}, {74, -1.11022e-15}, {78, -1.11022e-15}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall3.side1, convSca2Sca3.ss1) annotation(
    Line(points = {{-1, -86.5}, {0, -86.5}, {0, -80}, {-1.66533e-15, -80}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(convSca2Sca1.ss2, layeredWall2.side2) annotation(
    Line(points = {{-2.22045e-16, 86}, {0, 86}, {0, 90.5}, {-1, 90.5}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(convSca2Sca5.ss2, airVolume.heatPort) annotation(
    Line(points = {{66, 1.11022e-015}, {64, 1.11022e-015}, {64, 14}, {21, 14}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(convSca2Sca1.ss1, airVolume.heatPort) annotation(
    Line(points = {{-1.66533e-015, 74}, {-1.66533e-015, 68}, {64, 68}, {64, 14}, {21, 14}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(convSca2Sca6.ss1, airVolume.heatPort) annotation(
    Line(points = {{-60, 2}, {-58, 2}, {-58, 68}, {64, 68}, {64, 14}, {21, 14}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(convSca2Sca3.ss2, airVolume.heatPort) annotation(
    Line(points = {{-2.22045e-016, -68}, {-2.22045e-016, -66}, {64, -66}, {64, 14}, {21, 14}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(gain.y, heatPump_ConstantCOPcool.cmd01) annotation(
    Line(points = {{14.5, 23}, {20, 23}, {20, 40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(prescribedHeatFlow.port, airVolume.heatPort) annotation(
    Line(points = {{26, -6}, {21, -6}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(temperatureSensor4.T, FromKelvin1.Kelvin) annotation(
    Line(points = {{-2, -16}, {-9.2, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.u, aWPI_analogue.CS) annotation(
    Line(points = {{3, 23}, {-8, 23}, {-8, 30.8}, {-20.4, 30.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(prescribedHeatFlow.Q_flow, Noise) annotation(
    Line(points = {{38, -6}, {48, -6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(temperatureSensor4.port, airVolume.heatPort) annotation(
    Line(points = {{6, -16}, {21, -16}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall1.side2, Wall3) annotation(
    Line(points = {{99.5, -1}, {115, -1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Wall2, layeredWall2.side1) annotation(
    Line(points = {{-1, 115}, {-1, 99.5}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall.side1, Wall1) annotation(
    Line(points = {{-95.5, 1}, {-115, 1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall3.side2, Wall4) annotation(
    Line(points = {{-1, -95.5}, {-1, -115}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall4.side1, Ceiling) annotation(
    Line(points = {{-46.5, -35}, {-54, -35}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall5.side1, Floor) annotation(
    Line(points = {{-46.5, -57}, {-54, -57}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall5.side2, convSca2Sca2.ss2) annotation(
    Line(points = {{-43.5, -57}, {-40, -57}, {-40, -56}, {-38.4, -56}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(layeredWall4.side2, convSca2Sca4.ss2) annotation(
    Line(points = {{-43.5, -35}, {-40, -35}, {-40, -34}, {-38.4, -34}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(convSca2Sca4.ss1, airVolume.heatPort) annotation(
    Line(points = {{-33.6, -34}, {-22, -34}, {-22, -30}, {21, -30}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(convSca2Sca2.ss1, airVolume.heatPort) annotation(
    Line(points = {{-33.6, -56}, {-22, -56}, {-22, -30}, {21, -30}, {21, -28}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Troom, FromKelvin1.Celsius) annotation(
    Line(points = {{-85, -23}, {-20, -23}, {-20, -16}, {-18.4, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(DesiredTemperature, aWPI_analogue.SP) annotation(
    Line(points = {{-108, 32}, {-68, 32}, {-68, 30.8}, {-39.6, 30.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue.PV, FromKelvin1.Celsius) annotation(
    Line(points = {{-39.6, 23}, {-46, 23}, {-46, -18}, {-20, -18}, {-20, -16}, {-18.4, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPcool.hotPort, Texternal) annotation(
    Line(points = {{11, 48}, {-10.7, 48}, {-10.7, 48}, {-36, 48}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPcool.coldPort, airVolume.heatPort) annotation(
    Line(points = {{29, 48}, {38, 48}, {38, 14}, {21, 14}, {21, -28}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolume.air_flange1, airSource_fixed_wTX.air_flange) annotation(
    Line(points = {{1, -46}, {-5, -46}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {120, 120}}), graphics),
    Icon(coordinateSystem(extent = {{-120, -120}, {120, 120}}, preserveAspectRatio = false), graphics = {Rectangle(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 213}, fillPattern = FillPattern.Solid), Text(extent = {{-36, 22}, {36, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, textString = "%OfficeRoom
    ")}));
end OfficeRoom;