-----------------------------------------------------------------------------------------
-- Title: Numeric Textfield
-- Name: Liam H
-- Course: ICS2O
--This program displays a math question and asks the user to answer in a numkeric tectfield
-- terminal.
-----------------------------------------------------------------------------------------

-- hie the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 50/255, 50/255, 10/255)

-----------------------------------------------------------
--Local variables
-----------------------------------------------------------

local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local incorrectAnswer

local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local gameOver

local lives = 4
local heart1
local heart2
local heart3
local heart4
local points = 0
local textObject
local pointsText

----------------------------------------------------------------------
--SOUNDS
----------------------------------------------------------------------

local wrongSound
local wrongSoundChannel
local correctSound
local correctSoundChannel
wrongSound = audio.loadSound( "Sounds/wrongSound.mp3")
correctSound = audio.loadSound( "Sounds/correctSound.mp3")

-----------------------------------------------------
-- local functions
-----------------------------------------------------


local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10,20)
	randomNumber2 = math.random(10,20)
	randomOperator = math.random(1,3)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
 
   elseif (randomOperator == 2) then
   		correctAnswer = randomNumber1 - randomNumber2

   		-- create question in text object
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

    elseif (randomOperator == 3) then
    	correctAnswer = randomNumber1 * randomNumber2
    	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "


    end
    
    
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function DecreaseLives()
	if (lives == 4) then
		heart4.isVisible = true
		heart3.isVisible = true
		heart2.isVisible = true
		heart1.isVisible = true
		AskQuestion()
			
	elseif (lives == 3) then
		heart4.isVisible = false
		heart3.isVisible = true
		heart2.isVisible = true
		heart1.isVisible = true
		AskQuestion()

	elseif (lives == 2) then
		heart4.isVisible = false
		heart3.isVisible = false
		heart2.isVisible = true
		heart1.isVisible = true
		AskQuestion()

	elseif (lives == 1) then
		heart4.isVisible = false
		heart3.isVisible = false
		heart2.isVisible = false
		heart1.isVisible = true
		AskQuestion()
	

	elseif (lives == 0) then
		heart4.isVisible = false
		heart3.isVisible = false
		heart2.isVisible = false
		heart1.isVisible = false
		gameOver.isVisible = true
        gameOver.x = display.contentWidth/2
        gameOver.y = display.contentHeight/2
        numericField.isVisible = false
        AskQuestion()
	end
end


local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then
		event.target.text = ""

		-- clear text field
		

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			event.target.text = ""
			correctSoundChannel = audio.play(correctSound)
			points = points + 1 
			pointsText.text = " Points = " .. points
			

		-- if they get the answer wrong
		else 
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideIncorrect)
			event.target.text = ""
			wrongSoundChannel = audio.play(wrongSound)
			lives = lives - 1

			DecreaseLives()



		end
	end
end



local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--displah the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		DecreaseLives()
	end
end



local function StartTimer()
	-- create countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end




	








-----------------------------------------------------------------------------
-- Object creation
-----------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2,nil,50)
questionObject:setTextColor(1/255, 1/255, 1/255)

--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2,  display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(1/255, 1/255, 1/255)
correctObject.isVisible = false


-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the points text
pointsText = display.newText( "Points " .. points, 100, 25, nil, 50)

-- display the text for timer
clockText = display.newText( "Seconds left " .. totalSeconds, 200, 75, nil, 50)


incorrectObject = display.newText( "Incorrect!", display.contentWidth/2,  display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(50/255, 60/255, 70/255)
incorrectObject.isVisible = false

gameOver = display.newImageRect( "Images/gameOver.png", display.contentWidth, display.contentHeight )
gameOver.isVisible = false

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7


heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7



--------------------------------------------------------------------
--Call the functions
--------------------------------------------------------------------


AskQuestion()
HideIncorrect()
UpdateTime()
StartTimer()