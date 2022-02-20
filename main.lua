local gridWidth = 16
local gridHeight = 16

local cellWidth = 32
local cellHeight = 32

love.window.setMode(gridWidth * cellWidth, gridHeight * cellHeight)

local headX = 6 * cellWidth
local headY = 15 * cellHeight

local timer = 0
local timeStep = 1 / 8

local moveX = 0
local moveY = -1

local appleX = 4 * cellWidth
local appleY = 4 * cellHeight

local score = 0

local snake = {}
snake [1] = { x= headX , y= headY}

function MoveAppleToNewPosition()
    appleX = cellWidth * love.math.random(gridWidth - 1)
    appleY = cellHeight * love.math.random(gridHeight - 1)
end

function love.update(dt)
    timer = timer + dt

    if timer >= timeStep then
        -- Reset the timer
        timer = 0

        -- Move the snake
        headX = headX + moveX * cellWidth
        headY = headY + moveY * cellHeight

        table.insert(snake, 1,{ headX, headY})

        if headX == appleX and headY == appleY then
            score = score + 1
            MoveAppleToNewPosition()
        end
    end
end

function love.draw()
    -- Set the current drawing color
    love.graphics.setColor(0.85, 0.56, 0.74)
    -- Draw the snake
    for i = 1, #snake do
        
   
    love.graphics.rectangle("fill",snake[i].x, snake[i].y, headX, headY, cellWidth, cellHeight)
end

    -- Set color for the apple
    love.graphics.setColor(1, 0, 0)
    -- Draw the apple
    love.graphics.rectangle("fill", appleX, appleY, cellWidth, cellHeight)

    -- Set the color for the score
    love.graphics.setColor(0, 1, 0)
    -- Draw the score
    love.graphics.print(score, love.graphics.getWidth() / 2, 10, 0, 3)
end

function love.keypressed(key)
    if key == "up" then
        moveX = 0
        moveY = -1
    end

    if key == "right" then
        moveX = 1
        moveY = 0
    end

    if key == "down" then
        moveX = 0
        moveY = 1
    end

    if key == "left" then
        moveX = -1
        moveY = 0
    end
end