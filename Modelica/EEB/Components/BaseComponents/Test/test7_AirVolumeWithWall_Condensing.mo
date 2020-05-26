within EEB.Components.BaseComponents.Test;

model test7_AirVolumeWithWall_Condensing
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX( T0 = 273.15 + 20, X0 = 8e-3,w0 = 1.21606) annotation(Placement(transformation(extent = {{-88, -20}, {-58, 8}})));
  Air.Sinks.AirSink_P_fixed sink_W_fixed annotation(Placement(transformation(extent = {{82, -20}, {40, 8}})));
  Air.Volumes.AirVolumeWithWall_Condensing airVolumeWithWall_Condensing(Xstart = 0.001, V = 10) annotation(Placement(transformation(extent = {{-22, -20}, {8, 8}})));
  Air.Pdrops.AirPdrop_Lin pdrop annotation(Placement(transformation(extent = {{-48, -16}, {-28, 4}})));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca(S = 10, gamma = 100) annotation(Placement(visible = true, transformation(extent = {{-16, 26}, {4, 46}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 278.15) annotation(Placement(transformation(extent = {{-56, 60}, {-42, 74}})));
equation
  connect(airVolumeWithWall_Condensing.air_flange2, sink_W_fixed.air_flange) annotation(Line(points = {{5, -6}, {44.2, -6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airSource_fixed_wTX.air_flange, pdrop.air_flange1) annotation(Line(points = {{-61, -6}, {-46, -6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pdrop.air_flange2, airVolumeWithWall_Condensing.air_flange1) annotation(Line(points = {{-30, -6}, {-19, -6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(airVolumeWithWall_Condensing.heatPort, convSca2Sca.ss2) annotation(
    Line(points = {{-7, 6.6}, {-7, 10.5}, {-6, 10.5}, {-6, 30}}, color = {255, 0, 0}));
  connect(fixedTemperature.port, convSca2Sca.ss1) annotation(
    Line(points = {{-42, 67}, {-6, 67}, {-6, 42}}, color = {191, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2));
end test7_AirVolumeWithWall_Condensing;