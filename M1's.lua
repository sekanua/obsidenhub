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
    changeAnim(10469493270, 17889458563)
    changeAnim(10469630950, 17889461810)
    changeAnim(10469639222, 17889471098)
    changeAnim(10469643643, 17889290569)