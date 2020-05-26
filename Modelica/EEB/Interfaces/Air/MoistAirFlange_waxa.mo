within EEB.Interfaces.Air;
connector MoistAirFlange_waxa "Interface for moist air (w,AU)"
  AbsolutePressure pa "Pressure";
  flow MassFlowRate wa "Dry air mass flowrate";
  stream SpecificEnthalpy ha "Specifc enthalpy";
  stream MassFraction xa "Absolute humidity [Kg vap/Kg dry air]";
  annotation(
  defaultComponentName = "air_flange", Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 100, 150}, fillColor = {240, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Sphere)}),
    Documentation(info="<html>
<p>This connector is composed of:</p>
<p>- a potential variable &QUOT;pa&QUOT; which is the pressure [Pa];</p>
<p>- a flow variable &QUOT;wa&QUOT; which is the dry air mass flowrate [kg/s];</p>
<p>- two stream variables &QUOT;ha&QUOT; and &QUOT;xa&QUOT; which are respectively specifc enthalpy [J/kg] and absolute humidity [Kg vap/Kg dry air].</p>
</html>"));
end MoistAirFlange_waxa;
