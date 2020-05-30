within EEB.Components.BaseComponents.Ambient;

model Radiaton_SkyGround "Radiation sky-ground"
  import Modelica.Constants.*;
  // Clarke, 1985
  parameter Length L = 5 "Surface length";
  parameter Length H = 3 "Surface height";
  parameter Real inclination(min = 0, max = 180) = 0 "Inclination of the surface: 90° vertical, 180° horizontal";
  parameter Real es = 0.9 "Surface emissivity";
  parameter Real eg = 0.9 "Ground emissivity";
  // match default comp name in Ambientambient_settings class
  outer BoundaryConditions.AmbientConditions ambient_settings;
  HeatFlowRate Q_sky;
  HeatFlowRate Q_ground;
  EEB.Interfaces.Thermal.HeatPortRad wall annotation(
    Placement(visible = true, transformation(origin = {-35, 30}, extent = {{-5, -30}, {5, 30}}, rotation = 0), iconTransformation(extent = {{-140, -40}, {-60, 40}}, rotation = 0)));
protected
  parameter Real Fws = (1 - cos(inclination / 180 * pi)) / 2;
  parameter Real Fwg = (1 + cos(inclination / 180 * pi)) / 2;
equation
  wall.Q_flow + Q_sky + Q_ground = 0;
  Q_sky = sigma * Fws * L * H * es * (ambient_settings.Tsky ^ 4 - wall.T ^ 4);
  Q_ground = sigma * Fwg * L * H * es * eg * (ambient_settings.Tgnd ^ 4 - wall.T ^ 4);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(origin = {20, 0},lineColor = {0, 0, 255}, fillColor = {170, 213, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 100}, {80, -60}}), Text(origin = {-57.7, -63.33}, lineColor = {32, 74, 135}, extent = {{47.7, 163.33}, {153.7, 113.33}}, textString = "AS.sky"), Rectangle(origin = {20, 0},fillColor = {78, 154, 6}, fillPattern = FillPattern.Forward, extent = {{-80, -60}, {80, -100}}), Polygon(lineColor = {255, 128, 0}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid, points = {{-36, -54}, {-16, -56}, {-18, -38}, {-20, -46}, {-46, -20}, {-36, -18}, {-56, -16}, {-54, -36}, {-52, -26}, {-26, -52}, {-36, -54}}), Polygon(lineColor = {255, 128, 0}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid, points = {{-36, 52}, {-16, 54}, {-18, 36}, {-20, 44}, {-46, 18}, {-36, 16}, {-56, 14}, {-54, 34}, {-52, 24}, {-26, 50}, {-36, 52}}), Text(origin = {-55.7, -217.33}, lineColor = {46, 52, 54}, fillColor = {46, 52, 54}, extent = {{47.7, 163.33}, {153.7, 113.33}}, textString = "AS.gnd")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    DymolaStoredErrors,
    Documentation(info = "<html>
<p>This model is used in order to take into account of the sky-ground radiation....</p>
<p>It refers to an outer model that is <a href=\"EEB.BoundaryConditions.AmbientConditions\">AmbientConditions</a>.</p>
</html>"));
end Radiaton_SkyGround;