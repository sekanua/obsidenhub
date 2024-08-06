local changeAnim = function(OGAnim, NewAnim, NewAnimSpeed, NewAnimTPos,AnimTposEnd, StopSpeed)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local yes = humanoid.AnimationPlayed:Connect(function(d)
if d.Animation.AnimationId == "rbxassetid://"..tostring(OGAnim) then
d:Stop()
local pchar= game.Players.LocalPlayer.Character
local AnimationId = tostring(NewAnim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
k:Play()
task.spawn(function()
    repeat task.wait() until k.TimePosition >= AnimTposEnd
    k:Stop(StopSpeed)
    end)
if NewAnimSpeed then
k:AdjustSpeed(NewAnimSpeed)
end
if NewAnimTPos then
k.TimePosition = NewAnimTPos
end
end
end)
end
changeAnim(AnimationId that u want to change,AnimationID that u want to change it to)
