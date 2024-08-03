game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.2)
    local Char = game.Players.LocalPlayer.Character
        local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
    
        for i,v in next, Hum:GetPlayingAnimationTracks() do
            v:Stop()
    
        end
    
    local pchar= game.Players.LocalPlayer.Character
    if pchar:GetAttribute("Character") == "Bald" then
            local AnimationId = "16746746641"
            local Anim = Instance.new("Animation")
            Anim.AnimationId = "rbxassetid://"..AnimationId
            local k = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
            k:Play()
    end
    end)