within EEB.CaseStudies.DEIB.BuildingLevel.ThermalManagementStudy.OfficeBuilding;

model CaseStudy_Building
  extends Icons.CaseStudyModel;
  OfficeBuilding officeBuilding(n = 10) annotation(Placement(transformation(extent = {{-10, -28}, {62, 40}})));
  Modelica.Blocks.Sources.Constant Tground(k = 273.15 + 12) annotation(Placement(transformation(extent = {{-66, -32}, {-46, -12}})));
  Modelica.Blocks.Sources.Sine Texternal(freqHz = 1 / 86400, phase = -pi / 2, amplitude = 4, offset = 273.15 + 34) annotation(Placement(transformation(extent = {{-64, 30}, {-52, 42}})));
equation
  connect(Tground.y, officeBuilding.Tground) annotation(Line(points = {{-45, -22}, {-20, -22}, {-20, -21.2}, {5.12, -21.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, officeBuilding.Texternal) annotation(Line(points = {{-51.4, 36}, {-16, 36}, {-16, 28.44}, {12.32, 28.44}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 3e+6, StartTime = 0, Tolerance = 1e-6, Interval = 6000), __Dymola_experimentSetupOutput(equdistant = false, events = false),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end CaseStudy_Building;