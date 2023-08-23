local cameraModule = require(components.Camera)
local rs = game:GetService("RunService")

local newCamera = cameraModule.create(playerModel,1000,10000,Vector3.new(4000,4000,4000),Vector3.new(5,15,5))
newCamera:initialize()

rs:BindToRenderStep("cameraUpdate",200,function() newCamera:update() end)