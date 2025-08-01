-- Aesthetic Draggable Square Frame Script (Fixed)
-- Place this in StarterPlayerScripts or StarterGui

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- Create ScreenGui FIRST
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AestheticFrameGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Container (now that screenGui exists)
local container = Instance.new("Frame")
container.Name = "Container"
container.BackgroundTransparency = 1
container.Parent = screenGui

-- Responsive sizing
if isMobile then
    container.Size = UDim2.new(0, 280, 1, -20)
    container.Position = UDim2.new(1, -290, 0, 10)
else
    container.Size = UDim2.new(0, 320, 1, -20)
    container.Position = UDim2.new(1, -330, 0, 10)
end

-- List Layout
local listLayout = Instance.new("UIListLayout")
listLayout.FillDirection = Enum.FillDirection.Vertical
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
listLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = container

-- Create notification function
local function createNotification(title, message, notifType, duration)
    title = title or "Notification"
    message = message or "Message"
    notifType = notifType or "info"
    duration = duration or 4
    
    -- Main frame
    local notif = Instance.new("Frame")
    notif.Name = "Notification"
    notif.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notif.BorderSizePixel = 0
    notif.Parent = container
    
    -- Responsive height
    if isMobile then
        notif.Size = UDim2.new(1, 0, 0, 65)
    else
        notif.Size = UDim2.new(1, 0, 0, 70)
    end
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = notif
    
    -- Border
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(50, 50, 50)
    stroke.Thickness = 1
    stroke.Parent = notif
    
    -- Accent colors
    local colors = {
        info = Color3.fromRGB(0, 162, 255),
        success = Color3.fromRGB(0, 200, 100),
        warning = Color3.fromRGB(255, 165, 0),
        error = Color3.fromRGB(255, 70, 70)
    }
    
    -- Left accent
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 3, 1, 0)
    accent.Position = UDim2.new(0, 0, 0, 0)
    accent.BackgroundColor3 = colors[notifType] or colors.info
    accent.BorderSizePixel = 0
    accent.Parent = notif
    
    local accentCorner = Instance.new("UICorner")
    accentCorner.CornerRadius = UDim.new(0, 3)
    accentCorner.Parent = accent
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -40, 0, 20)
    titleLabel.Position = UDim2.new(0, 12, 0, 6)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = notif
    
    -- Message
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Size = UDim2.new(1, -15, 1, -28)
    msgLabel.Position = UDim2.new(0, 12, 0, 24)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextYAlignment = Enum.TextYAlignment.Top
    msgLabel.TextWrapped = true
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.Parent = notif
    
    -- Responsive text sizes
    if isMobile then
        titleLabel.TextSize = 13
        msgLabel.TextSize = 11
    else
        titleLabel.TextSize = 14
        msgLabel.TextSize = 12
    end
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 25, 0, 25)
    closeBtn.Position = UDim2.new(1, -30, 0, 5)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
    closeBtn.TextSize = isMobile and 16 or 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = notif
    
    -- Progress bar
    local progress = Instance.new("Frame")
    progress.Size = UDim2.new(1, 0, 0, 2)
    progress.Position = UDim2.new(0, 0, 1, -2)
    progress.BackgroundColor3 = colors[notifType] or colors.info
    progress.BorderSizePixel = 0
    progress.Parent = notif
    
    -- Animations
    notif.Position = UDim2.new(1, 50, 0, 0)
    notif.BackgroundTransparency = 1
    
    -- Slide in
    local slideIn = TweenService:Create(notif, 
        TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0}
    )
    
    -- Progress animation
    local progressTween = TweenService:Create(progress,
        TweenInfo.new(duration, Enum.EasingStyle.Linear),
        {Size = UDim2.new(0, 0, 0, 2)}
    )
    
    -- Slide out function
    local function slideOut()
        local slideOutTween = TweenService:Create(notif,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
            {Position = UDim2.new(1, 50, 0, 0), BackgroundTransparency = 1}
        )
        slideOutTween:Play()
        slideOutTween.Completed:Connect(function()
            notif:Destroy()
        end)
    end
    
    -- Close button events
    closeBtn.MouseButton1Click:Connect(slideOut)
    closeBtn.MouseEnter:Connect(function()
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    closeBtn.MouseLeave:Connect(function()
        closeBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
    end)
    
    -- Start animations
    slideIn:Play()
    progressTween:Play()
    progressTween.Completed:Connect(slideOut)
    
    return notif
end

-- Global function
_G.showNotification = createNotification

-- Main Frame (Square)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "AestheticFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 200) -- Square frame
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -100) -- Center initially
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = false -- We'll handle dragging manually
mainFrame.Parent = screenGui

-- Corner radius for modern look
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Gradient background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
gradient.Rotation = 45
gradient.Parent = mainFrame

-- Stroke for border effect
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(80, 80, 120)
stroke.Thickness = 1
stroke.Transparency = 0.3
stroke.Parent = mainFrame

-- Header bar (This will be the drag handle)
local headerBar = Instance.new("Frame")
headerBar.Name = "HeaderBar"
headerBar.Size = UDim2.new(1, 0, 0, 30)
headerBar.Position = UDim2.new(0, 0, 0, 0)
headerBar.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
headerBar.BorderSizePixel = 0
headerBar.Active = true
headerBar.Parent = mainFrame

-- Header corner
local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = headerBar

-- Invisible drag detector (covers entire header)
local dragDetector = Instance.new("TextButton")
dragDetector.Name = "DragDetector"
dragDetector.Size = UDim2.new(1, -35, 1, 0) -- Leave space for close button
dragDetector.Position = UDim2.new(0, 0, 0, 0)
dragDetector.BackgroundTransparency = 1
dragDetector.Text = ""
dragDetector.Active = true
dragDetector.Parent = headerBar

-- Title text
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GAG DUPE! (Work!)"
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 240)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Active = false
titleLabel.Parent = headerBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 2.5)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Active = true
closeButton.Parent = headerBar

-- Close button corner
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

-- Content area
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -50)
contentFrame.Position = UDim2.new(0, 10, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Active = false
contentFrame.Parent = mainFrame

-- Global variables for cooldowns
local bypassed = false
local duped = false

-- Bypass Button
local bypassB = Instance.new("TextButton")
bypassB.Name = "bypass"
bypassB.Size = UDim2.new(0.3, 0, 0.1, 0)
bypassB.AnchorPoint = Vector2.new(0.5, 0)
bypassB.Position = UDim2.new(0.5, 0, 0.425, 0)
bypassB.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
bypassB.Parent = contentFrame
bypassB.TextScaled = true 
bypassB.TextColor3 = Color3.fromRGB(255, 255, 255)
bypassB.Text = "Bypass"

-- Fixed bypass button logic
bypassB.Activated:Connect(function()
    if bypassed then
        createNotification("Already Bypassed!", "Please stop doing this! It could corrupt your garden! Wait 10 seconds before bypassing again.", "warning", 5)
    else
        createNotification("Bypassed!", "Make sure you are holding a fruit in your hands to duplicate it", "info", 3)
        bypassed = true
        -- Reset bypass after 10 seconds
        spawn(function()
            wait(10)
            bypassed = false
        end)
    end
end)

-- Sample content label
local contentLabel = Instance.new("TextLabel")
contentLabel.Name = "ContentLabel"
contentLabel.Size = UDim2.new(1, 0, 0.375, 0)
contentLabel.Position = UDim2.new(0, 0, 0, 0)
contentLabel.BackgroundTransparency = 0.9
contentLabel.Text = "Note: These Script Is Only Client Sided it can't do Real Duplicates\n\nEnjoy this script!"
contentLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
contentLabel.TextScaled = true
contentLabel.Font = Enum.Font.Gotham
contentLabel.TextWrapped = true
contentLabel.Active = false
contentLabel.Parent = contentFrame

-- Dragging variables
local dragging = false
local dragStart = nil
local startPos = nil

-- Drag functions
local function startDrag(input)
    dragging = true
    dragStart = input.Position
    startPos = mainFrame.Position
    
    -- Visual feedback
    local tween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, mainFrame.Size.X.Offset + 20, 0, mainFrame.Size.Y.Offset + 20)}
    )
    tween:Play()
end

local function updateDrag(input)
    if dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end

local function endDrag()
    if dragging then
        dragging = false
        
        -- Return to normal size
        local tween = TweenService:Create(
            mainFrame,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 200, 0, 200)}
        )
        tween:Play()
    end
end

-- Connect drag events to the drag detector
dragDetector.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input)
    end
end)

dragDetector.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

-- Global input handling for drag updates
UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input)
    end
end)

-- Handle mouse leaving the game window
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        endDrag()
    end
end)

-- Mobile touch handling
UserInputService.TouchMoved:Connect(function(touch, gameProcessed)
    if not gameProcessed and dragging then
        updateDrag(touch)
    end
end)

UserInputService.TouchEnded:Connect(function(touch, gameProcessed)
    if not gameProcessed then
        endDrag()
    end
end)

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    -- Fade out animation
    local tween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}
    )
    tween:Play()
    
    tween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)

-- Close button hover effects
closeButton.MouseEnter:Connect(function()
    local tween = TweenService:Create(
        closeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}
    )
    tween:Play()
end)

closeButton.MouseLeave:Connect(function()
    local tween = TweenService:Create(
        closeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(220, 60, 60)}
    )
    tween:Play()
end)

-- Entrance animation
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundTransparency = 1

local entranceTween = TweenService:Create(
    mainFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 200, 0, 200), BackgroundTransparency = 0}
)
entranceTween:Play()

-- Subtle glow effect animation
spawn(function()
    while mainFrame.Parent do
        local glowTween1 = TweenService:Create(
            stroke,
            TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.1}
        )
        glowTween1:Play()
        glowTween1.Completed:Wait()
        
        local glowTween2 = TweenService:Create(
            stroke,
            TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.5}
        )
        glowTween2:Play()
        glowTween2.Completed:Wait()
    end
end)

-- Dupe Button
local dupeB = Instance.new("TextButton")
dupeB.Name = "dupe"
dupeB.Size = UDim2.new(0.35, 0, 0.15, 0)
dupeB.AnchorPoint = Vector2.new(0.5, 0)
dupeB.Position = UDim2.new(0.5, 0, 0.55, 0)
dupeB.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
dupeB.Parent = contentFrame
dupeB.TextScaled = true 
dupeB.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeB.Text = "Dupe"

-- Function to check if player is holding an item
local function isHoldingItem()
    local character = player.Character
    if not character then return false end
    
    -- Check if there's a tool equipped
    local tool = character:FindFirstChildOfClass("Tool")
    if tool then return true, tool end
    
    return false, nil
end

-- Function to check if item has "kg" in its name
local function hasKgInName(tool)
    if not tool then return false end
    local toolName = tool.Name:lower() -- Convert to lowercase for case-insensitive check
    return string.find(toolName, "kg") ~= nil
end

-- Client-side duplication function
local function duplicateItem(tool)
    if not tool then return false end
    
    -- Create a visual clone of the tool for client-side effect
    local clone = tool:Clone()
    clone.Name = tool.Name
    
    -- Add the cloned tool to player's backpack
    clone.Parent = player.Backpack
    
    -- Create visual effect particles
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            -- Create sparkle effect
            local attachment = Instance.new("Attachment")
            attachment.Parent = humanoidRootPart
            
            local sparkles = Instance.new("Sparkles")
            sparkles.Parent = humanoidRootPart
            sparkles.Color = Color3.fromRGB(0, 255, 0)
            
            -- Remove effect after 2 seconds
            spawn(function()
                wait(2)
                sparkles:Destroy()
                attachment:Destroy()
            end)
        end
    end
    
    return true
end

-- Dupe button functionality
dupeB.Activated:Connect(function()
    if duped then 
        createNotification("Warning!", "Please wait before duping again (10 second cooldown)", "warning", 3) 
        return 
    end
    
    local holding, tool = isHoldingItem()
    if holding then
        -- Check if the tool has "kg" in its name
        if not hasKgInName(tool) then
            createNotification("Invalid Item!", "You can only dupe fruits! Current item: " .. tool.Name, "error", 4)
            return
        end
        
        if not bypassed then
            createNotification("Bypass Required!", "You need to bypass first before duping!", "warning", 3)
            return
        end
        
        createNotification("Duping!", "Attempting to duplicate your item...", "info", 3)
        
        -- Set cooldown immediately
        duped = true
        
        -- Simulate duping process
        spawn(function()
            wait(2) -- Wait for duping animation
            
            local success = duplicateItem(tool)
            if success then
                createNotification("Success!", "Successfully duped: " .. tool.Name .. "!", "success", 4)
            else
                createNotification("Failed!", "Duplication failed! Try again later.", "error", 3)
            end
        end)
        
        -- Reset cooldown after 10 seconds
        spawn(function()
            wait(10)
            duped = false
        end)
    else
        createNotification("No Item Equipped!", "You need to equip/hold a fruit with 'kg' in its name before duping!", "warning", 3)
    end
end)

-- Welcome notification
wait(1.5)
createNotification("Welcome!", "Grow a Garden dupe script loaded!", "success", 3)

-- Usage: _G.showNotification("Title", "Message", "info", 4)