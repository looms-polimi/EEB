within EEB.Icons;

model AmbientConditions
  annotation(
    defaultComponentName = "ambient_settings",
    defaultComponentPrefixes = "inner",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {180, 180, 255}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {180, 255, 255}), Rectangle(extent = {{-100, -58}, {100, -100}}, lineColor = {0, 100, 0}, fillPattern = FillPattern.Solid, fillColor = {0, 100, 0}), Ellipse(extent = {{36, 88}, {86, 38}}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Sphere), Ellipse(extent = {{-92, 48}, {-34, 30}}, lineColor = {180, 180, 180}, fillPattern = FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-68, 60}, {-26, 40}}, lineColor = {180, 180, 180}, fillPattern = FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-44, 54}, {0, 40}}, lineColor = {180, 180, 180}, fillPattern = FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-50, 44}, {0, 28}}, lineColor = {180, 180, 180}, fillPattern = FillPattern.Solid, fillColor = {180, 180, 180}), Ellipse(extent = {{-28, 50}, {28, 36}}, lineColor = {180, 180, 180}, fillPattern = FillPattern.Solid, fillColor = {180, 180, 180}), Polygon(points = {{-100, -58}, {32, -58}, {16, -42}, {4, -34}, {-16, -30}, {-24, -34}, {-32, -26}, {-44, -18}, {-52, -16}, {-62, -20}, {-66, -24}, {-72, -20}, {-84, -16}, {-90, -14}, {-96, -16}, {-100, -20}, {-100, -34}, {-100, -58}}, lineColor = {105, 0, 0}, fillPattern = FillPattern.Sphere, smooth = Smooth.None, fillColor = {105, 0, 0}), Polygon(points = {{100, -58}, {-10, -58}, {42, -64}, {72, -68}, {88, -70}, {100, -70}, {100, -58}}, lineColor = {80, 255, 255}, fillPattern = FillPattern.Sphere, smooth = Smooth.None, fillColor = {80, 255, 255}), Text(extent = {{-98, 98}, {-58, 68}}, lineColor = {255, 0, 0}, textString = "AC")}),
    Diagram(graphics),
    experiment(StopTime = 1.58112e+07),
    experimentSetupOutput);
end AmbientConditions;