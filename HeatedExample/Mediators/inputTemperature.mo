within HeatedExample.Mediators;

record inputTemperature
extends Mediator(mType = "Real", 
 clients = {Client(modelID = "HeatedExample.Design.HeatedElement", component = "roomTemp")}, 
  providers = {Provider(modelID = "HeatedExample.Scenarios.SunnyDay", template = "%getPath.roomT")});
end inputTemperature;