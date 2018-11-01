-----------------------------------------------------------------------------------------
-- Title: Whack A mole
-- Created by: Liam H
-- Course: ICS2O/3c
-- this program places a random object on the screen. If the user click on it in time,
-- the score increases by 1.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- creating the background
	display.setDefault("background", 255/255, 60/255, 12/255)
	

-- creating mole
local mole = display.newImage( "Images/mole.png", 0, 0)

	-- setting position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	-- scale the mole to be a third of its original size
	mole:scale(0.3, 0.3)

	-- making the mole invisible
	mole.isVisible = false 

-- making a points system
local points = 0
local pointsText = display.newText( "Points 1" .. points, 100, 25, nil, 50)


-----------------------------------Functions---------------------------


-- this function that makes the mole appear in a random (x,y) position on the screen
-- before calling the hide function

function PopUp()

	-- choosing random position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )

	mole.isVisible = true

	--timer.performWithDelay( 500, PopUp )
end

-- this function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp)
end

-- this function makes the mole invisible and then calls the PopUpDelay function
function Hide( )

	--changing visibility
	mole.isVisible = false
	PopUpDelay()
end

-- this function starts the game
function GameStart( )
	PopUpDelay()
end

-- this function increments the score only if the mole is clicked. It then displays
-- the new score.
function Whacked( event )

	-- if touch phase just started
	if (event.phase == "began") then
		points = points + 1
		local pointsText = display.newText( "Points " .. points, 100, 25, nil, 50)
	end
end

---------------------------------------------------Event Listeners-----------------------------------
-- I add the event listener to the moles so that if the mole is touched, trhe whacked function
-- is called
mole:addEventListener( "touch", Whacked )

------------------------------start the game-----------------------------
GameStart()