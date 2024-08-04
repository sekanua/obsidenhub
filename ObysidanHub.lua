local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "OBSYDIAN HUB " .. Fluent.Version, -- Obsydian Hub
    SubTitle = "by",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Loading",
        Content = "Obsydian is Loading for TSB",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })


 Tabs.Main:AddButton({
        Title = "Discord invite",
        Description = "Click to copy to ur clipboard",
        Callback = function()
        setclipboard("https://discord.gg/G2htCv4Egw")
     Fluent:Notify({
        Title = "Copied to clipboard",
        Content = "join rn",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })
     end       
    })



    Tabs.Main:AddButton({
        Title = "Fearless Dash",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sekanua/obsidenhub/main/Dash"))()
            
        end
    })


    Tabs.Main:AddButton({
        Title = "No Cooldown Dash",
        Description = "",
        Callback = function()
        local workspace = game.Workspace
        workspace:SetAttribute("VIPServer", game.Players.LocalPlayer.UserId)
        workspace:SetAttribute("VIPServerOwner", game.Players.LocalPlayer.Name)
        workspace:SetAttribute("EffectAffects", 1)
        workspace:SetAttribute("NoDashCooldown", true)
            
        end
    })



            

       local invis = false
    local Toggle = Tabs.Main:AddToggle("CharacterOffset", {Title = "Invisibility", Description = "Turns you semi-invisible. You'll be visible when you are ragdolled.", Default = false })

    Toggle:OnChanged(function(bool)

        invis = bool
        game.Players.LocalPlayer.Character.CharacterHandler.Client.RunContext = "Server"
        game.Players.LocalPlayer.Character.CharacterHandler.Client.RunContext = "Legacy"
        local char = game.Players.LocalPlayer.Character
        if char and bool == true then
            for i,v in pairs(char:GetChildren()) do
                if v:IsA("BasePart") and v.Name:lower() ~= "humanoidrootpart" and not v.Name:lower():find("hitbox") then
                    v.Transparency = 0.5
                end
            end
        elseif char and bool == false then
            for i,v in pairs(char:GetChildren()) do
                if v:IsA("BasePart") and v.Name:lower() ~= "humanoidrootpart" and not v.Name:lower():find("hitbox") then
                    v.Transparency = 0
                end
            end
        end
    end)

    spawn(function()
        spawn(function()
            while task.wait() do
                local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                if char and invis == true then
                    for i,v in pairs(char:GetChildren()) do
                        if v:IsA("BasePart") and v.Name:lower() ~= "humanoidrootpart" and not v.Name:lower():find("hitbox") then
                            v.Transparency = 0.5
                        end
                    end
                end
            end
        end)
        local RunService = game:GetService("RunService")
        RunService.Heartbeat:Connect(function()
            local char = game.Players.LocalPlayer.Character
            local root = char and char:WaitForChild("HumanoidRootPart", 1)
            local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
            if char and root and humanoid and invis == true then
                local old = {cframe = root.CFrame, cameraoffset = humanoid.CameraOffset}
                root.CFrame = root.CFrame * CFrame.Angles(0,0,math.rad(180))
                humanoid.CameraOffset = Vector3.new(0,-3.23,0)

                local id = "rbxassetid://13633468484"
                local anim = Instance.new("Animation")
                anim.AnimationId = id
                loaded = humanoid.Animator:LoadAnimation(anim)
                loaded.Priority = Enum.AnimationPriority.Action4
                loaded:Play()
                loaded.TimePosition = 4
                loaded:AdjustSpeed(0)
                RunService.RenderStepped:Wait()
                loaded:Stop()

                humanoid.CameraOffset = old.cameraoffset
                root.CFrame = old.cframe
            end
        end)
    end)


    
  
local speed = 65
    local speedtogle = false
    local Slider = Tabs.Main:AddSlider("WalkSpeedNumber", {
        Title = "WalkSpeed Number",
        Description = "Your walkspeed if Loop Speed is toggled on.",
        Default = 65,
        Min = 25,
        Max = 500,
        Rounding = 0,
        Callback = function(Value)
            print("Slider was changed:", Value)
            speed = Value
        end
    })

    local Toggle = Tabs.Main:AddToggle("LoopSpeed", {Title = "Loop Speed", Default = false })
    Toggle:OnChanged(function(bool)
        speedtogle = bool
    end)

    spawn(function()
        local HumanModCons = {}
        spawn(function()
            while true do
                if speed ~= 65 then
                    speed = speed
                else
                    speed = 65
                end
                task.wait()
            end
        end)
        local Char = game.Players.LocalPlayer.Character
        local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
        local function WalkSpeedChange()
            if Char and Human and speedtogle == true then
                Human.WalkSpeed = speed
            end
        end
        WalkSpeedChange()
        HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
        HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or game.Players.LocalPlayer.CharacterAdded:Connect(function(nChar)
            Char, Human = nChar, nChar:WaitForChild("Humanoid")
            WalkSpeedChange()
            HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
        end)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "OBSIDIEN:",
    Content = "Hub has been loaded, now go make kids angry.",
    Duration = 4
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
