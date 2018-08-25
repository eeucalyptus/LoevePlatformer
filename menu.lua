local current_menu_state

local function init_menu() 
	print("initialized menu")
	current_menu_state = 0
end

function update_menu(dt)
	if love.keyboard.isDown("up") then
		current_menu_state = current_menu_state + 1
	elseif love.keyboard.isDown("down") then
		current_menu_state = current_menu_state - 1
	if current_menu_state < 0 then
		current_menu_state = 0
end

function draw_menu()

end
