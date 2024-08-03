local changeAnim = function(OGAnim, NewAnim, NewAnimSpeed, NewAnimTPos)
    local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        
        humanoid.AnimationPlayed:Connect(function(d)
    if d.Animation.AnimationId == "rbxassetid://"..tostring(OGAnim) then
    d:Stop()
    
            local pchar= game.Players.LocalPlayer.Character
            local AnimationId = tostring(NewAnim)
            local Anim = Instance.new("Animation")
            Anim.AnimationId = "rbxassetid://"..AnimationId
            local k = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
            k:Play()
    if NewAnimSpeed then
    k:AdjustSpeed(NewAnimSpeed)
    end
    if NewAnimTPos then
    k.TimePosition = NewAnimTPos
    end
           end
    end)
    end
    
    
    
    
    
    
    changeAnim(15955393872 ,16310343179)