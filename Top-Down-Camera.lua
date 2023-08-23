--[[
A top down camera module created by @WAHAHHAHAHAHH(CFrame)
https://www.roblox.com/users/4085080308/profile
]]
local camera = {}
camera.__index = camera
local currentCamera = workspace.CurrentCamera
function camera.create(target:part,dampening:number,power:number,maxforce:vector3,offset:vector3)
	local self = setmetatable({},camera)
	self.dampening = dampening
	self.power = power
	self.maxforce = maxforce
	self.target = target
	self.offset = offset
	return self
end
function camera:initialize()
	local part = Instance.new("Part",currentCamera)
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false
	part.Transparency = 1
	local bp = Instance.new("BodyPosition",part)	
	bp.D = self.dampening
	bp.P = self.power
	bp.MaxForce = self.maxforce
	self.part = part
	self.bp = bp
	return self
end
function camera:update()
	self.bp.Position = self.target.Position + self.offset
	currentCamera.CFrame = CFrame.new(self.part.Position,self.target.Position - self.offset)
end
return camera