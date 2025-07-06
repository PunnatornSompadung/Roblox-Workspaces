local RunService = game:GetService("RunService") --ใช้ RunService แทน Heartbeat
local grassFolder = workspace:WaitForChild("GrassFolder") --และต้องมี Grass Folder อยู่ใน Workspace
local time = 0 -- ตัวแปรเก็บเวลา

RunService.Heartbeat:Connect(function(dt) --รันฟังก์ชันนี้ทุกเฟรม (dt คือเวลาที่ผ่านไปในหนึ่งเฟรม (delta time))
	time += dt --เพิ่มค่าของ time ทีละนิดในแต่ละเฟรม ทำให้ math.sin(time) เปลี่ยนค่าตลอดเวลา 

	for _, part in ipairs(grassFolder:GetChildren()) do 
		if part:IsA("BasePart") then --ลูปตรวจสอบแต่ละวัตถุใน GrassFolder
			--ถ้าวัตถุนั้นเป็น BasePart เช่น Part หรือ MeshPart จะทำงาน
			
			local wave = math.sin(time + part.Position.X) * 0.08 --ยิ่งค่าเยอะก็จะแกว่งหนักเรื่อยๆ 
			--ใช้ math.sin() เพื่อสร้างค่าแกว่งขึ้น-ลง (ระหว่าง -1 ถึง 1)
			--เพิ่ม + part.Position.X เพื่อทำให้ต้นหญ้าแต่ละต้น พริ้วไม่พร้อมกัน 
			--คูณ 0.05 เพื่อลดความรุนแรง — ให้เอนไม่เยอะจนเกินไป
			
			part.CFrame = CFrame.new(part.Position) * CFrame.Angles(0, 0, wave) 
			--สร้าง CFrame ใหม่ ที่ตำแหน่งเดิมของต้นหญ้า
			--ใช้ CFrame.Angles(0, 0, wave) เพื่อให้หญ้า เอียงซ้าย-ขวาเล็กน้อย
			--แกน Z คือการเอียงไปทางซ้าย-ขวา (เหมือนลมพัดจากข้าง)

		end --จบการทำงานฟังชั่น if part:IsA...
	end --จบการทำงานฟังชั่น  for _, part in ipairs(grassFolder:GetChildren()) do...
end) --จบการทำงานฟังชั่น RunService...

wait(5)
print("Working!")

-- Working with Lua Script --
-- Put this script in ServerScriptService --