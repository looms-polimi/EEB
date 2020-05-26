within EEB.InternalTests.LabForSeminars;

model Example_002
  EEB.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
    Placement(visible = true, transformation(origin = {-20, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
    Placement(visible = true, transformation(origin = {60, -4.44089e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner EEB.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
EEB.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100)  annotation(
    Placement(visible = true, transformation(origin = {-140, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
    Placement(visible = true, transformation(origin = {-80, 1.42109e-14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
EEB.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource annotation(
    Placement(visible = true, transformation(origin = {-170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(a2w.wall, MLwall.side1) annotation(
    Line(points = {{-64, 0}, {-30, 0}}, color = {255, 0, 0}));
  connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
    Line(points = {{-10, 0}, {44, 0}}, color = {255, 0, 0}));
  connect(airSource.air_flange, air.air_flange2) annotation(
    Line(points = {{-161, -30}, {-140, -30}, {-140, -16}}, color = {0, 100, 150}));
  connect(air.heatPort, a2w.air) annotation(
    Line(points = {{-122, 0}, {-100, 0}, {-100, 0}, {-96, 0}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
end Example_002;