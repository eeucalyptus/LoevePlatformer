local menu = require "menu"
local pos

function love.load(arg)
    menu.init_menu()

    pos = 100
    love.window.setMode(600, 400, {resizable=true, vsync=false, minwidth=400, minheight=300, msaa=4})
end

function love.update(dt)
    menu.update_menu(dt)

    if (love.keyboard.isDown("right")) then
        pos = pos + dt * 500
    end
    if (love.keyboard.isDown("left")) then
        pos = pos - dt * 500
    end
end

function love.draw()
    menu.draw_menu()
end

function love.keypressed(key)
    menu.keyPressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
