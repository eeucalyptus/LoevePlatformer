local world = require "world"
local level = require "level"
local menu = require "menu"

local levelfiles = {"level0.txt", "level1.txt"}
local inMenu = true;


function love.load(arg)
    love.window.setMode(600, 400, {resizable=true, vsync=false, minwidth=400, minheight=300, msaa=4})

    menu.init_menu()
    world.generate(level.load(levelfiles[2]))
end

function love.keypressed(key, scancode, isrepeat)
    world.keyPressed(key)

    if key == "a" then
        love.graphics.print("test", 100, 100)
    end
end

function love.update(dt)
    if inMenu then
        menu.update_menu(dt)
    else
        world.LoveWorld:update(dt)
    end
end

function love.draw()
    if inMenu then
        menu.draw_menu()
    else
        love.graphics.polygon("fill", world.player.body:getWorldPoints(world.player.shape:getPoints()))
        for i = 1, #(world.ground) do
            love.graphics.polygon("fill", world.ground[i].body:getWorldPoints(world.ground[i].shape:getPoints()))
        end
        love.graphics.print("Hello World", 400, 300)
    end
end

function love.keypressed(key)
    menu.keyPressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
