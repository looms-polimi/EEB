within EEB.Components.BaseComponents.Air.Movers;

model AirPrescribedFlowRate_Volume
  extends Interfaces.Air.PartialTwoPort_waxa;
  Media.Substances.MoistAir air;
  Modelica.Blocks.Interfaces.RealInput iq annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {0, 72}), iconTransformation(extent = {{-11, -11}, {11, 11}}, rotation = -90, origin = {-1, 43})));
equation
  // mass balance
  wa1 + wa2 = 0;
  wa1 = iq * air.d;
  // pressure drop
  air.p = 0.5 * (pa1 + pa2);
  // air humidity ratio boundary conditions
  xaout1 = inStream(air_flange2.xa);
  xaout2 = inStream(air_flange1.xa);
  air.X = xaout1;
  // enthalpies boundary conditions
  haout1 = inStream(air_flange2.ha);
  haout2 = inStream(air_flange1.ha);
  air.h = haout1;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-60, 60}, {-60, -60}, {60, -20}, {60, 20}, {-60, 60}}, lineColor = {0, 0, 0}, smooth = Smooth.None, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-72, 6}, {-60, -6}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{60, 6}, {72, -6}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{24, 74}, {50, 44}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, textString = "q")}));
end AirPrescribedFlowRate_Volume;
