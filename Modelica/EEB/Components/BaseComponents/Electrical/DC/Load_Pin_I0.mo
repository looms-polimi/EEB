within EEB.Components.BaseComponents.Electrical.DC;
model Load_Pin_I0
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Modelica.Blocks.Interfaces.RealInput iPabs annotation(
  Placement(transformation(extent = {{-88, -74}, {-48, -34}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -70})));
  Modelica.Blocks.Interfaces.RealOutput Pabs annotation(
  Placement(transformation(extent = {{-40, -38}, {0, 2}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, 70})));
equation
  if iPabs > 0 then
    v * i = iPabs;
    Pabs = iPabs;
  else
    i = 0;
    Pabs = 0;
  end if;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 50}, {60, -50}}, lineColor = {0, 0, 210}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}), Text(extent = {{-28, 35}, {28, -35}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {255, 255, 255}, origin = {1, 4}, rotation = 90, textString = "PL"), Line(points = {{-90, 0}, {-60, 0}}, color = {0, 0, 0}, smooth = Smooth.None), Line(points = {{60, 0}, {90, 0}}, color = {0, 0, 0}, smooth = Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Load_Pin_I0;

