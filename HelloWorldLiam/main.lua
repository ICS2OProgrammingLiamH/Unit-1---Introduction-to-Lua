-----------------------------------------------------------------------------------------
--Name:Liam Holtzhauer
-- main.lua
--Course: ICS20/3c
--This program display Hello, World on the iPad simulator and "Hellloooo" to the command 
--Terminal.
-----------------------------------------------------------------------------------------

-- printe "Hello, World" to te command terminal
print ("***Hellooooooooooooooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 60/255, 12/255)

-- create a local variable
local textObject

--displays text on the scree at position x=500 and y=500 with a default font style and font size of 50
textObject = display.newText( "Hello, Liam!", 400, 400, nil, 50)

--sets the colour of the text
textObject:setTextColor ( 100/255, 200/255, 69/255)

textObject = display.newText( "GoodBye, Liam!", 500, 500, nil, 50)
textObject: setTextColor (79/255, 160/255, 152/255)

local backgroundSound = audio.loadSound( "Sounds/background.mp3")
local backgroundSoundChannel
backgroundSoundChannel = audio.play(backgroundSound)