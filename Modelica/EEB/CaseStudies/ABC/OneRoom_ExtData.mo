within EEB.CaseStudies.ABC;

model OneRoom_ExtData
  Real pippo = Room.air.phi * 100;
  EEB.Components.BaseComponents.Air.Volumes.AirVolume Room(V = 50, Xstart = 0.005) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
    Placement(visible = true, transformation(origin = {-70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qa(y = 50 / 3600) annotation(
    Placement(visible = true, transformation(origin = {-94, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2wall(S = 6, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {-10, -8}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS wall2ext(S = 6, gamma = 12) annotation(
    Placement(visible = true, transformation(origin = {54, 52}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  EEB.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous wall(A = 6, Tstart = 293.15) annotation(
    Placement(visible = true, transformation(origin = {22, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.AggregateComponents.Envelope.Openings.InternalWindow_Closed_SingleGlass window(H = 3, L = 3, Tstart = 293.15, material = EEB.Media.Materials.Glasses.Glass(), s = 0.005) annotation(
    Placement(visible = true, transformation(origin = {38, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS window2ext(S = 9, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {72, -38}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_SS room2window(S = 9, gamma = 8) annotation(
    Placement(visible = true, transformation(origin = {8, -38}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2window annotation(
    Placement(visible = true, transformation(origin = {110, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow rad2wall annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radFracWall(k = 6 / (6 + 9)) annotation(
    Placement(visible = true, transformation(origin = {150, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radFracWindow(k = 9 / (6 + 9)) annotation(
    Placement(visible = true, transformation(origin = {150, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable Weather(columns = 2:4, fileName = "/home/artoo/Dropbox/Buildings_ABC/Modelica/EEB/Resources/TestDEIB_123_July2015_7days_weather.txt", tableName = "data", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-186, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Text annotation(
    Placement(visible = true, transformation(origin = {92, 52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable InternalData(columns = 2:5, fileName = "/home/artoo/Dropbox/Buildings_ABC/Modelica/EEB/Resources/TestDEIB_123_July2015_7days_InternalData.txt", tableName = "data", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression patm(y = 101325) annotation(
    Placement(visible = true, transformation(origin = {-136, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.CaseStudies.ABC.AirSource_pTphi_prescribed airSrc annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LowpassButterworth LPF_RHext(f = 1 / 3600, initType = Modelica.Blocks.Types.Init.InitialOutput, n = 4, y_start = 50) annotation(
    Placement(visible = true, transformation(origin = {-130, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.HVAC.AirHandling.ControlledHandler_Tphi_AlgQbal AHU(TC = 60) annotation(
    Placement(visible = true, transformation(origin = {-38, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression sp_T(y = 273.15 + 24) annotation(
    Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression sp_phi(y = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-66, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression ahuON(y = true) annotation(
    Placement(visible = true, transformation(origin = {-76, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fan.air_flange2, AHU.air_flange1) annotation(
    Line(points = {{-62, -60}, {-46, -60}}, color = {0, 100, 150}));
  connect(AHU.air_flange2, Room.air_flange1) annotation(
    Line(points = {{-30, -60}, {-18, -60}}, color = {0, 100, 150}));
  connect(AHU.Tsp, sp_T.y) annotation(
    Line(points = {{-46, -56}, {-58, -56}, {-58, -80}, {-79, -80}}, color = {0, 0, 127}));
  connect(sp_phi.y, AHU.phisp) annotation(
    Line(points = {{-54, -90}, {-50, -90}, {-50, -64}, {-46, -64}}, color = {0, 0, 127}));
  connect(ahuON.y, AHU.ON) annotation(
    Line(points = {{-64, -14}, {-54, -14}, {-54, -52}, {-46, -52}}, color = {255, 0, 255}));
  connect(LPF_RHext.y, airSrc.iphi) annotation(
    Line(points = {{-118, 24}, {-104, 24}, {-104, -4}, {-172, -4}, {-172, -68}, {-108, -68}}, color = {0, 0, 127}));
  connect(Weather.y[1], airSrc.iT) annotation(
    Line(points = {{-174, 70}, {-160, 70}, {-160, -60}, {-108, -60}}, color = {0, 0, 127}, thickness = 0.5));
  connect(patm.y, airSrc.iP) annotation(
    Line(points = {{-125, -32}, {-121, -32}, {-121, -52}, {-108, -52}}, color = {0, 0, 127}));
  connect(airSrc.air_flange, fan.air_flange1) annotation(
    Line(points = {{-91, -60}, {-78, -60}}, color = {0, 100, 150}));
  connect(Room.air_flange2, airSink.air_flange) annotation(
    Line(points = {{-2, -60}, {21, -60}}, color = {0, 100, 150}));
  connect(qa.y, fan.iq) annotation(
    Line(points = {{-83, -32}, {-69, -32}, {-69, -56}, {-70, -56}}, color = {0, 0, 127}));
  connect(Room.heatPort, room2wall.ss1) annotation(
    Line(points = {{-10, -51}, {-10, -14}}, color = {255, 0, 0}));
  connect(room2window.ss1, Room.heatPort) annotation(
    Line(points = {{2, -38}, {-10, -38}, {-10, -51}}, color = {255, 0, 0}));
  connect(room2window.ss2, window.airSide1) annotation(
    Line(points = {{14, -38}, {29, -38}}, color = {255, 0, 0}));
  connect(window.airSide2, window2ext.ss1) annotation(
    Line(points = {{47, -38}, {66, -38}}, color = {255, 0, 0}));
  connect(Text.port, window2ext.ss2) annotation(
    Line(points = {{82, 52}, {78, 52}, {78, -38}}, color = {191, 0, 0}));
  connect(rad2window.port, window.airSide2) annotation(
    Line(points = {{100, -18}, {56, -18}, {56, -38}, {47, -38}}, color = {191, 0, 0}));
  connect(room2wall.ss2, wall.side1) annotation(
    Line(points = {{-10, -2}, {-10, 52}, {12, 52}}, color = {255, 0, 0}));
  connect(Weather.y[1], Text.T) annotation(
    Line(points = {{-175, 70}, {120, 70}, {120, 52}, {104, 52}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Text.port, wall2ext.ss2) annotation(
    Line(points = {{82, 52}, {60, 52}}, color = {191, 0, 0}));
  connect(Weather.y[3], radFracWall.u) annotation(
    Line(points = {{-174, 70}, {180, 70}, {180, 20}, {162, 20}, {162, 20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Weather.y[2], LPF_RHext.u) annotation(
    Line(points = {{-174, 70}, {-160, 70}, {-160, 24}, {-142, 24}, {-142, 24}}, color = {0, 0, 127}, thickness = 0.5));
  connect(rad2window.Q_flow, radFracWindow.y) annotation(
    Line(points = {{120, -18}, {139, -18}}, color = {0, 0, 127}));
  connect(radFracWall.u, radFracWindow.u) annotation(
    Line(points = {{162, 20}, {180, 20}, {180, -18}, {162, -18}, {162, -18}, {162, -18}, {162, -18}}, color = {0, 0, 127}));
  connect(rad2wall.Q_flow, radFracWall.y) annotation(
    Line(points = {{120, 20}, {130, 20}, {130, 20}, {140, 20}, {140, 20}, {139, 20}, {139, 20}, {138, 20}}, color = {0, 0, 127}));
  connect(rad2wall.port, wall.side2) annotation(
    Line(points = {{100, 20}, {84.5, 20}, {84.5, 20}, {69, 20}, {69, 20}, {38, 20}, {38, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}, {30, 52}}, color = {191, 0, 0}));
  connect(wall.side2, wall2ext.ss1) annotation(
    Line(points = {{30, 52}, {48, 52}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 60.5449));
end OneRoom_ExtData;