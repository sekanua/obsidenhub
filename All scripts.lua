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

  
  
        local Players = game:GetService("Players")

        local player = Players.LocalPlayer
        
        local playerGui = player:WaitForChild("PlayerGui")
        
        
        local function findGuiAndSetText()
        
            local screenGui = playerGui:FindFirstChild("ScreenGui")
        
            if screenGui then
        
                local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
        
                if magicHealthFrame then
        
                    local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
        
                    if textLabel then
        
                        textLabel.Text = "オブシディエン" -- OBSIDIEN
        
                    end
        
                end
        
            end
        
        end
        
        
        playerGui.DescendantAdded:Connect(findGuiAndSetText)
        
        findGuiAndSetText()

  
  
  
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