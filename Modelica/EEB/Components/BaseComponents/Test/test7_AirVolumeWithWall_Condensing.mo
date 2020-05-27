within EEB.Components.BaseComponents.Test;

model test7_AirVolumeWithWall_Condensing
  Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX( T0 = 273.15 + 20, X0 = 8e-3,w0 = 1.21606) annotation(Placement(transformation(extent = {{-88, -20}, {-58, 8}})));
  Air.Sinks.AirSink_P_fixed sink_W_fixed annotation(Placement(transformation(extent = {{82, -20}, {40, 8}})));
  EEB.Components.BaseComponents.Air.Volumes.AirVolumeWithWall_Condensing airVolumeWithWall_Condensing(Xstart = 0.001, V = 10) annotation(Placement(visible = true, transformation(origin = {1, -6}, extent = {{-19, -20}, {19, 20}}, rotation = 0)));
  Air.Pdrops.AirPdrop_Lin pdrop annotation(Placement(transformation(extent = {{-48, -16}, {-28, 4}})));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca(S = 10, gamma = 100) annotation(Placement(visible = true, transformation(extent = {{-10, 26}, {10, 46}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 278.15) annotation(Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(airVolumeWithWall_Condensing.air_flange2, sink_W_fixed.air_flange) annotation(
    Line(points = {{20, -6}, {44.2, -6}}));
  connect(airSource_fixed_wTX.air_flange, pdrop.air_flange1) annotation(Line(points = {{-61, -6}, {-46, -6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(pdrop.air_flange2, airVolumeWithWall_Condensing.air_flange1) annotation(
    Line(points = {{-30, -6}, {-18, -6}}));
  connect(airVolumeWithWall_Condensing.heatPort, convSca2Sca.ss2) annotation(
    Line(points = {{1, 12}, {1, 10.5}, {0, 10.5}, {0, 30}}, color = {255, 0, 0}));
  connect(fixedTemperature.port, convSca2Sca.ss1) annotation(
    Line(points = {{-40, 70}, {0, 70}, {0, 42}}, color = {191, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end test7_AirVolumeWithWall_Condensing;