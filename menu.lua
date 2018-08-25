local current_menu_state
local current_menu_state_string

local menu = {}

function menu.init_menu() 
	print("initialized menu")
	current_menu_state = 0
    current_menu_state_string = "test0"
end

function menu.update_menu(dt)
    if current_menu_state == 0 then
        current_menu_state_string = "test0"
    elseif current_menu_state == 1 then
        current_menu_state_string = "test1"
    end
    if current_menu_state < 0 then
        current_menu_state = 0
    elseif current_menu_state > 1 then
        current_menu_state = 1
    end
end

function menu.draw_menu()
    love.graphics.setColor(1, 1, 1)

    love.graphics.print(current_menu_state_string, 300, 200)
end

function menu.keyPressed(key)
    if key == "down" then
        current_menu_state = current_menu_state - 1
    elseif key == "up" then
        current_menu_state = current_menu_state + 1
    end
end

return menu
