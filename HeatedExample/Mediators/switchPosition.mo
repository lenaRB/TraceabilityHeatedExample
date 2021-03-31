within HeatedExample.Mediators;

record switchPosition
extends Mediator(mType = "Real", 
  clients = {Client(modelID = "HeatedExample.Requirements.switchingDelay", component = "isOn")}, 
  providers = {Provider(modelID = "HeatedExample.Design.HeatedElement", template = "%getPath.switchSignal")});


end switchPosition;