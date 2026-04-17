local player = game.Players.LocalPlayer
local repeats = 3 -- ตั้งจำนวนรอบที่อยากให้รันซ้ำตรงนี้

-- รอให้โฟลเดอร์หลักโหลดเสร็จก่อนเริ่มทำงาน
local bonusFolder = workspace:WaitForChild("Map"):WaitForChild("BonusChests")

for round = 1, repeats do
    
    local bonusChests = bonusFolder:GetChildren()
    
    for i, chest in ipairs(bonusChests) do
        -- เช็คว่าเป็น Part และมี Attachment/ProximityPrompt ไหม
        local attachment = chest:FindFirstChild("Attachment")
        if attachment then
            local prompt = attachment:FindFirstChild("ProximityPrompt")
            
            if prompt and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                -- วาร์ปไปที่กล่อง
                player.Character.HumanoidRootPart.CFrame = chest.CFrame * CFrame.new(0, 3, 0)
                
                task.wait(0.3) -- รอให้ตัวละครนิ่งนิดนึง
                fireproximityprompt(prompt)
                task.wait(0.5) -- เว้นระยะกันดีเทค
            end
        end
    end
    

    task.wait(2) -- เว้นระยะเวลาสักครู่ก่อนเริ่มรอบถัดไป
end
