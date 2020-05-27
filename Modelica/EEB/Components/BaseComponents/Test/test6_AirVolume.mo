within EEB.Components.BaseComponents.Test;

model test6_AirVolume
  EEB.Components.BaseComponents.Air.Sources.AirSource_wTX_fixed airSource_fixed_wTX(X0 = 8e-3, w0 = 1.21606, T0 = 273.15 + 25) annotation(Placement(visible = true, transformation(extent = {{-92, -14}, {-62, 14}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sinks.AirSink_P_fixed sink_W_fixed annotation(Placement(visible = true, transformation(extent = {{98, -14}, {72, 14}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Volumes.AirVolume airVolume(Tstart = 273.15 + 20, V = 10) annotation(Placement(visible = true, transformation(origin = {-8.88178e-16, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS convSca2Sca(gamma = 10) annotation(Placement(visible = true, transformation(extent = {{-10, 30}, {10, 50}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 303.15) annotation(Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Volumes.AirVolume airVolume1(Tstart = 273.15 + 20, V = 10) annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(airVolume.air_flange2, sink_W_fixed.air_flange) annotation(
    Line(points = {{20, 0}, {73, 0}}));
  connect(convSca2Sca.ss2, airVolume.heatPort) annotation(
    Line(points = {{0, 34}, {0, 18}}, color = {255, 0, 0}));
  connect(airSource_fixed_wTX.air_flange, airVolume.air_flange1) annotation(
    Line(points = {{-64, 0}, {-20, 0}}, color = {0, 100, 150}));
  connect(fixedTemperature.port, convSca2Sca.ss1) annotation(
    Line(points = {{-40, 70}, {0, 70}, {0, 46}, {0, 46}}, color = {191, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end test6_AirVolume;