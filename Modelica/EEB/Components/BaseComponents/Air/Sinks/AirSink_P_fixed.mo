within EEB.Components.BaseComponents.Air.Sinks;

model AirSink_P_fixed
  Media.Substances.MoistAir air;
  parameter Pressure p0 = 101325 "prescribed pressure";
  Interfaces.Air.MoistAirFlange_waxa air_flange annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{110, -20}, {70, 20}})));
equation
  air.p = air_flange.pa;
  air_flange.pa = p0;
  air_flange.ha = inStream(air_flange.ha);
  air_flange.xa = inStream(air_flange.xa);
  // enthalpy boundary condition
  air.h = air_flange.ha;
  air.X = air_flange.xa;
  annotation(
  Icon(graphics = {Rectangle(extent = {{-30, 30}, {70, -30}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-22, 20}, {18, -20}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{68, 6}, {68, -6}, {38, -6}, {38, -12}, {18, 0}, {38, 12}, {38, 6}, {68, 6}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-60, 40}, {-40, 20}}, lineColor = {0, 0, 0}, textString = "P")}));
end AirSink_P_fixed;
