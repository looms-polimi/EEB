within EEB.CaseStudies.ABC;

model AirSource_pTphi_prescribed
  Media.Substances.MoistAir air;
  Interfaces.Air.MoistAirFlange_waxa air_flange annotation(
    Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{70, -20}, {110, 20}})));
  Modelica.Blocks.Interfaces.RealInput iP annotation(
    Placement(visible = true, transformation(origin = {-84, 76}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iT annotation(
    Placement(visible = true, transformation(origin = {-80, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iphi annotation(
    Placement(visible = true, transformation(origin = {-70, -74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  air_flange.pa = iP;
  air.p = air_flange.pa;
  air.T = iT;
  air.phi = iphi / 100;
// FIXME RH 0-100 as from DEIB files, REVISE
// enthalpy boundary condition
  air.h = air_flange.ha;
  air.X = air_flange.xa;
  annotation(
    Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30, 30}, {70, -30}}), Polygon(fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, points = {{0, 6}, {0, -6}, {40, -6}, {40, -12}, {60, 0}, {40, 12}, {40, 6}, {0, 6}}), Ellipse(fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-22, 20}, {18, -20}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5205));
end AirSource_pTphi_prescribed;