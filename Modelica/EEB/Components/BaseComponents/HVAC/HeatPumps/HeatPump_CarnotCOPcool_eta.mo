within EEB.Components.BaseComponents.HVAC.HeatPumps;

model HeatPump_CarnotCOPcool_eta
  extends BaseClasses.BaseHeatPump;
  parameter HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real eta = 0.5 "efficiency wrt Carnot COP";
  parameter Real maxCOPcool = 1 "maximum cooling COP";
  SI.Temperature DTmin;
equation
  eta * Tc = maxCOPcool * DTmin;
  W = Wmax * cmd01;
  if Th - Tc > DTmin then
    COPcool = eta * Tc / (Th - Tc);
  else
    COPcool = maxCOPcool;
  end if;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-80, -20}, {82, -60}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                  FillPattern.Solid, textString = "Carnot(c)")}));
end HeatPump_CarnotCOPcool_eta;
