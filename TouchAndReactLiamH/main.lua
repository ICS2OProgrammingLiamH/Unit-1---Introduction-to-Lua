-----------------------------------------------------------------------------------------
-- Title: Buttons in Lua
-- Name: Ms Raffin
-- Course: ICS20
-----------------------------------------------------------------------------------------

-- Set the background colour
display.setDefault ("background", 250/255, 50/255, 0/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked", 0, 0,nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make text appear with the red button,
-- and make the blue button disapear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisble = false
		redButton.isVisible = true
		textObject.isVisible = true
		moneySoundChannel = audio.play(moneySound)

	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisble = true
		redButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

local checkMark = display.newImageRect("Images/checkmark.png",198, 96)
checkMark.x = display.contentWidth/3
checkMark.y = display.contentHeight/3
checkMark.isVisible = false

local moneySound = audio.loadSound( "Sounds/chaChing.mp3")
local moneySoundChannel


local moneySound = audio.loadSound( "Sounds/chaChing.mp3")
local moneySoundChannel