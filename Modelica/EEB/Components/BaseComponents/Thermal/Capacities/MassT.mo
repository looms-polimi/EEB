within EEB.Components.BaseComponents.Thermal.Capacities;

model MassT "Mass of a generic element"
  parameter Mass M = 10;
  parameter SpecificHeatCapacity cp = 500;
  parameter Temperature Tstart = 273.15 + 20;
  Temperature T(start = Tstart);
  EEB.Interfaces.Thermal.HeatPort surf annotation(
  Placement(visible = true,transformation(extent = {{-60, -60}, {60, -40}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-22, -20}, {22, 20}}, rotation = 0)));
equation
  cp * M * der(T) = surf.Q_flow;
  surf.T = T;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(origin = {0, -12.5},fillColor = {255, 255, 170}, fillPattern = FillPattern.Forward, extent = {{-100, -67.5}, {100, 112.5}}), Text(origin = {-7.21739, -31.4783}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-72.7826, 77.4783}, {89.2174, -30.5217}}, textString = "M")}));
end MassT;