within EEB.CaseStudies.TemperatureControl.Electric_equivalent.Test;

model test_1
  parameter Real Klq[2, 5] = 1e5 * [9.9993, 0.0004, 0.0000, 0.0001, 0.0003; 0.0001, 0.0000, 0.0004, 9.9993, 0.0003];
  LQ_Rooms.Base_Classes.LQ_Base lQ_Base(K = Klq) annotation(Placement(transformation(extent = {{-112, -144}, {-32, -54}})));
  Rooms.RoomsElectrical rooms(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{0, -138}, {148, -10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-28, -114}, {-18, -104}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 1000, uMin = 0) annotation(Placement(transformation(extent = {{-28, -94}, {-18, -84}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant noise(k = 0) annotation(Placement(transformation(extent = {{-34, -54}, {-24, -44}})));
  Modelica.Blocks.Sources.Constant Texternal(k = 8) annotation(Placement(transformation(extent = {{-16, -74}, {-6, -64}})));
  Modelica.Blocks.Sources.Constant Troom1(k = 22) annotation(Placement(transformation(extent = {{-150, -88}, {-130, -68}})));
  Modelica.Blocks.Sources.Constant Troom2(k = 20) annotation(Placement(transformation(extent = {{-150, -118}, {-130, -98}})));
  Modelica.Blocks.Sources.Constant Texternal1(k = 8) annotation(Placement(transformation(extent = {{-36, 82}, {-24, 94}})));
  Modelica.Blocks.Sources.Constant noise1(k = 0) annotation(Placement(transformation(extent = {{-58, 106}, {-46, 118}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue(CSmax = 1000, Ti = 5682, K = 27450) annotation(Placement(transformation(extent = {{-86, 82}, {-46, 62}})));
  Controllers.Blocks.Analogue.AWPI_1dof aWPI_analogue1(CSmax = 1000, Ti = 8268, K = 38816) annotation(Placement(transformation(extent = {{-84, 24}, {-44, 44}})));
  Rooms.RoomsElectrical rooms1(Air1(v(start = 0)), Air2(v(start = 0))) annotation(Placement(transformation(extent = {{-14, 28}, {142, 148}})));
  Modelica.Blocks.Sources.Constant Troom3(k = 22) annotation(Placement(transformation(extent = {{-164, 70}, {-144, 90}})));
  Modelica.Blocks.Sources.Constant Troom4(k = 20) annotation(Placement(transformation(extent = {{-164, 36}, {-144, 56}})));
equation
  connect(rooms.Room2Noise, rooms.Room1Noise) annotation(Line(points = {{40.7, -56.08}, {12, -56.08}, {12, -42}, {40.7, -42}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TWall2, lQ_Base.Vc) annotation(Line(points = {{108.78, -106}, {114, -106}, {114, -144}, {-108, -144}, {-108, -130.5}, {-96, -130.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TWall1, lQ_Base.Vb) annotation(Line(points = {{108.78, -93.2}, {122, -93.2}, {122, -148}, {-112, -148}, {-112, -121.5}, {-96, -121.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.TinsideWall, lQ_Base.Ve) annotation(Line(points = {{108.78, -80.4}, {130, -80.4}, {130, -154}, {-118, -154}, {-118, -112.5}, {-96, -112.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom2, lQ_Base.Vd) annotation(Line(points = {{108.78, -54.8}, {122, -54.8}, {122, -22}, {-110, -22}, {-110, -76.5}, {-96, -76.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u1, limiter1.u) annotation(Line(points = {{-47.2, -90}, {-38, -90}, {-38, -89}, {-29, -89}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter1.y, rooms.heater1) annotation(Line(points = {{-17.5, -89}, {9.25, -89}, {9.25, -91.92}, {40.7, -91.92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter2.y, rooms.heater2) annotation(Line(points = {{-17.5, -109}, {9.25, -109}, {9.25, -106}, {40.7, -106}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lQ_Base.u2, limiter2.u) annotation(Line(points = {{-47.2, -108}, {-38, -108}, {-38, -109}, {-29, -109}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms.Troom1, lQ_Base.Va) annotation(Line(points = {{108.78, -42}, {114, -42}, {114, -24}, {-106, -24}, {-106, -67.5}, {-96, -67.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise.y, rooms.Room1Noise) annotation(Line(points = {{-23.5, -49}, {12, -49}, {12, -42}, {40.7, -42}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal.y, rooms.Texternal) annotation(Line(points = {{-5.5, -69}, {11.25, -69}, {11.25, -74}, {40.7, -74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom1.y, lQ_Base.Vref1) annotation(Line(points = {{-129, -78}, {-114.5, -78}, {-114.5, -90}, {-96, -90}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom2.y, lQ_Base.Vref2) annotation(Line(points = {{-129, -108}, {-114, -108}, {-114, -99}, {-96, -99}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Texternal1.y, rooms1.Texternal) annotation(Line(points = {{-23.4, 88}, {28.9, 88}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(noise1.y, rooms1.Room1Noise) annotation(Line(points = {{-45.4, 112}, {-10, 112}, {-10, 118}, {28.9, 118}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.Room2Noise, rooms1.Room1Noise) annotation(Line(points = {{28.9, 104.8}, {-10, 104.8}, {-10, 118}, {28.9, 118}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue.CS, rooms1.heater1) annotation(Line(points = {{-50, 66}, {-12, 66}, {-12, 71.2}, {28.9, 71.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(aWPI_analogue1.CS, rooms1.heater2) annotation(Line(points = {{-48, 40}, {-12, 40}, {-12, 58}, {28.9, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.Troom2, aWPI_analogue1.PV) annotation(Line(points = {{100.66, 106}, {116, 106}, {116, 8}, {-90, 8}, {-90, 34}, {-80, 34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rooms1.Troom1, aWPI_analogue.PV) annotation(Line(points = {{100.66, 118}, {116, 118}, {116, 148}, {-90, 148}, {-90, 72}, {-82, 72}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom3.y, aWPI_analogue.SP) annotation(Line(points = {{-143, 80}, {-112, 80}, {-112, 66}, {-82, 66}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Troom4.y, aWPI_analogue1.SP) annotation(Line(points = {{-143, 46}, {-110, 46}, {-110, 40}, {-80, 40}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(extent = {{-180, -160}, {180, 160}})), Icon(coordinateSystem(extent = {{-180, -160}, {180, 160}})), experiment(StopTime = 3e+006), __Dymola_experimentSetupOutput(equdistant = false, events = false));
end test_1;
