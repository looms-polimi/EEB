within EEB.CaseStudies.ABC;

model TableTest
  extends Icons.CaseStudyModel;
  Modelica.Blocks.Sources.CombiTimeTable table(tableOnFile = true, fileName = "modelica://EEB/Resources/testFile.txt", tableName = "pippo", smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, columns = 2:3);
  annotation(
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 1));
end TableTest;