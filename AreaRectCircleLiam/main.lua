-----------------------------------------------------------------------------------------
--Title: Local Variables 
--Name: Liam Holtzhauer
--Course: ICS20
--This program displays a rectangle and shows it area
-- main.lua
-----------------------------------------------------------------------------------------

-- create my local variables
local areaText 
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local textObject
-- set the background colour of my screen. Remember that colours are between 0 and 1
display.setDefault("background", 54/255, 120/255, 190/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height across the screen size
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

-- set the colour of the rectangle
myRectangle:setFillColor(0.7, 0.1, 0.3)

-- set the colour of the border
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. take into consideration the size of the font
textObject = display.newText("The area of this rectangle with a width of \n" ..
	   widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	   areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
textObject.anchorX = 0
textObject.anchorY = 0
textObject.x = 20
textObject.y = display.contentHeight/2

-- set the colour of the newText
textObject:setTextColor (250/255, 10/266, 50/255)

local backgroundSound = audio.loadSound( "Sounds/background.mp3")
local backgroundSoundChannel
backgroundSoundChannel = audio.play(backgroundSound)