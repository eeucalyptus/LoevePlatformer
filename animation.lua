local animation = {}

function animation.newAnimation(image, width, height, duration, scale)
    local spriteAnimation = {}
    spriteAnimation.spriteSheet = image
    spriteAnimation.scale = scale
    spriteAnimation.quads = {}
    
    print(image:getHeight())
    print(image:getWidth())
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(spriteAnimation.quads, love.graphics.newQuad(x, y, width, height, image:getWidth(), image:getHeight()))
        end
    end
    
    spriteAnimation.duration = duration or 1
    spriteAnimation.currentTime = 0

    return spriteAnimation
end

function animation.update_animation(dt, anim)
    anim.currentTime = anim.currentTime + dt
    if anim.currentTime >= anim.duration then
        anim.currentTime = anim.currentTime - anim.duration
    end
end

function animation.draw_animation(x, y, anim)
    local spriteNum = math.floor(anim.currentTime / anim.duration * #anim.quads) + 1
    love.graphics.draw(anim.spriteSheet, anim.quads[spriteNum], x, y, 0, anim.scale)
end

return animation
