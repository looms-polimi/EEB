within EEB.Interfaces.Water;
partial model PartialTwoPort_water "Partial component with two ports"
  AbsolutePressure p1 "Pressure at falnge1";
  AbsolutePressure p2 "Pressure at falnge2";
  MassFlowRate w1 "Mass flowrate at falnge1";
  MassFlowRate w2 "Mass flowrate at falnge2";
  SpecificEnthalpy hout1 "Specifc enthalpy at falnge1";
  SpecificEnthalpy hout2 "Specifc enthalpy at falnge2";
  EEB.Interfaces.Water.WaterFlange water_flange2 annotation(
  Placement(visible = true,transformation(extent = {{70, -10}, {90, 10}}, rotation = 0), iconTransformation(extent = {{80, -20}, {120, 20}}, rotation = 0)));
  EEB.Interfaces.Water.WaterFlange water_flange1 annotation(
  Placement(visible = true,transformation(extent = {{-90, -10}, {-70, 10}}, rotation = 0), iconTransformation(extent = {{-120, -20}, {-80, 20}}, rotation = 0)));
equation
  p1 = water_flange1.p;
  w1 = water_flange1.w;
  hout1 = water_flange1.h;
  p2 = water_flange2.p;
  w2 = water_flange2.w;
  hout2 = water_flange2.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PartialTwoPort_water;