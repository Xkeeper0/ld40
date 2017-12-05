local FinalGame	= {}

local level		= 5
local question	= 0
local time		= 5
local substate	= 0
local introTime	= 0
local choice	= nil
local dimColor	= 40

function FinalGame:enter(x, level, question)
	level		= level and level or 5
	question	= question and question or 0
	self:getQuestion(level)
	time		= 9999 * 2
	introTime	= 2
	substate	= 0
	choice		= nil
end

function FinalGame:update(dt)

	introTime	= introTime - dt
	if substate == 0 or substate == 2 then
		if introTime < 0 then
			substate	= substate + 1
			introTime	= 2
		end
	
	elseif substate == 1 then
		time		= time - dt
		if time < 0 then
			Gamestate.switch(gamestates.GameOver)
		end
	
	elseif substate == 3 then
		if introTime < 0 then
			if math.fmod(question, 6) == 0 then
				level	= level + 1
			end
			if level < 5 then
				Gamestate.switch(gamestates.Game, level, question)
			else
				Gamestate.switch(gamestates.FinalGameOver)
			end
		end

	end
end


function FinalGame:draw()


	if substate == 3 then
		love.graphics.translate(0, math.min(0, screenMode.height * (1 - (introTime / 2)) * - 1))
	elseif substate == 0 then
		love.graphics.translate(0, math.max(0, screenMode.height * ((introTime) / 2)))
	end

	love.graphics.setFont(fonts.tiny)
	love.graphics.printf("Final Question", 100, 20, screenMode.width - 200, "center")

	if (time < 1) then
		love.graphics.setColor(255, 0, 0)
	elseif (time < 3) then
		love.graphics.setColor(255, 255, 0)
	end
	love.graphics.setFont(fonts.big)
	love.graphics.printf(string.format("%d", math.ceil(time * .5)), 0, 475, screenMode.width, "center")
	love.graphics.setColor(255, 255, 255)

	love.graphics.setFont(fonts.normal)
	love.graphics.printf(q.question, 100, 100, screenMode.width - 200, "center")

	if substate == 0 then
		love.graphics.setColor(dimColor, dimColor, dimColor)
		love.graphics.printf(q.answer1, 80, 300, 250, "center")
		love.graphics.printf(q.answer2, 500, 300, 200, "center")
	elseif substate == 1 then
		love.graphics.setColor(150, 150, 150)
		love.graphics.printf(q.answer1, 80, 300, 250, "center")
		love.graphics.printf(q.answer2, 500, 300, 200, "center")
		love.graphics.setFont(fonts.small)
		love.graphics.printf("Press LEFT or RIGHT to choose", 0, 550, screenMode.width, "center")
	elseif substate >= 2 then
		if choice == 1 then
			love.graphics.setColor(255, 255, 255)
			love.graphics.printf(q.answer1, 80, 300, 250, "center")
			love.graphics.setColor(dimColor, dimColor, dimColor)
			love.graphics.printf(q.answer2, 500, 300, 200, "center")

		elseif choice == 2 then
			love.graphics.setColor(255, 255, 255)
			love.graphics.printf(q.answer2, 500, 300, 200, "center")
			love.graphics.setColor(dimColor, dimColor, dimColor)
			love.graphics.printf(q.answer1, 80, 300, 250, "center")

		end
	end

	love.graphics.setColor(255, 255, 255)

end


function FinalGame:getQuestion(level)
	q			= Questions.getQuestion(level)
	question	= question + 1
end


function FinalGame:keypressed(key, code)

	if substate == 1 and (key == 'left' or key == 'right') then
		substate	= 2
		introTime	= .5
		choice		= key == 'left' and 1 or 2
	end

end

return FinalGame
