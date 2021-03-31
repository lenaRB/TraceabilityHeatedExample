within HeatedExample.Mediators;

record temperatureLevel
  extends Mediator(mType = "Real", 
  clients = {Client(modelID = "HeatedExample.Requirements.noOverheating", component = "temp")}, 
  providers = {Provider(modelID = "HeatedExample.Design.HeatedElement", template = "%getPath.objectT")});
end temperatureLevel;