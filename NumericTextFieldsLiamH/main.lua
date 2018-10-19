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
display.setDefault("background", 200/255, 50/255, 10/255)


--Local variables

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local incorrectAnswer
-- local functions

local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10,20)
	randomNumber2 = math.random(10,20)
	randomOperator = math.random(1,4)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
 
   elseif (randomOperator == 2) then
   		correctAnswer = randomNumber1 - randomNumber2

   		-- create question in text object
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
    
    elseif (randomOperator == 3) then
    	correctAnswer = randomNumber1 / randomNumber2
    	questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "


    elseif (randomOperator == 4) then
    	correctAnswer = randomNumber1 * randomNumber2
    	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "


    end
    
    
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answe are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			event.target.text = ""

		end
	end
end

-- Object creation

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

-- Function calls

-- call the function to ask the question
AskQuestion()

correctObject = display.newText( "Incorrect!", display.contentWidth/2,  display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(50/255, 60/255, 70/255)
correctObject.isVisible = false




