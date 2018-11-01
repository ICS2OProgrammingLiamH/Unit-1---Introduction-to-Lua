-----------------------------------------------------------------------------------------
-- Title: Interacting Objects 2
-- Name : Liam H
-- Course ICS2O
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics 
physics.start()

------------------------------------
-- objects
------------------------------------
-- ground
local ground = display.newImage("Images/ground.png", 0, 0)

-- put the ground at the middle screen width


-- then put is at the middle of the screen height

-- change the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-------------------------------------------------------

-- display the image of the beam
local beam = display.newImage("Images/beam_long.png", 0, 0)

-- set the x and y pos
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

--set the beam width to be half of the iPad width


-- set the beam height to be 1/10th of the ipad height


-- rotate the beam -60 degrees so its on an angle
beam:rotate(45)

-- send it to the back layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

-- set the x and y pos
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

-- set the width of the bkg image ti be the width of the ipad
-- set the height to be the height of the iPad

-- send to back
bkg:toBack()

--------------------------------------------
-- functions
--------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

-------------------------------------------

local function secondBall()
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})
	ball2:scale(1, 0, 0)
end

-----------------------------------------------------------------
-- timer delays - call each function after the given millisecond
-----------------------------------------------------------------
timer.performWithDelay( 0, firstball)
timer.performWithDelay( 500, secondBall)


