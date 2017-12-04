local Game	= {}

local level		= 1
local question	= 0
local time		= 5
local substate	= 0
local introTime	= 0
local choice	= nil
local dimColor	= 40

function Game:enter(x, level, question)
	level		= level and level or 1
	question	= question and question or 0
	self:getQuestion(level)
	time		= level == 5 and 9999 or 5
	introTime	= .25
	substate	= 0
	choice		= nil
end

function Game:update(dt)

	introTime	= introTime - dt
	if substate == 0 or substate == 2 then
		if introTime < 0 then
			substate	= substate + 1
			introTime	= .25
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
				Gamestate.switch(gamestates.FinalIntro)
			end
		end

	end
end


function Game:draw()

	love.graphics.setFont(fonts.tiny)
	love.graphics.printf(string.format("%d of 25", question), 100, 20, screenMode.width - 200, "center")

	if substate == 3 then
		-- love.graphics.setColor(0, 0, 0)
		-- love.graphics.rectangle("fill", 0, 0, screenMode.width, screenMode.height * (1 - (introTime / .25)))
		love.graphics.translate(0, math.min(0, screenMode.height * (1 - (introTime / .25)) * - 1))
	end

	if substate == 0 then
		-- love.graphics.setColor(0, 0, 0)
		-- love.graphics.rectangle("fill", 0, 0, screenMode.width, screenMode.height * (1 - (introTime / .25)))
		love.graphics.translate(0, math.max(0, screenMode.height * ((introTime) / .25)))
	end

	if (time < 1) then
		love.graphics.setColor(255, 0, 0)
	elseif (time < 3) then
		love.graphics.setColor(255, 255, 0)
	end
	love.graphics.setFont(fonts.big)
	love.graphics.printf(string.format("%.2f", time), 0, 475, screenMode.width, "center")
	love.graphics.setColor(255, 255, 255)

	love.graphics.setFont(fonts.normal)
	love.graphics.printf(q.question, 100, 100, screenMode.width - 200, "center")

	--if substate > 0 then
		if substate == 0 then
			love.graphics.setColor(dimColor, dimColor, dimColor)
			love.graphics.printf(q.answer1, 100, 300, 200, "center")
			love.graphics.printf(q.answer2, 500, 300, 200, "center")
		elseif substate == 1 then
			love.graphics.setColor(150, 150, 150)
			love.graphics.printf(q.answer1, 100, 300, 200, "center")
			love.graphics.printf(q.answer2, 500, 300, 200, "center")
			love.graphics.setFont(fonts.small)
			love.graphics.printf("Press LEFT or RIGHT to choose", 0, 550, screenMode.width, "center")
		elseif substate >= 2 then
			if choice == 1 then
				love.graphics.setColor(255, 255, 255)
				love.graphics.printf(q.answer1, 100, 300, 200, "center")
				love.graphics.setColor(dimColor, dimColor, dimColor)
				love.graphics.printf(q.answer2, 500, 300, 200, "center")

			elseif choice == 2 then
				love.graphics.setColor(255, 255, 255)
				love.graphics.printf(q.answer2, 500, 300, 200, "center")
				love.graphics.setColor(dimColor, dimColor, dimColor)
				love.graphics.printf(q.answer1, 100, 300, 200, "center")

			end
		end
	--end

	love.graphics.setColor(255, 255, 255)

end


function Game:getQuestion(level)
	q			= Questions.getQuestion(level)
	question	= question + 1
end


function Game:keypressed(key, code)

	if substate == 1 and (key == 'left' or key == 'right') then
		substate	= 2
		introTime	= .5
		choice		= key == 'left' and 1 or 2
	end

end

return Game
