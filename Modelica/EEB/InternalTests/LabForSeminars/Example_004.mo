within EEB.InternalTests.LabForSeminars;

model Example_004
  EEB.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
    Placement(visible = true, transformation(origin = {80, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
    Placement(visible = true, transformation(origin = {140, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner EEB.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
    Placement(visible = true, transformation(origin = {-40, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
    Placement(visible = true, transformation(origin = {20, 1.42109e-14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
    Placement(visible = true, transformation(origin = {-58, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.25 + 25) annotation(
    Placement(visible = true, transformation(origin = {-156, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
EEB.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 300 / 3600, CSmin = 0, K = 10, Ti = 100)  annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
    Placement(visible = true, transformation(origin = {-110, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(sT.T, PI_T.PV) annotation(
    Line(points = {{-120, -70}, {-130, -70}, {-130, -30}, {-118, -30}, {-118, -30}}, color = {0, 0, 127}));
  connect(air.heatPort, sT.port) annotation(
    Line(points = {{-22, 0}, {-22, 0}, {-22, -70}, {-100, -70}, {-100, -70}}, color = {255, 0, 0}));
  connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
    Line(points = {{90, -4.44089e-16}, {117, -4.44089e-16}, {117, 0}, {124, 0}}, color = {255, 0, 0}));
  connect(PI_T.CS, fan.iq) annotation(
    Line(points = {{-102, -24}, {-58, -24}, {-58, -46}, {-58, -46}}, color = {0, 0, 127}));
  connect(spT.y, PI_T.SP) annotation(
    Line(points = {{-145, -24}, {-119, -24}}, color = {0, 0, 127}));
  connect(fan.air_flange2, air.air_flange2) annotation(
    Line(points = {{-50, -50}, {-40, -50}, {-40, -16}, {-40, -16}}, color = {0, 100, 150}));
  connect(airSource.air_flange, fan.air_flange1) annotation(
    Line(points = {{-80, -50}, {-66, -50}}, color = {0, 100, 150}));
  connect(airSink.air_flange, air.air_flange1) annotation(
    Line(points = {{-60, 30}, {-40, 30}, {-40, 16}, {-40, 16}}, color = {0, 100, 150}));
  connect(air.heatPort, a2w.air) annotation(
    Line(points = {{-22, 0}, {-10, 0}, {-10, 0}, {2, 0}, {2, 0}, {3, 0}, {3, 0}, {4, 0}}, color = {255, 0, 0}));
  connect(a2w.wall, MLwall.side1) annotation(
    Line(points = {{36, 1.42109e-14}, {70, 1.42109e-14}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
end Example_004;