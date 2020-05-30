within EEB.CaseStudies.DEIB.RoomLevel.Test;

model test1_Rooms "Differences between wall with or without layer"
  extends Icons.TestModel;
  EEB.CaseStudies.DEIB.RoomLevel.Rooms_simplified.RoomThermalSimplified RoomsThermalSimplified annotation(Placement(visible = true, transformation(origin = {43, -41}, extent = {{-25, -23}, {25, 23}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Text(k = 273.15 + 18) annotation(Placement(transformation(extent = {{-50, 54}, {-40, 64}})));
  Modelica.Blocks.Sources.Constant Text1(k = 273.15 + 18) annotation(Placement(transformation(extent = {{-38, -28}, {-28, -18}})));
  Modelica.Blocks.Sources.Step Heater1(startTime = 6e6, offset = 300, height = 100) annotation(Placement(transformation(extent = {{-78, 30}, {-68, 40}})));
  Modelica.Blocks.Sources.Constant Heater2(k = 200) annotation(Placement(transformation(extent = {{-78, 12}, {-68, 22}})));
  Modelica.Blocks.Sources.Constant Heater4(k = 200) annotation(Placement(visible = true, transformation(extent = {{-78, -70}, {-68, -60}}, rotation = 0)));
  Modelica.Blocks.Sources.Step Heater3(startTime = 6e6, height = 100, offset = 300) annotation(Placement(visible = true, transformation(extent = {{-78, -46}, {-68, -36}}, rotation = 0)));
  EEB.CaseStudies.DEIB.RoomLevel.Rooms_layered_wall.RoomThermal RoomThermalLayered annotation(
    Placement(visible = true, transformation(origin = {30, 38}, extent = {{-16, -26}, {16, 26}}, rotation = 0)));
equation
  connect(RoomsThermalSimplified.Texternal, Text1.y) annotation(
    Line(points = {{19, -30}, {-30.25, -30}, {-30.25, -23}, {-27.5, -23}}, color = {0, 0, 127}));
  connect(Heater3.y, RoomsThermalSimplified.heater1) annotation(
    Line(points = {{-67.5, -41}, {19, -41}}, color = {0, 0, 127}));
  connect(Heater4.y, RoomsThermalSimplified.heater2) annotation(
    Line(points = {{-67.5, -65}, {-21.25, -65}, {-21.25, -52}, {19, -52}}, color = {0, 0, 127}));
  connect(Heater2.y, RoomThermalLayered.heater2) annotation(
    Line(points = {{-67.5, 17}, {-25.75, 17}, {-25.75, 26}, {14, 26}}, color = {0, 0, 127}));
  connect(Heater1.y, RoomThermalLayered.heater1) annotation(
    Line(points = {{-67.5, 35}, {-25.75, 35}, {-25.75, 38}, {14, 38}}, color = {0, 0, 127}));
  connect(RoomThermalLayered.Texternal, Text.y) annotation(
    Line(points = {{14, 50}, {-11.75, 50}, {-11.75, 59}, {-39.5, 59}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StopTime = 1e+007), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end test1_Rooms;