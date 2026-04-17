local bonusChests = workspace.Map.BonusChests:GetChildren()
local player = game.Players.LocalPlayer

for i, chest in ipairs(bonusChests) do
    local attachment = chest:FindFirstChild("Attachment")
    if attachment then
        local prompt = attachment:FindFirstChild("ProximityPrompt")
        
        if prompt and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = chest.CFrame * CFrame.new(0, 3, 0) 
            

            task.wait(0.2) 

            fireproximityprompt(prompt)
            

            task.wait(0.5) 
        end
    end
end
