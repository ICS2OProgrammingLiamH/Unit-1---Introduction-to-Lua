-----------------------------------------------------------------------------------------
--Title: TouchAndDrag
-- Name: Liam H
--Course: ICS20
-- This program displays imaes that react to a person's finger.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables.
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.starWidth
local starHeight = star.height 

local planet = display.newImageRect("Images/planet.png",150,150)
local planetWidth = star.width 
local planetHeight = planet.height

-- my boolean variables to keep track od which I touched first
local alreadyTouchedStar = false
local alreadyTouchedPlanet = false

--set the initial x and y positions of myImage
star.x = 400
star.y = 500

planet.x = 300
planet.y = 200

-- Function: StarListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function PlanetListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedStar == false)then
			alreadyTouchedPlanet = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPlanet == true)) then
		planet.x = touch.x
		planet.y = touch.y
	end

	if (touch.phase =="ended") then
	alreadytouchedStar = false
	alreadyTouchedPlanet = false
end
end

-- add the respective listeners to each object
planet:addEventListener("touch", PlanetListener)

local function StarListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPlanet == false)then
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true)) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase =="ended") then
	alreadytouchedStar = false
	alreadyTouchedPlanet = false
end
end

-- add the respective listeners to each object
star:addEventListener("touch", StarListener)