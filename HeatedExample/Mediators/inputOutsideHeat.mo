within HeatedExample.Mediators;

record inputOutsideHeat
extends Mediator(mType = "Real", 
   clients = {Client(modelID = "HeatedExamples.Design.HeatedElement", component = "outsideHeat")}, 
  providers = {Provider(modelID = "HeatedExample.Scenarios.SunnyDay", template = "%getPath.timeVal")});
end inputOutsideHeat;