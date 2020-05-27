within EEB.Components.BaseComponents.Air.Volumes;
model AirVolume_wawvQdPort
  extends Interfaces.Air.PartialTwoPort_waxa;
  parameter Volume V = 10 "volume";
  parameter Pressure Pstart = 101325 "Initial moist air pressure";
  parameter Temperature Tstart = 273.15 + 20 "Initial moist air temperature";
  parameter MassFraction Xstart = 0.001 "Initial absolute umidity [kg_H20/kg_DA]";
  EEB.Media.Substances.MoistAir air(is4cap=true);
  Mass Ma(stateSelect=StateSelect.avoid) "Total dry air mass";
  Mass Mv(stateSelect=StateSelect.avoid) "Total vapour mass";
  Energy Ea(stateSelect=StateSelect.avoid) "Energy of the moist air";
  Pressure p(start=Pstart);
  Temperature T(start=Tstart);
  MassFraction X(start=Xstart);
  // wawvQd port variables (for mixing with other volumes)
  MassFlowRate wamix, wvmix;
  HeatFlowRate Qdiff;
  Interfaces.Thermal.HeatPort heatPort annotation(
  Placement(transformation(extent = {{-60, 40}, {60, 60}}), iconTransformation(extent = {{-80, 80}, {80, 100}})));
//public
  EEB.Interfaces.Air.MoistAirFlange_wawvQd_waPart dryair annotation (
    Placement(transformation(extent={{-38,-98},{-18,-78}}),
        iconTransformation(extent={{-40,-100},{-20,-80}})));
  EEB.Interfaces.Air.MoistAirFlange_wawvQd_wvPart vapour annotation (
    Placement(transformation(extent={{18,-98},{38,-78}}),
        iconTransformation(extent={{16,-100},{36,-80}})));
  EEB.Interfaces.Thermal.HeatPort diffuse annotation (
    Placement(transformation(extent={{-8,-100},{12,-80}}),
        iconTransformation(extent={{-10,-102},{10,-82}})));
equation
  air.p = p;
  air.T = T;
  air.X = X;
  // Masses and energy
  Ma + Mv = V * air.d;
  Mv = Ma * air.X;
  Ea = Ma * (air.h - air.p / air.d);
  // Balances
  der(Ma) = wa1 + wa2 + wamix;
  der(Mv) = wa1 * actualStream(air_flange1.xa)
            + wa2 * actualStream(air_flange2.xa) + wvmix;
  der(Ea) = wa1 * actualStream(air_flange1.ha)
            + wa2 * actualStream(air_flange2.ha) + heatPort.Q_flow
            + wamix * actualStream(dryair.ha)
            + wvmix * actualStream(vapour.hv) + Qdiff;

  // Connector equations
  air.T = heatPort.T;
  pa1 = air.p;
  pa2 = air.p;
  xaout1 = air.X;
  xaout2 = air.X;
  haout1 = air.h;
  haout2 = air.h;
  dryair.pa = air.p;
  dryair.wa = wamix;
  dryair.ha = air.ha;
  vapour.pv = air.pv;
  vapour.wv = wvmix;
  vapour.hv = air.hv;
  diffuse.T = air.T;
  diffuse.Q_flow = Qdiff;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 100, 255}, fillColor = {170, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere), Text(extent = {{-76, 72}, {76, -78}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "AirVolume
wawvQd")}));
end AirVolume_wawvQdPort;

