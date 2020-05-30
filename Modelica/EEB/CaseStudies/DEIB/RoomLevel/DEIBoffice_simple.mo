within EEB.CaseStudies.DEIB.RoomLevel;

model DEIBoffice_simple
  extends Icons.CaseStudyModel;
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = EEB.Types.AmbCondVariabilty.ACV_constant, Ta_avg = 295.15) annotation(Placement(transformation(extent = {{-200, 80}, {-180, 100}})));
  EEB.Components.BaseComponents.Air.Volumes.AirVolume_wawvQdPort V1(V = 5 * 4 * 3) annotation(Placement(transformation(extent = {{24, 30}, {64, -10}})));
  Components.AggregateComponents.Envelope.Openings.ExtenallWindow_Opening_SingleGlass Window(L = 3, H = 3, s = 0.05, material = EEB.Media.Materials.Glasses.Glass(), orientation = 180, wnom = 0.0001, Tstart = 293.15, dpnom = 1000) annotation(Placement(transformation(extent = {{100, 20}, {140, 60}})));
  Modelica.Blocks.Sources.Trapezoid opening(rising = 20, falling = 20, width = 120, period = 12 * 3600, startTime = 8 * 3600, amplitude = 0) annotation(Placement(transformation(extent = {{88, 72}, {108, 92}})));
  Components.AggregateComponents.Envelope.Walls.ExtenallWall_NoOpenings_Homogeneous extenallWall_NoOpenings_Homogeneous(L = 4, H = 1, orientation = 180, lambda = 0.4, Tstart = 293.15) annotation(Placement(transformation(extent = {{100, -40}, {140, 0}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTa annotation(Placement(transformation(extent = {{80, -88}, {60, -68}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow Pinternal(Q_flow = 10)  annotation(
    Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(opening.y, Window.opening01) annotation(
    Line(points = {{109, 82}, {118, 82}, {118, 56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Window.absToWall, extenallWall_NoOpenings_Homogeneous.airInt) annotation(
    Line(points = {{118, 22.2}, {118, 12}, {92, 12}, {92, -20}, {102, -20}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(V1.heatPort, extenallWall_NoOpenings_Homogeneous.airInt) annotation(
    Line(points = {{44, -8}, {44, -20}, {102, -20}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(sTa.port, extenallWall_NoOpenings_Homogeneous.airInt) annotation(
    Line(points = {{80, -78}, {92, -78}, {92, -20}, {102, -20}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(Window.dryair, V1.dryair) annotation(
    Line(points = {{100.8, 45.2}, {37.6, 45.2}, {37.6, 28.4}}, color = {0, 100, 150}));
  connect(Window.diffuse, V1.diffuse) annotation(
    Line(points = {{102, 40}, {44.4, 40}, {44.4, 28}}, color = {255, 0, 0}));
  connect(Window.vapour, V1.vapour) annotation(
    Line(points = {{100.8, 35.2}, {74, 35.2}, {50.4, 35.2}, {50.4, 28}}, color = {0, 100, 150}));
  connect(Pinternal.port, V1.heatPort) annotation(
    Line(points = {{-80, -20}, {44, -20}, {44, -8}, {44, -8}}, color = {191, 0, 0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})),           experiment(StopTime = 864000, StartTime = 0, Tolerance = 1e-6, Interval = 1728), __Dymola_experimentSetupOutput, Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}})),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end DEIBoffice_simple;