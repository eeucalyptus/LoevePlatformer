local world = require "world"
local level = require "level"

local current_menu_state = 1
local current_menu_state_string = "level1"

local menu = {}
local world

local inMenu = true

local levelfiles = {"level0.txt", "level1.txt"}

function menu.init_menu(w) 
    world = w
end

function menu.update_menu(dt, iM)
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
    iM = inMenu
end

function menu.draw_menu()
    love.graphics.setColor(1, 1, 1)

    love.graphics.print(current_menu_state_string, 300, 200)
end

function load_level()

end

function menu.keyPressed(key)
    if key == "down" then
        current_menu_state = current_menu_state - 1
    elseif key == "up" then
        current_menu_state = current_menu_state + 1
    elseif key == "enter" then
        current_menu_state_string = "loading level..."
        world.generate(level.load(levelfiles[current_menu_state]))
        inMenu = false
    end
end

return menu
