within EEB.Components.BaseComponents.Ambient.Test;

model TestAmb_SkyGround
  extends EEB.Icons.TestModel;
  inner EEB.BoundaryConditions.AmbientConditions ambient_settings annotation(
    Placement(visible = true, transformation(origin = {-190, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Ambient.Radiaton_SkyGround radi_sky_ground(inclination = 45)  annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.Capacities.ThermalCap cap annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS conv annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature Tsrc(T = 298.15)  annotation(
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cap.surf, radi_sky_ground.wall) annotation(
    Line(points = {{-10, 40}, {-10, 40}, {-10, 20}, {40, 20}, {40, 20}}, color = {255, 0, 0}));
  connect(conv.ss2, cap.surf) annotation(
    Line(points = {{-44, 20}, {-10, 20}, {-10, 40}, {-10, 40}}, color = {255, 0, 0}));
  connect(Tsrc.port, conv.ss1) annotation(
    Line(points = {{-100, 20}, {-58, 20}, {-58, 20}, {-56, 20}}, color = {191, 0, 0}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 2),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end TestAmb_SkyGround;