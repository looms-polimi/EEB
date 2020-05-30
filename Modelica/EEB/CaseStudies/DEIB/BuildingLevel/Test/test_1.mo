within EEB.CaseStudies.DEIB.BuildingLevel.Test;

model test_1
  extends Icons.TestModel;
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-36, -90}, {-24, -78}})));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-58, -66}, {-46, -54}})));
  ElectricEquivalentStudy.Rooms.RoomsElectrical RoomsElectric(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-14, -144}, {142, -24}})));
  Modelica.Blocks.Sources.Constant Texternal1(k = 273.15 + 8) annotation(Placement(visible = true, transformation(extent = {{-24, 58}, {-12, 70}}, rotation = 0)));
  Modelica.Blocks.Sources.Step Pheater1(height = 100, startTime = 6e6, offset = 300) annotation(Placement(visible = true, transformation(extent = {{-86, 12}, {-66, 32}}, rotation = 0)));
  Modelica.Blocks.Sources.Step Pheater2(height = 100, offset = 300, startTime = 6e6) annotation(Placement(transformation(extent = {{-118, -110}, {-100, -92}})));
  Modelica.Blocks.Sources.Constant Pheater3(k = 200) annotation(Placement(visible = true, transformation(extent = {{-84, -32}, {-64, -12}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Pheater4(k = 200) annotation(Placement(transformation(extent = {{-114, -148}, {-94, -128}})));
  EEB.CaseStudies.DEIB.BuildingLevel.ThermalManagementStudy.Rooms.RoomsThermalSimplified RoomsThermal(Tstart = 273.15 + 0, wr = 0) annotation(Placement(visible = true, transformation(origin = {-52, 170}, extent = {{-150, -148}, {150, 148}}, rotation = 0)));
equation
  connect(Pheater3.y, RoomsThermal.heater2) annotation(
    Line(points = {{-63, -22}, {-129, -22}, {-129, 155.508}, {-73.3971, 155.508}}, color = {0, 0, 127}));
  connect(Pheater1.y, RoomsThermal.heater1) annotation(
    Line(points = {{-65, 22}, {-16, 22}, {-16, 169.692}, {-73.3971, 169.692}}, color = {0, 0, 127}));
  connect(Texternal1.y, RoomsThermal.Texternal) annotation(
    Line(points = {{-11.4, 64}, {14, 64}, {14, 184.492}, {-73.3971, 184.492}}, color = {0, 0, 127}));
  connect(Texternal.y, RoomsElectric.Texternal) annotation(Line(points = {{-23.4, -84}, {28.9, -84}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, RoomsElectric.Room1Noise) annotation(Line(points = {{-45.4, -60}, {-10, -60}, {-10, -54}, {28.9, -54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(RoomsElectric.Room2Noise, RoomsElectric.Room1Noise) annotation(Line(points = {{28.9, -67.2}, {-10, -67.2}, {-10, -54}, {28.9, -54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater2.y, RoomsElectric.heater1) annotation(Line(points = {{-99.1, -101}, {-30.55, -101}, {-30.55, -100.8}, {28.9, -100.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pheater4.y, RoomsElectric.heater2) annotation(Line(points = {{-93, -138}, {-30, -138}, {-30, -114}, {28.9, -114}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-180, -220}, {180, 220}}), graphics), Icon(coordinateSystem(extent = {{-180, -220}, {180, 220}})), experiment(StopTime = 1e+007), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end test_1;