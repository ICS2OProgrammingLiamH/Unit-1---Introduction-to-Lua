-- Title: MovingImages
-- Name: Liam H
-- Course: ICS2O/3C
-- This program moves and object across the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variablea
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 1

-- set the initial x and y position of beetleship
beetleship.x = 1
beetleship.y = display.contentHeight/3

-- function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.001
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

local rocketship = display.newImageRect("Images/rocketship.png", 400, 400)
rocketship.alpha = 1 
rocketship.x = 1
rocketship.y = display.contentHeight/3
rocketship.alpha = rocketship.alpha 
