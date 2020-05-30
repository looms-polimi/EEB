within EEB.CaseStudies.DEIB.BuildingLevel.ThermalManagementStudy.Rooms.BaseClasses;

model BaseRoomThermalSimplified
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gdoor(G = 8) annotation(
    Placement(transformation(extent = {{-10, 414}, {10, 434}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(transformation(extent = {{-620, 390}, {-600, 410}})));
  Components.BaseComponents.Air.Volumes.AirVolume AirRoom1(V = 5 * 5 * 3, Xstart = 0.001, Tstart = Tstart) annotation(
    Placement(transformation(extent = {{-378, 368}, {-218, 270}})));
  Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink1 annotation(
    Placement(transformation(extent = {{-160, 308}, {-184, 330}})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS Gwe1(S = 1, gamma = 37.5) "Wall-external thermal conductance" annotation(
    Placement(transformation(extent = {{-11, -12}, {11, 12}}, rotation = -90, origin = {-552, 401})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS Gwe2(S = 1, gamma = 37.5) "Wall-external thermal conductance" annotation(
    Placement(transformation(extent = {{-13, -11}, {13, 11}}, rotation = -90, origin = {637, 401})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS Gaw2(S = 1, gamma = 35) "Air-Wall thermal conductance" annotation(
    Placement(transformation(extent = {{-13, -12}, {13, 12}}, rotation = -90, origin = {586, 401})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS Gi_aw2(S = 1, gamma = 28) "Wall-wall thermal conductance" annotation(
    Placement(transformation(extent = {{-13, -11}, {13, 11}}, rotation = -90, origin = {19, 3})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS Gaw1(S = 1, gamma = 35) "Air-Wall thermal conductance" annotation(
    Placement(transformation(extent = {{-13, -10}, {13, 10}}, rotation = -90, origin = {-508, 401})));
  Components.BaseComponents.Thermal.HeatTransfer.Convection_SS Gi_aw1(S = 1, gamma = 28) "Wall-wall thermal conductance" annotation(
    Placement(transformation(extent = {{-13, -11}, {13, 11}}, rotation = -90, origin = {-17, 3})));
  Components.BaseComponents.Air.Volumes.AirVolume AirRoom2(V = 5 * 5 * 3, Xstart = 0.001, Tstart = Tstart) annotation(
    Placement(transformation(extent = {{350, 372}, {510, 270}})));
  Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink2 annotation(
    Placement(transformation(extent = {{558, 310}, {534, 332}})));
  Components.BaseComponents.Thermal.Capacities.MassT Wall1(M = 3 * (5 * 3 * 0.4) * 1500, cp = 0.22 * 1000 * 4.184, Tstart = Tstart) annotation(
    Placement(transformation(extent = {{-542, 416}, {-516, 444}})));
  Components.BaseComponents.Thermal.Capacities.MassT InsideWall(M = 5 * 3 * 0.01 * 1500, cp = 0.22 * 1000 * 4.184, Tstart = Tstart) annotation(
    Placement(transformation(extent = {{-14, 26}, {14, 54}})));
  Components.BaseComponents.Thermal.Capacities.MassT Wall2(M = 3 * (5 * 3 * 0.4) * 1500, cp = 0.22 * 1000 * 4.184, Tstart = Tstart) annotation(
    Placement(transformation(extent = {{596, 422}, {622, 450}})));
  Modelica.Blocks.Interfaces.RealOutput Troom1 annotation(
    Placement(visible = true,transformation(extent = {{-366, 388}, {-346, 408}}, rotation = 0), iconTransformation(extent = {{94, 28}, {120, 54}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor4 annotation(
    Placement(transformation(extent = {{-448, 388}, {-428, 408}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1 annotation(
    Placement(transformation(extent = {{290, 384}, {310, 404}})));
  Modelica.Blocks.Interfaces.RealOutput Troom2 annotation(
    Placement(visible = true,transformation(extent = {{368, 384}, {388, 404}}, rotation = 0), iconTransformation(extent = {{94, -50}, {120, -24}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin FromKelvin2 annotation(
    Placement(transformation(extent = {{330, 384}, {350, 404}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin FromKelvin1 annotation(
    Placement(transformation(extent = {{-402, 388}, {-382, 408}})));
  Components.BaseComponents.HVAC.HeatPumps.HeatPump_ConstantCOPheat heatPump_ConstantCOPheat(Wmax = Wmax, constCOPheat = COPheat) annotation(
    Placement(transformation(extent = {{-21, -35}, {21, 35}}, rotation = -90, origin = {-165, 391})));
  Components.BaseComponents.HVAC.HeatPumps.HeatPump_ConstantCOPheat heatPump_ConstantCOPheat1(Wmax = Wmax, constCOPheat = COPheat) annotation(
    Placement(transformation(extent = {{-21, -35}, {21, 35}}, rotation = -90, origin = {161, 395})));
  Modelica.Blocks.Interfaces.RealInput Texternal annotation(
    Placement(visible = true,transformation(extent = {{-700, 380}, {-660, 420}}, rotation = 0), iconTransformation(extent = {{-124, 34}, {-98, 60}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput heater1 annotation(
    Placement(visible = true,transformation(extent = {{-264, 428}, {-224, 468}}, rotation = 0), iconTransformation(extent = {{-124, -14}, {-98, 12}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1 / (Wmax * COPheat)) annotation(
    Placement(transformation(extent = {{-206, 438}, {-186, 458}})));
  Modelica.Blocks.Math.Gain gain1(k = 1 / (Wmax * COPheat)) annotation(
    Placement(transformation(extent = {{122, 442}, {142, 462}})));
  Modelica.Blocks.Interfaces.RealInput heater2 annotation(
    Placement(visible = true,transformation(extent = {{64, 432}, {104, 472}}, rotation = 0), iconTransformation(extent = {{-124, -60}, {-98, -34}}, rotation = 0)));
  Components.BaseComponents.Air.Renovation.AirRenovation airRenovation(wr = wr) annotation(
    Placement(transformation(extent = {{-444, 432}, {-402, 452}})));
  Components.BaseComponents.Air.Renovation.AirRenovation airRenovation1(wr = wr) annotation(
    Placement(transformation(extent = {{142, 306}, {184, 326}})));
  parameter SI.Temperature Tstart = 273.15 + 15 "Initial moist air and wall temperature";
  parameter SI.HeatFlowRate Wmax = 1000 "W heater at cmd=1";
  parameter Real COPheat = 3 "conatant heating COP";
  parameter SI.MassFlowRate wr = airRenovation.V * airRenovation.k "Air flow rate";
  Components.BaseComponents.Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX(w0 = 0, T0 = Tstart) annotation(
    Placement(transformation(extent = {{-430, 308}, {-410, 330}})));
  Components.BaseComponents.Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX1(w0 = 0, T0 = Tstart) annotation(
    Placement(transformation(extent = {{306, 310}, {326, 332}})));
equation
  connect(airSink1.air_flange, AirRoom1.air_flange2) annotation(
    Line(points = {{-181.6, 319}, {-234, 319}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airSink2.air_flange, AirRoom2.air_flange2) annotation(
    Line(points = {{536.4, 321}, {494, 321}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(Wall1.surf, Gwe1.ss1) annotation(
    Line(points = {{-529, 418.8}, {-529, 401}, {-544.8, 401}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gaw1.ss2, Gwe1.ss1) annotation(
    Line(points = {{-514, 401}, {-530, 401}, {-530, 401}, {-544.8, 401}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(temperatureSensor1.T, FromKelvin2.Kelvin) annotation(
    Line(points = {{310, 394}, {328, 394}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom2, FromKelvin2.Celsius) annotation(
    Line(points = {{378, 394}, {351, 394}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(temperatureSensor4.T, FromKelvin1.Kelvin) annotation(
    Line(points = {{-428, 398}, {-404, 398}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom1, FromKelvin1.Celsius) annotation(
    Line(points = {{-356, 398}, {-381, 398}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gwe1.ss2, prescribedTemperature.port) annotation(
    Line(points = {{-559.2, 401}, {-565.8, 401}, {-565.8, 400}, {-600, 400}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gwe2.ss1, prescribedTemperature.port) annotation(
    Line(points = {{643.6, 401}, {658, 401}, {658, -462}, {-570, -462}, {-570, 400}, {-600, 400}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gaw1.ss1, AirRoom1.heatPort) annotation(
    Line(points = {{-502, 401}, {-486, 401}, {-486, 240}, {-298, 240}, {-298, 274.9}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gi_aw1.ss2, AirRoom1.heatPort) annotation(
    Line(points = {{-23.6, 3}, {-38, 3}, {-38, -438}, {-486, -438}, {-486, 240}, {-298, 240}, {-298, 274.9}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gdoor.port_a, AirRoom1.heatPort) annotation(
    Line(points = {{-10, 424}, {-38, 424}, {-38, -438}, {-486, -438}, {-486, 240}, {-298, 240}, {-298, 274.9}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gaw2.ss2, AirRoom2.heatPort) annotation(
    Line(points = {{578.8, 401}, {572, 401}, {572, 400}, {560, 400}, {560, 260}, {430, 260}, {430, 275.1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gi_aw2.ss1, AirRoom2.heatPort) annotation(
    Line(points = {{25.6, 3}, {38, 3}, {38, -440}, {560, -440}, {560, 260}, {430, 260}, {430, 275.1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gaw2.ss1, Wall2.surf) annotation(
    Line(points = {{593.2, 401}, {609, 401}, {609, 424.8}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gwe2.ss2, Wall2.surf) annotation(
    Line(points = {{630.4, 401}, {612, 401}, {612, 400}, {609, 400}, {609, 424.8}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gi_aw1.ss1, InsideWall.surf) annotation(
    Line(points = {{-10.4, 3}, {1.77636e-15, 3}, {1.77636e-15, 28.8}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gi_aw2.ss2, InsideWall.surf) annotation(
    Line(points = {{12.4, 3}, {1.77636e-15, 3}, {1.77636e-15, 28.8}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(Gdoor.port_b, AirRoom2.heatPort) annotation(
    Line(points = {{10, 424}, {38, 424}, {38, -440}, {560, -440}, {560, 260}, {430, 260}, {430, 275.1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPheat.hotPort, AirRoom1.heatPort) annotation(
    Line(points = {{-133.5, 391}, {-92, 391}, {-92, 240}, {-298, 240}, {-298, 274.9}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPheat1.hotPort, AirRoom2.heatPort) annotation(
    Line(points = {{192.5, 395}, {212, 395}, {212, 394}, {238, 394}, {238, 260}, {430, 260}, {430, 275.1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(temperatureSensor4.port, AirRoom1.heatPort) annotation(
    Line(points = {{-448, 398}, {-458, 398}, {-458, 240}, {-298, 240}, {-298, 274.9}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(temperatureSensor1.port, AirRoom2.heatPort) annotation(
    Line(points = {{290, 394}, {282, 394}, {282, 260}, {430, 260}, {430, 275.1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(prescribedTemperature.T, Texternal) annotation(
    Line(points = {{-622, 400}, {-680, 400}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heater1, gain.u) annotation(
    Line(points = {{-244, 448}, {-208, 448}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.y, heatPump_ConstantCOPheat.cmd01) annotation(
    Line(points = {{-185, 448}, {-165, 448}, {-165, 407.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heater2, gain1.u) annotation(
    Line(points = {{84, 452}, {120, 452}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain1.y, heatPump_ConstantCOPheat1.cmd01) annotation(
    Line(points = {{143, 452}, {161, 452}, {161, 411.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPheat.coldPort, prescribedTemperature.port) annotation(
    Line(points = {{-196.5, 391}, {-284, 391}, {-284, 460}, {-590, 460}, {-590, 400}, {-600, 400}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(heatPump_ConstantCOPheat1.coldPort, prescribedTemperature.port) annotation(
    Line(points = {{129.5, 395}, {64, 395}, {64, 472}, {-590, 472}, {-590, 400}, {-600, 400}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(airRenovation.heatPort1, prescribedTemperature.port) annotation(
    Line(points = {{-433.5, 442}, {-590, 442}, {-590, 400}, {-600, 400}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(airRenovation.heatPort2, AirRoom1.heatPort) annotation(
    Line(points = {{-412.5, 442}, {-302, 442}, {-302, 358}, {-458, 358}, {-458, 240}, {-298, 240}, {-298, 274.9}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(airRenovation1.heatPort2, AirRoom2.heatPort) annotation(
    Line(points = {{173.5, 316}, {238, 316}, {238, 260}, {430, 260}, {430, 275.1}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(airRenovation1.heatPort1, prescribedTemperature.port) annotation(
    Line(points = {{152.5, 316}, {64, 316}, {64, 472}, {-590, 472}, {-590, 400}, {-600, 400}}, color = {255, 128, 0}, smooth = Smooth.None));
  connect(AirRoom1.air_flange1, airSource_fixed_wTX.air_flange) annotation(
    Line(points = {{-362, 319}, {-412, 319}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airSource_fixed_wTX1.air_flange, AirRoom2.air_flange1) annotation(
    Line(points = {{324, 321}, {366, 321}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics = {Rectangle(origin = {0, -0.01}, fillColor = {138, 226, 52}, fillPattern = FillPattern.Solid, extent = {{-100, 99.99}, {100, -99.99}}), Text(origin = {-11, 2}, extent = {{-71, 78}, {71, -78}}, textString = "Room\nthermal\nsimplified")}));
end BaseRoomThermalSimplified;