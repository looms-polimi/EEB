within EEB.CaseStudies.DEIB;

model foo
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = EEB.Types.AmbCondVariabilty.ACV_constant, Ta_avg = 295.15) annotation(Placement(transformation(extent = {{-200, 80}, {-180, 100}})));
  EEB.Components.BaseComponents.Air.Volumes.AirVolume_wawvQdPort V1(V = 5 * 4 * 3) annotation(Placement(transformation(extent = {{24, 30}, {64, -10}})));
  EEB.Components.AggregateComponents.Envelope.Openings.ExtenallWindow_Opening_SingleGlass Window(L = 3, H = 3, s = 0.05, material = EEB.Media.Materials.Glasses.Glass(), orientation = 180, wnom = 0.0001, Tstart = 293.15, dpnom = 1000) annotation(Placement(visible = true, transformation(extent = {{86, 16}, {126, 56}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, width = 120, period = 12 * 3600, startTime = 8 * 3600, amplitude = 0) annotation(Placement(visible = true, transformation(extent = {{18, 60}, {38, 80}}, rotation = 0)));
  EEB.Components.AggregateComponents.Envelope.Walls.ExtenallWall_NoOpenings_Homogeneous extenallWall_NoOpenings_Homogeneous(L = 4, H = 1, orientation = 180, lambda = 0.4, Tstart = 293.15) annotation(Placement(visible = true, transformation(extent = {{136, -50}, {176, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTa annotation(Placement(transformation(extent = {{80, -88}, {60, -68}})));
  Modelica.Blocks.Sources.RealExpression Taset(y = 273.15 + 20) annotation(Placement(visible = true, transformation(extent = {{-16, 26}, {-36, 46}}, rotation = 0)));
equation
  connect(opening.y, Window.opening01) annotation(
    Line(points = {{39, 70}, {104, 70}, {104, 52}}, color = {0, 0, 127}));
  connect(Window.absToWall, extenallWall_NoOpenings_Homogeneous.airInt) annotation(
    Line(points = {{104, 18}, {104, -30}, {138, -30}}, color = {255, 0, 0}));
  connect(V1.heatPort, extenallWall_NoOpenings_Homogeneous.airInt) annotation(
    Line(points = {{44, -8}, {44, -30}, {138, -30}}, color = {255, 0, 0}));
  connect(sTa.port, extenallWall_NoOpenings_Homogeneous.airInt) annotation(
    Line(points = {{80, -78}, {92, -78}, {92, -30}, {138, -30}}, color = {191, 0, 0}));
  connect(Window.dryair, V1.dryair) annotation(
    Line(points = {{87, 41}, {37.6, 41}, {37.6, 28.4}}, color = {0, 100, 150}));
  connect(Window.diffuse, V1.diffuse) annotation(
    Line(points = {{88, 36}, {44.4, 36}, {44.4, 28}}, color = {255, 0, 0}));
  connect(Window.vapour, V1.vapour) annotation(
    Line(points = {{87, 31}, {50.4, 31}, {50.4, 28}}, color = {0, 100, 150}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})),           experiment(StopTime = 864000, StartTime = 0, Tolerance = 1e-6, Interval = 1728), __Dymola_experimentSetupOutput, Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end foo;