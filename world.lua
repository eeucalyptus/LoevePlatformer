local world = {isInitialized = false}

function world.generate(level)
    world.LoveWorld = love.physics.newWorld(0, 200, true)

    player = {}
    world.player = player

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

return world
