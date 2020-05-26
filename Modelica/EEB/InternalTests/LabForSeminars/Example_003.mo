within EEB.InternalTests.LabForSeminars;

model Example_003
  EEB.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
    Placement(visible = true, transformation(origin = {80, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
    Placement(visible = true, transformation(origin = {160, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner EEB.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
    Placement(visible = true, transformation(origin = {-40, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
    Placement(visible = true, transformation(origin = {20, 1.42109e-14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15)  annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
EEB.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
    Placement(visible = true, transformation(origin = {-58, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
EEB.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.RealExpression qa(y = 50 / 3600)  annotation(
    Placement(visible = true, transformation(origin = {-92, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(qa.y, fan.iq) annotation(
    Line(points = {{-80, -30}, {-58, -30}, {-58, -46}, {-58, -46}}, color = {0, 0, 127}));
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
  connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
    Line(points = {{90, -4.44089e-16}, {144, -4.44089e-16}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
end Example_003;