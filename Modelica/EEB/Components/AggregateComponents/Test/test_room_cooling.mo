within EEB.Components.AggregateComponents.Test;

model test_room_cooling
  Envelope.Walls.ExtenallWall_NoOpenings_Homogeneous extenallWall_NoOpenings_Homogeneous(s = 0.3, n = 10, inclination = 90, L = 10, orientation = 180, lambda = 0.8) annotation(Placement(transformation(extent = {{60, 0}, {80, 20}})));
  inner BoundaryConditions.AmbientConditions ambient_settings(acv = EEB.Types.AmbCondVariabilty.ACV_constant, Ta_avg = 273.15 + 35, Phimax = 1000, Xa_avg = 0.002, azi0 = 180) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  BaseComponents.Air.Volumes.AirVolume airVolume_closed(Xstart = 0.006, V = 80 * 3) annotation(Placement(transformation(extent = {{20, -16}, {40, 4}})));
  Controllers.Blocks.Analogue.AWPI_1dof_trk aWPI_1dof( CSmax = 0, CSmin = -2000, K = 100,Ti = 200) annotation(Placement(transformation(extent = {{-32, 14}, {-12, 34}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(Placement(transformation(extent = {{50, -52}, {70, -32}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(Placement(transformation(extent = {{4, 52}, {24, 72}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 273.15 + 20) annotation(Placement(visible = true, transformation(extent = {{-82, 36}, {-62, 56}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 0) annotation(Placement(transformation(extent = {{-84, -12}, {-64, 8}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width = 0.5, period = 100) annotation(Placement(visible = true, transformation(extent = {{-108, 8}, {-88, 28}}, rotation = 0)));
  BaseComponents.Thermal.Capacities.ThermalCap thermalCap(C = 5000) annotation(Placement(transformation(extent = {{40, 66}, {60, 86}})));
  BaseComponents.Thermal.HeatTransfer.Convection_SS convection_SS(S = 1, gamma = 100) annotation(Placement(transformation(extent = {{22, 22}, {42, 42}})));
equation
  connect(airVolume_closed.heatPort, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{30, 3}, {30, 10}, {61, 10}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(temperatureSensor.port, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{50, -42}, {50, 10}, {61, 10}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(temperatureSensor.T, aWPI_1dof.PV) annotation(Line(points = {{70, -42}, {76, -42}, {76, -44}, {78, -44}, {78, -72}, {-42, -72}, {-42, 24}, {-30, 24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_1dof.CS, prescribedHeatFlow.Q_flow) annotation(Line(points = {{-14, 30}, {-4, 30}, {-4, 62}, {4, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(realExpression.y, aWPI_1dof.SP) annotation(Line(points = {{-61, 46}, {-48, 46}, {-48, 30}, {-30, 30}}, color = {0, 0, 127}));
  connect(realExpression1.y, aWPI_1dof.TR) annotation(Line(points = {{-63, -2}, {-44, -2}, {-44, 12}, {-30, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(booleanPulse.y, aWPI_1dof.TS) annotation(Line(points = {{-87, 18}, {-30, 18}}, color = {255, 0, 255}));
  connect(prescribedHeatFlow.port, thermalCap.surf) annotation(Line(points = {{24, 62}, {38, 62}, {38, 68}, {50, 68}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(convection_SS.ss1, thermalCap.surf) annotation(Line(points = {{32, 38}, {44, 38}, {44, 68}, {50, 68}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(convection_SS.ss2, extenallWall_NoOpenings_Homogeneous.airInt) annotation(Line(points = {{32, 26}, {32, 8}, {30, 8}, {30, 10}, {61, 10}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 20),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end test_room_cooling;