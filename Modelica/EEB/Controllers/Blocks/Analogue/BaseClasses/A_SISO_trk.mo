within EEB.Controllers.Blocks.Analogue.BaseClasses;

partial model A_SISO_trk
  extends A_SISO_base;
  Modelica.Blocks.Interfaces.BooleanInput TS annotation(
  Placement(transformation(extent = {{-100, -20}, {-80, 0}}), iconTransformation(extent = {{-100, -80}, {-60, -40}})));
  Modelica.Blocks.Interfaces.RealInput TR annotation(
  Placement(transformation(extent = {{-100, -60}, {-80, -40}}), iconTransformation(extent = {{-100, -140}, {-60, -100}})));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -160}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -160}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {200, 230, 255})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -160}, {100, 100}}), graphics));
end A_SISO_trk;
