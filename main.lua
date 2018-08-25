local pos

function love.load(arg)
    pos = 100
    love.window.setMode(600, 400, {resizable=true, vsync=false, minwidth=400, minheight=300, msaa=4})
end

function love.update(dt)
    if (love.keyboard.isDown("right")) then
        pos = pos + dt * 500
    end
    if (love.keyboard.isDown("left")) then
        pos = pos - dt * 500
    end
end

function love.draw()
    love.graphics.circle("fill", pos, 100, 50, 64)
    love.graphics.print("Hello World", 400, 300)
end
