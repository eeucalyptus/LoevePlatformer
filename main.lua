local world = require "world"
local level = require "level"
local menu = require "menu"
local animation = require "animation"

local levelfiles = {"level0.txt", "level1.txt"}

local inMenu = true

local oldHero = animation.newAnimation(love.graphics.newImage("assets/oldHero.png"), 16, 18, 1, 4)
local animations = {}

function love.load(arg)
    love.window.setMode(600, 400, {resizable=true, vsync=false, minwidth=400, minheight=300, msaa=4})

    menu.init_menu(world)
    world.generate(level.load(levelfiles[1]))
end

function love.update(dt)
    animation.update_animation(dt, oldHero)
    if inMenu then
        if menu.update_menu(dt) == true then
            inMenu = false
        end
    else
        if world.update(dt) == true then
            inMenu = true
        end
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
        
        x, y = world.player.body:getPosition()
        print(x)
        print(y)
        pos = {x, y}
        animation.draw_animation(x - 32, y - 32, oldHero)
    end
end

function love.keypressed(key)
    menu.keyPressed(key)
    world.keyPressed(key)

    if key == "escape" and inMenu == true then
        love.event.quit()
    end
end
