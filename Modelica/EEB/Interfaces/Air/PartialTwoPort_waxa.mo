within EEB.Interfaces.Air;
partial model PartialTwoPort_waxa "Partial two port waxa"
  AbsolutePressure pa1 "Pressure";
  AbsolutePressure pa2 "Pressure";
  MassFlowRate wa1 "Dry air mass flowrate";
  MassFlowRate wa2 "Dry air mass flowrate";
  SpecificEnthalpy haout1 "Specifc enthalpy";
  SpecificEnthalpy haout2 "Specifc enthalpy";
  MassFraction xaout1 "Absolute humidity [Kg vap/Kg dry air]";
  MassFraction xaout2 "Absolute humidity [Kg vap/Kg dry air]";
  EEB.Interfaces.Air.MoistAirFlange_waxa air_flange1 annotation(
  Placement(visible = true,transformation(extent = {{-90, -10}, {-70, 10}}, rotation = 0), iconTransformation(extent = {{-120, -20}, {-80, 20}}, rotation = 0)));
  EEB.Interfaces.Air.MoistAirFlange_waxa air_flange2 annotation(
  Placement(visible = true,transformation(extent = {{70, -10}, {90, 10}}, rotation = 0), iconTransformation(extent = {{80, -20}, {120, 20}}, rotation = 0)));
equation
  pa1 = air_flange1.pa;
  wa1 = air_flange1.wa;
  haout1 = air_flange1.ha;
  xaout1 = air_flange1.xa;
  pa2 = air_flange2.pa;
  wa2 = air_flange2.wa;
  haout2 = air_flange2.ha;
  xaout2 = air_flange2.xa;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PartialTwoPort_waxa;