within EEB.Components.BaseComponents.Water.Volumes;

model WaterVolume "Tank with wall"
  extends Interfaces.Water.PartialTwoPort_water;
  Media.Substances.SubcooledWater water;
  parameter Volume V = 1 "volume";
  parameter Temperature Tstart = 273.15 + 25 "initial temp";
  Temperature Tf(start=Tstart,stateSelect=StateSelect.prefer) "fluid temperature";
  Energy E;
  Interfaces.Thermal.HeatPort fluid annotation(
  Placement(transformation(extent = {{-10, -10}, {10, 70}}), iconTransformation(extent = {{-80, 80}, {80, 100}})));
equation
  // Total mass balance
  w1 + w2 = 0;
  // No pressure drop
  p1 = p2;
  // fluid conditions
  water.p = p1;
  water.T = Tf;
  // Energy balance for the fluid
  E = V * water.d * water.h;
  der(E) = w1 * actualStream(water_flange1.h)
           + w2 * actualStream(water_flange2.h) + fluid.Q_flow;
  fluid.T = Tf;
  // Enthalpies boundary condition
  hout1 = water.h;
  hout2 = water.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 0, 100}, fillColor = {100, 100, 255}, fillPattern = FillPattern.Sphere), Text(extent = {{-50, 56}, {54, -42}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, textString = "WaterVolume")}));
end WaterVolume;
