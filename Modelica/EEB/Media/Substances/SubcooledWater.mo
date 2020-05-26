within EEB.Media.Substances;
model SubcooledWater "Subcooled water"
  extends Modelica.Icons.MaterialProperty;
  import MAC = EEB.Media.Constants;
  connector Input_p = input SI.Pressure "pressure";
  connector Input_T = input SI.Temperature "temperature";
  Input_p p "pressure";
  Input_T T "temperature";
  //-----------------------------------------------------------------------------
  SpecificEnthalpy h "specific enthalpy";
  Density d "density";
  SpecificHeatCapacity cp "specific heat capacity per [J/kg da K]";
equation
  h = MAC.cp_l * (T - 273.15);
  d = MAC.d_l;
  cp = MAC.cp_l;
  annotation (
  Documentation(info="<html>
<p>This is the subcooled water model.</p>
<p>The state equations for the substances in liquid phase are generally very complex. Therefore it is preferred to study the properties of the liquids according to simplifying assumptions. The most important one is to assume an incompressible substance behavior which means that the volume does not change for every transformation. It occurs that the assumption of incompressible substance behavior is lawful, for all substances, at thermodynamic states not too much close to the critical state. Thus, we assume the subcooled water as an incompressible substance far from its critical state. These two assumptions lead to the following conclusions:</p>
<p>- the specific heat at constant pressure and volume have the same value cp=cv=c;</p>
<p>- the variation of the specific enthalpy is the same of the specific internal energy.</p>
<p>In fact, because we deal with incompressible substance behavior, the specific volume of the fluid is about 10&minus;3m3/kg. Therefore, we can neglect the vdp term: </p>
<p align=\"center\">dh=cdT+vdp &asymp; cdT=du</p>
<p>- the specific heat, the specific enthalpy and the specific internal energy are functions of the same temperature only:</p>
<p align=\"center\">c = c (T); </p>
<p align=\"center\">h = h (T);</p>
<p align=\"center\"> u = u (T).</p>
<p>We can finally assume that the specific heat is constant and equal to c = 4.186kJ/kgK, because its variation with the temperature is almost negligible.</p>
</html>"));
end SubcooledWater;
