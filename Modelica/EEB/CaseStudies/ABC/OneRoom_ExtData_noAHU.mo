within EEB.CaseStudies.ABC;

model OneRoom_ExtData_noAHU
  extends Icons.CaseStudyModel;
  Real phi100 = Room.air.phi * 100;
  EEB.Components.BaseComponents.Air.Volumes.AirVolume Room(V = 50, Xstart = 0.0085) annotation(
    Placement(visible = true, transformation(origin = {-12, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
    Placement(visible = true, transformation(origin = {-72, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
    Placement(visible = true, transformation(origin = {28, -32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qa(y = 50 / 3600) annotation(
    Placement(visible = true, transformation(origin = {-96, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2wall(S = 6, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {-12, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS wall2ext(S = 6, gamma = 12) annotation(
    Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  EEB.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous wall(A = 6, Tstart = 293.15) annotation(
    Placement(visible = true, transformation(origin = {20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.AggregateComponents.Envelope.Openings.InternalWindow_Closed_SingleGlass window(H = 3, L = 3, Tstart = 293.15, material = EEB.Media.Materials.Glasses.Glass(), s = 0.005) annotation(
    Placement(visible = true, transformation(origin = {36, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS window2ext(S = 9, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2window(S = 9, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {6, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2window annotation(
    Placement(visible = true, transformation(origin = {108, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2wall annotation(
    Placement(visible = true, transformation(origin = {108, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radFracWall(k = 6 / (6 + 9)) annotation(
    Placement(visible = true, transformation(origin = {148, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radFracWindow(k = 9 / (6 + 9)) annotation(
    Placement(visible = true, transformation(origin = {148, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable Weather(columns = 2:4, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/EEB/Resources/TestDEIB_123_July2015_7days_weather.txt", tableName = "data", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-188, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Text annotation(
    Placement(visible = true, transformation(origin = {90, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable InternalData(columns = 2:5, fileName = "/home/leva/Dropbox/Buildings_ABC/Modelica/EEB/Resources/TestDEIB_123_July2015_7days_InternalData.txt", tableName = "data", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {128, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression patm(y = 101325) annotation(
    Placement(visible = true, transformation(origin = {-138, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sources.AirSource_pTphi_prescribed airSrc_amb annotation(
    Placement(visible = true, transformation(origin = {-102, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LowpassButterworth LPF_RHext(f = 1 / 3600, initType = Modelica.Blocks.Types.Init.InitialOutput, n = 4, y_start = 50) annotation(
    Placement(visible = true, transformation(origin = {-130, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sources.AirSource_pTphi_prescribed airSrc_cond annotation(
    Placement(visible = true, transformation(origin = {-102, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
EEB.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume airPrescribedFlowRate_Volume1 annotation(
    Placement(visible = true, transformation(origin = {-60, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
EEB.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 250 / 3600)  annotation(
    Placement(visible = true, transformation(origin = {-152, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.RealExpression realExpression3(y = 273.15 + 22) annotation(
    Placement(visible = true, transformation(origin = {-202, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
EEB.Interfaces.Air.sensor_Tphi sTphi annotation(
    Placement(visible = true, transformation(origin = {26, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sTphi.T, PI_T.PV) annotation(
    Line(points = {{36, -64}, {48, -64}, {48, -92}, {-176, -92}, {-176, -60}, {-160, -60}}, color = {0, 0, 127}));
  connect(Room.air_flange2, sTphi.airSense) annotation(
    Line(points = {{-4, -32}, {6, -32}, {6, -68}, {16, -68}, {16, -68}}, color = {0, 100, 150}));
  connect(airPrescribedFlowRate_Volume1.air_flange2, Room.air_flange1) annotation(
    Line(points = {{-52, -64}, {-46, -64}, {-46, -64}, {-40, -64}, {-40, -32}, {-20, -32}, {-20, -32}}, color = {0, 100, 150}));
  connect(airSrc_cond.air_flange, airPrescribedFlowRate_Volume1.air_flange1) annotation(
    Line(points = {{-93, -64}, {-69, -64}}, color = {0, 100, 150}));
  connect(patm.y, airSrc_cond.iP) annotation(
    Line(points = {{-127, -4}, {-125, -4}, {-125, -56}, {-110, -56}}, color = {0, 0, 127}));
  connect(Weather.y[2], LPF_RHext.u) annotation(
    Line(points = {{-177, 98}, {-161, 98}, {-161, 72}, {-143, 72}}, color = {0, 0, 127}, thickness = 0.5));
  connect(LPF_RHext.y, airSrc_amb.iphi) annotation(
    Line(points = {{-119, 72}, {-112, 72}, {-112, 72}, {-105, 72}, {-105, 24}, {-173, 24}, {-173, -40}, {-111, -40}}, color = {0, 0, 127}));
  connect(airSrc_amb.air_flange, fan.air_flange1) annotation(
    Line(points = {{-93, -32}, {-80, -32}}, color = {0, 100, 150}));
  connect(patm.y, airSrc_amb.iP) annotation(
    Line(points = {{-127, -4}, {-126, -4}, {-126, -4}, {-125, -4}, {-125, -4}, {-123, -4}, {-123, -24}, {-116.5, -24}, {-116.5, -24}, {-110, -24}}, color = {0, 0, 127}));
  connect(Weather.y[1], airSrc_amb.iT) annotation(
    Line(points = {{-177, 98}, {-161, 98}, {-161, -32}, {-111, -32}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Text.port, wall2ext.ss2) annotation(
    Line(points = {{80, 80}, {58, 80}}, color = {191, 0, 0}));
  connect(Weather.y[1], Text.T) annotation(
    Line(points = {{-177, 98}, {118, 98}, {118, 80}, {102, 80}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Text.port, window2ext.ss2) annotation(
    Line(points = {{80, 80}, {76, 80}, {76, -10}}, color = {191, 0, 0}));
  connect(Weather.y[3], radFracWall.u) annotation(
    Line(points = {{-177, 98}, {179, 98}, {179, 48}, {161, 48}, {161, 49}, {159, 49}, {159, 48}}, color = {0, 0, 127}, thickness = 0.5));
  connect(radFracWall.u, radFracWindow.u) annotation(
    Line(points = {{160, 48}, {169, 48}, {169, 48}, {178, 48}, {178, 10}, {160, 10}, {160, 10}, {160, 10}, {160, 10}, {160, 10}, {160, 10}}, color = {0, 0, 127}));
  connect(rad2window.Q_flow, radFracWindow.y) annotation(
    Line(points = {{118, 10}, {137, 10}}, color = {0, 0, 127}));
  connect(rad2wall.Q_flow, radFracWall.y) annotation(
    Line(points = {{118, 48}, {123, 48}, {123, 48}, {128, 48}, {128, 48}, {138, 48}, {138, 48}, {137, 48}, {137, 48}, {136.5, 48}, {136.5, 48}, {136, 48}}, color = {0, 0, 127}));
  connect(rad2wall.port, wall.side2) annotation(
    Line(points = {{98, 48}, {94.125, 48}, {94.125, 48}, {90.25, 48}, {90.25, 48}, {82.5, 48}, {82.5, 48}, {67, 48}, {67, 48}, {36, 48}, {36, 80}, {28, 80}, {28, 80}, {28, 80}, {28, 80}, {28, 80}, {28, 80}}, color = {191, 0, 0}));
  connect(rad2window.port, window.airSide2) annotation(
    Line(points = {{98, 10}, {76, 10}, {76, 10}, {54, 10}, {54, -10}, {49.5, -10}, {49.5, -10}, {47.25, -10}, {47.25, -10}, {45, -10}}, color = {191, 0, 0}));
  connect(room2window.ss2, window.airSide1) annotation(
    Line(points = {{12, -10}, {27, -10}}, color = {255, 0, 0}));
  connect(room2window.ss1, Room.heatPort) annotation(
    Line(points = {{0, -10}, {-12, -10}, {-12, -23}}, color = {255, 0, 0}));
  connect(window.airSide2, window2ext.ss1) annotation(
    Line(points = {{45, -10}, {64, -10}}, color = {255, 0, 0}));
  connect(wall.side2, wall2ext.ss1) annotation(
    Line(points = {{28, 80}, {46, 80}}, color = {255, 0, 0}));
  connect(room2wall.ss2, wall.side1) annotation(
    Line(points = {{-12, 26}, {-12, 80}, {-1, 80}, {-1, 80}, {10, 80}}, color = {255, 0, 0}));
  connect(Room.heatPort, room2wall.ss1) annotation(
    Line(points = {{-12, -23}, {-12, 14}}, color = {255, 0, 0}));
  connect(qa.y, fan.iq) annotation(
    Line(points = {{-85, -4}, {-78, -4}, {-78, -4}, {-71, -4}, {-71, -28}, {-71.5, -28}, {-71.5, -28}, {-72, -28}}, color = {0, 0, 127}));
  connect(Room.air_flange2, airSink.air_flange) annotation(
    Line(points = {{-4, -32}, {19, -32}}, color = {0, 100, 150}));
  connect(fan.air_flange2, Room.air_flange1) annotation(
    Line(points = {{-64, -32}, {-20, -32}, {-20, -32}, {-20, -32}, {-20, -32}, {-20, -32}}, color = {0, 100, 150}));
  connect(sTphi.phi, airSrc_cond.iphi) annotation(
    Line(points = {{36, -72}, {42, -72}, {42, -84}, {-116, -84}, {-116, -72}, {-110, -72}, {-110, -72}}, color = {0, 0, 127}));
  connect(PI_T.CS, airPrescribedFlowRate_Volume1.iq) annotation(
    Line(points = {{-144, -54}, {-60, -54}, {-60, -60}, {-60, -60}}, color = {0, 0, 127}));
  connect(sTphi.T, airSrc_cond.iT) annotation(
    Line(points = {{36, -64}, {48, -64}, {48, -92}, {-124, -92}, {-124, -62}, {-110, -62}, {-110, -64}}, color = {0, 0, 127}));
  connect(realExpression3.y, PI_T.SP) annotation(
    Line(points = {{-190, -54}, {-160, -54}, {-160, -54}, {-160, -54}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5327));
end OneRoom_ExtData_noAHU;