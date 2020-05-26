within EEB.Trials.LabForSeminars;

model Example_007
  EEB.Components.BaseComponents.Envelope.SolidMultilayer_Homogeneous MLwall(A = 15, Tstart = 298.15, n = 10, ro(displayUnit = "kg/m3")) annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2Ext_Clarke convection_Wall2Ext_Clarke1 annotation(
    Placement(visible = true, transformation(origin = {160, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner EEB.BoundaryConditions.AmbientConditions ambient_settings(Ta_avg = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Volumes.AirVolume air(Tstart = 298.15, V = 100) annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  EEB.Components.BaseComponents.Thermal.HeatTransfer.Convection_Wall2air_BRIS a2w annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sources.AirSource_pTX_fixed airSource(T0 = 301.15) annotation(
    Placement(visible = true, transformation(origin = {-148, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.BaseComponents.Air.Sinks.AirSink_P_fixed airSink annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.25 + 25) annotation(
    Placement(visible = true, transformation(origin = {-136, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Controllers.Blocks.Analogue.AWPI_1dof PI_T(CSmax = 300 / 3600, CSmin = 0, K = 10, Ti = 100) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pQ annotation(
    Placement(visible = true, transformation(origin = {-24, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iQ(y = if ambient_settings.hod > 8 and ambient_settings.hod < 17 then 50 else 0) annotation(
    Placement(visible = true, transformation(origin = {-74, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EEB.Components.AggregateComponents.Heating.FanCoil fanCoil1 annotation(
    Placement(visible = true, transformation(origin = {-108, -8}, extent = {{-10, -10}, {20, 10}}, rotation = 0)));
  Components.BaseComponents.Water.Sources.WaterSource_WT_fixed wsrc(W0 = 1) annotation(
    Placement(visible = true, transformation(origin = {-176, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.BaseComponents.Water.Sinks.WaterSink_P_fixed wsnk annotation(
    Placement(visible = true, transformation(origin = {-166, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression fan_rpm(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-82, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.BaseComponents.Air.Movers.AirPrescribedFlowRate_Volume fan annotation(
    Placement(visible = true, transformation(origin = {-38, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PI_T.CS, fan.iq) annotation(
    Line(points = {{-82, -44}, {-38, -44}, {-38, -66}, {-38, -66}}, color = {0, 0, 127}));
  connect(fan.air_flange2, air.air_flange2) annotation(
    Line(points = {{-30, -70}, {-20, -70}, {-20, -36}, {-20, -36}}, color = {0, 100, 150}));
  connect(fanCoil1.air_flange1, fan.air_flange1) annotation(
    Line(points = {{-100, -16}, {-98, -16}, {-98, -28}, {-72, -28}, {-72, -70}, {-46, -70}, {-46, -70}}, color = {0, 100, 150}));
  connect(fan_rpm.y, fanCoil1.icmd01) annotation(
    Line(points = {{-70, 16}, {-64, 16}, {-64, -8}, {-90, -8}, {-90, -8}}, color = {0, 0, 127}));
  connect(wsnk.water_flange, fanCoil1.water_flange2) annotation(
    Line(points = {{-158, -20}, {-136, -20}, {-136, -14}, {-116, -14}, {-116, -14}}));
  connect(wsrc.water_flange, fanCoil1.water_flange1) annotation(
    Line(points = {{-168, -4}, {-116, -4}, {-116, -2}, {-116, -2}}));
  connect(airSource.air_flange, fanCoil1.air_flange2) annotation(
    Line(points = {{-138, 14}, {-100, 14}, {-100, 0}, {-100, 0}}, color = {0, 100, 150}));
  connect(iQ.y, pQ.Q_flow) annotation(
    Line(points = {{-62, 38}, {-36, 38}, {-36, 38}, {-34, 38}}, color = {0, 0, 127}));
  connect(pQ.port, air.heatPort) annotation(
    Line(points = {{-14, 38}, {-2, 38}, {-2, -20}, {-2, -20}}, color = {191, 0, 0}));
  connect(air.heatPort, sT.port) annotation(
    Line(points = {{-2, -20}, {-1, -20}, {-1, -20}, {-2, -20}, {-2, -90}, {-80, -90}, {-80, -90}, {-80, -90}, {-80, -90}}, color = {255, 0, 0}));
  connect(sT.T, PI_T.PV) annotation(
    Line(points = {{-100, -90}, {-104, -90}, {-104, -90}, {-110, -90}, {-110, -50}, {-98, -50}, {-98, -50}, {-98, -50}, {-98, -50}}, color = {0, 0, 127}));
  connect(spT.y, PI_T.SP) annotation(
    Line(points = {{-125, -44}, {-99, -44}}, color = {0, 0, 127}));
  connect(airSink.air_flange, air.air_flange1) annotation(
    Line(points = {{-41, 10}, {-21, 10}, {-21, -4}, {-20, -4}, {-20, -4}, {-21, -4}}, color = {0, 100, 150}));
  connect(a2w.wall, MLwall.side1) annotation(
    Line(points = {{56, -20}, {90, -20}}, color = {255, 0, 0}));
  connect(air.heatPort, a2w.air) annotation(
    Line(points = {{-2, -20}, {5, -20}, {5, -20}, {10, -20}, {10, -20}, {22, -20}, {22, -20}, {23, -20}, {23, -20}, {22.5, -20}, {22.5, -20}, {24, -20}}, color = {255, 0, 0}));
  connect(MLwall.side2, convection_Wall2Ext_Clarke1.wall) annotation(
    Line(points = {{110, -20}, {122.5, -20}, {122.5, -20}, {137, -20}, {137, -20}, {141.5, -20}, {141.5, -20}, {144, -20}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 200));
end Example_007;