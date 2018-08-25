local world = {}

function world.generate(level)
    w = {}

    w.LoveWorld = love.physics.newWorld(0, 200, true)

    player = {}
    w.player = player

    player.body = love.physics.newBody(w.LoveWorld, 64, 64, "dynamic")
    player.shape = love.physics.newRectangleShape(64, 64)
    player.fixture = love.physics.newFixture(player.body, player.shape)


    enemies = {}
    w.enemies = enemies

    ground = {}
    w.ground = ground
    for y = 1, #level do
        line = level[y]
        for x = 1, #line do
            if(line[x] == 'G') then
                groundTile = {}
                groundTile.body = love.physics.newBody(w.LoveWorld, (x)*64, (y)*64, "static")
                groundTile.shape = love.physics.newRectangleShape(64, 64)
                groundTile.fixture = love.physics.newFixture(groundTile.body, groundTile.shape)

                ground[#ground+1] = groundTile
            end
        end
    end

    return w
end

return world
