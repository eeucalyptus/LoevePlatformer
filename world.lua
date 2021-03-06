local world = {isInitialized = false}

local player = {}

local back_to_menu = false

world.player = player

function world.generate(level)
    world.LoveWorld = love.physics.newWorld(0, 200, true)

    player.body = love.physics.newBody(world.LoveWorld, 64, 64, "dynamic")
    player.shape = love.physics.newRectangleShape(64, 64)
    player.fixture = love.physics.newFixture(player.body, player.shape)


    enemies = {}
    world.enemies = enemies

    ground = {}
    world.ground = ground
    for y = 1, #level do
        line = level[y]
        for x = 1, #line do
            if(line[x] == 'G') then
                groundTile = {}
                groundTile.body = love.physics.newBody(world.LoveWorld, (x)*64, (y)*64, "static")
                groundTile.shape = love.physics.newRectangleShape(64, 64)
                groundTile.fixture = love.physics.newFixture(groundTile.body, groundTile.shape)

                ground[#ground+1] = groundTile
            end
        end
    end

    return w
end

function world.update(dt)
    world.LoveWorld:update(dt)

    if love.keyboard.isDown("right") then
        world.player.body:applyForce(1000, 0)
    elseif love.keyboard.isDown("left") then
        world.player.body:applyForce(-1000, 0)
    end
    
    if back_to_menu == true then
        back_to_menu = false
        return true
    end
    return false
end

function world.keyPressed(key)
    if key == "escape" then
        back_to_menu = true
    end 
end

return world
