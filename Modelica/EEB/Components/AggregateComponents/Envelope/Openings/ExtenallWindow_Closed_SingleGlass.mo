within EEB.Components.AggregateComponents.Envelope.Openings;
model ExtenallWindow_Closed_SingleGlass
  extends BaseClasses.BaseExternalWindow_Closed;
  BaseComponents.Envelope.GlassLayer Glass(Tstart = Tstart, L = L, H = H, d = s, material = material) annotation(
  Placement(transformation(extent = {{-30, -30}, {10, 30}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BI74 ConvInt(L = L, H = H, vertical = vertical) annotation(
  Placement(transformation(extent = {{-70, -30}, {-30, 30}})));
  parameter SI.Length L = 5 "wall surface length";
  parameter SI.Length H = 3 "wall surface height";
  parameter SI.Length s = 0.4 "wall thickness";
  parameter Boolean vertical = true "true for vertical, false for horizontal";
  parameter SI.Density ro = 2400 "wall density";
  parameter SI.SpecificHeatCapacity cp = 880 "wall cp";
  parameter SI.ThermalConductivity lambda = 1.91 "wall thermal cond";
  parameter Integer n = 4 "number of layers";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial T, all layers";
  BaseComponents.Ambient.Radiaton_SkyGround RadToSkyGround(L = L, H = H, inclination = inclination, es = es, eg = eg) annotation(
  Placement(transformation(extent = {{40, -20}, {80, 20}})));
  BaseComponents.Thermal.Sources.SolarRadiation_TransparentSurf solarRadiation_OpaqueSurf(L = L, H = H, absCoef = absCoef, orientation = orientation, inclination = inclination) annotation(
  Placement(transformation(extent = {{40, 40}, {80, 80}})));
  BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke ConvToExt(L = L, H = H, fixedCoeff = fixedCoeff, h0 = h0, orientation = orientation) annotation(
  Placement(transformation(extent = {{40, -80}, {80, -40}})));
  parameter Boolean fixedCoeff = false "fixed heat transfer coefficient";
  parameter SI.CoefficientOfHeatTransfer h0 = 25 "fixed convective heat transfer";
  parameter Real orientation = 0 "Orientation of the exiting normal direction relative to North: 0? North, clockwise";
  parameter Real es = 0.9 "Surface emissivity";
  parameter Real eg = 0.9 "Ground emissivity";
  parameter Real inclination = 0 "Inclination of the surface: 90? vertical, 180? horizontal";
  parameter Real absCoef = 0.9 "Absorption coefficient";
  parameter Media.Materials.Glasses.BaseGlass material "Type of glass" annotation(choicesAllMatching = true);
equation
  connect(ConvInt.wall, Glass.side1) annotation(
  Line(points = {{-34, 0}, {-16, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(airInt, ConvInt.air) annotation(
  Line(points = {{-90, 0}, {-66, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(solarRadiation_OpaqueSurf.Trasmitted, Glass.side2) annotation(
  Line(points = {{44, 68}, {20, 68}, {20, 0}, {-4, 0}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(RadToSkyGround.wall, Glass.side2) annotation(
  Line(points = {{40, 1.55431e-15}, {34, 1.55431e-15}, {34, 0}, {-4, 0}, {-4, -8.88178e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(ConvToExt.wall, Glass.side2) annotation(
  Line(points = {{44, -60}, {20, -60}, {20, 0}, {-4, 0}, {-4, -8.88178e-16}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(solarRadiation_OpaqueSurf.Absorbed, absToWall) annotation(
  Line(points = {{60, 44}, {32, 44}, {32, -88}, {10, -88}}, color = {255, 0, 0}, smooth = Smooth.None));
  connect(solarRadiation_OpaqueSurf.Reflected, RadToSkyGround.SkyTemp) annotation(
  Line(points = {{76, 44}, {90, 44}, {90, 16}, {76, 16}}, color = {255, 0, 0}, smooth = Smooth.None));
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-30, -58}, {12, -96}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, textString = "HOM"), Polygon(points = {{-10, 38}, {10, 40}, {8, 22}, {6, 30}, {-20, 4}, {-10, 2}, {-30, 0}, {-28, 20}, {-26, 10}, {0, 36}, {-10, 38}}, lineColor = {255, 128, 0}, smooth = Smooth.None, fillColor = {255, 128, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}));
end ExtenallWindow_Closed_SingleGlass;

