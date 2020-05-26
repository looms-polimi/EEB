within EEB.Components.BaseComponents.Water.Pressurisers;

model IdealWaterPressuriser
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater water;
  Pressure p0;
  Modelica.Blocks.Interfaces.RealInput p annotation(
  Placement(transformation(extent = {{-74, 40}, {-34, 80}}), iconTransformation(extent = {{-74, 40}, {-34, 80}})));
equation
  p0 = p;
  // impose pressure on both connectors
  p1 = p0;
  p2 = p0;
  water.p = 0.5 * (p1 + p2);
  // mean fluid pressure
  // energy conservation
  hout1 = inStream(water_flange2.h);
  hout2 = inStream(water_flange1.h);
  // enthalpy boundary condition
  hout1 = water.h;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 20}, {60, -20}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 0, 255}), Polygon(points = {{-26, 6}, {-26, -6}, {14, -6}, {14, -12}, {34, 0}, {14, 12}, {14, 6}, {-26, 6}}, lineColor = {200, 200, 255}, fillColor = {200, 200, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-10, 32}, {12, 20}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {0, 0, 255}), Ellipse(extent = {{-34, 96}, {36, 26}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Sphere)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end IdealWaterPressuriser;
