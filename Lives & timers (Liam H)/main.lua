-- variables for the timer
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 4
local heart1
local heart2
local heart3
local heart4

--*** Add local variable for: incorrect object, points

------------------------------
-- local functions
------------------------------

local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--displah the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		--*** if there are no lives left play a lose sound, show a lose image
		-- and cancel the timer, remove the fourth heart by making it invisible
		if (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		elseif (lives == 3) then
			heart3.isVisble = false
		elseif (lives == 4) then
			heart4.isVisible = false
		end

			--*** call the function to ask a new question

	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end


--------------------------------
-- object creation
--------------------------------

-- create the lives to display on the screen

heart1 = display.newImageRect("Image/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7