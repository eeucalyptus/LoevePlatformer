local world = require "world"
local level = require "level"

local current_menu_state = 1
local current_menu_state_string = "level1"

local menu = {}
local world

local switch_to_level = false

local levelfiles = {"level0.txt", "level1.txt"}

function menu.init_menu(w) 
    print("initializing menu...")
    world = w
end

function menu.update_menu(dt)
    if current_menu_state == 1 then
        current_menu_state_string = "test1"
    elseif current_menu_state == 2 then
        current_menu_state_string = "test2"
    end
    if current_menu_state < 1 then
        current_menu_state = 1
    elseif current_menu_state > 2 then
        current_menu_state = 2
    end

    if switch_to_level == true then
        switch_to_level = false
        return true
    end
    return false
end

function menu.draw_menu()
    love.graphics.setColor(1, 1, 1)

	width = love.graphics.getFont():getWidth( current_menu_state_string )
	x = math.floor((love.graphics.getWidth() - width) / 2)
	y = math.floor(love.graphics.getHeight() / 2)
    love.graphics.print(current_menu_state_string, x, y)
end

function menu.keyPressed(key)
    if key == "down" then
        current_menu_state = current_menu_state - 1
    elseif key == "up" then
        current_menu_state = current_menu_state + 1
    elseif key == "return" then
        print("loading level...")
        world.generate(level.load(levelfiles[current_menu_state]))
        switch_to_level = true
    end
end

return menu
