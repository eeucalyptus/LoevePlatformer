local world = require "world"
local level = require "level"

local pos
local w

function love.load(arg)
    pos = 100
    love.window.setMode(600, 400, {resizable=true, vsync=false, minwidth=400, minheight=300, msaa=4})

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

    if (love.keyboard.isDown("right")) then
        pos = pos + dt * 500
    end
    if (love.keyboard.isDown("left")) then
        pos = pos - dt * 500
    end
end

function love.draw()
    love.graphics.polygon("fill", w.player.body:getWorldPoints(w.player.shape:getPoints()))
    for i = 1, #(w.ground) do
        love.graphics.polygon("fill", w.ground[i].body:getWorldPoints(w.ground[i].shape:getPoints()))
    end
    love.graphics.print("Hello World", 400, 300)
end
