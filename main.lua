local world = require "world"
local level = require "level"
local menu = require "menu"

local w

function love.load(arg)
    love.window.setMode(600, 400, {resizable=true, vsync=false, minwidth=400, minheight=300, msaa=4})

    menu.init_menu()
    w = world.generate(level.load("test.txt"))
end

function love.keypressed(key, scancode, isrepeat)
    world.keyPressed(key)

    if key == "a" then
        love.graphics.print("test", 100, 100)
    end
end

function love.update(dt)
    w.LoveWorld:update(dt)
    menu.update_menu(dt)
end

function love.draw()
    love.graphics.polygon("fill", w.player.body:getWorldPoints(w.player.shape:getPoints()))
    for i = 1, #(w.ground) do
        love.graphics.polygon("fill", w.ground[i].body:getWorldPoints(w.ground[i].shape:getPoints()))
    end
    love.graphics.print("Hello World", 400, 300)

    menu.draw_menu()
end

function love.keypressed(key)
    menu.keyPressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
