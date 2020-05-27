within EEB.Interfaces.Electrical;
partial model PhasorTwoPin "Phasor two pins"

  EEB.Interfaces.Electrical.PositivePhasorPin p annotation(
  Placement(visible = true,transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-120, -20}, {-80, 20}}, rotation = 0)));
  EEB.Interfaces.Electrical.NegativePhasorPin n annotation(
  Placement(visible = true,transformation(extent = {{60, -20}, {100, 20}}, rotation = 0), iconTransformation(extent = {{80, -20}, {120, 20}}, rotation = 0)));
  Voltage Vre, Vim;
  Current Ire, Iim;
equation
  p.ire + n.ire = 0;
  p.iim + n.iim = 0;
  Vre = p.vre - n.vre;
  Vim = p.vim - n.vim;
  Ire = p.ire;
  Iim = p.iim;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PhasorTwoPin;