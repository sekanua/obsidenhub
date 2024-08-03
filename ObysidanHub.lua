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


    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)


    
    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)



    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
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
