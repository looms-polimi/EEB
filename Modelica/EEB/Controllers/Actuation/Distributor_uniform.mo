within EEB.Controllers.Actuation;
model Distributor_uniform
  parameter Integer ns = 2;
  Modelica.Blocks.Interfaces.RealInput CSi01 annotation(
  Placement(transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-100, -18}, {-60, 22}})));
  Modelica.Blocks.Interfaces.RealOutput CSo01[ns] annotation(
  Placement(transformation(extent = {{60, -20}, {100, 20}}, rotation = 0), iconTransformation(extent = {{60, -20}, {100, 20}})));
  Real csi, cso[ns], cso01tot;
equation
  csi = CSi01;
  cso = CSo01;
  for i in 1:ns loop
    cso[i] = max(0, min(1, 1 - abs(csi * ns - i)));
  end for;
  cso01tot = sum(cso);
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {50, 50, 50}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Text(extent = {{-66, 68}, {62, -60}}, lineColor = {0, 0, 0}, textString = "D
uniform")}));
end Distributor_uniform;

