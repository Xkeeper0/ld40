local Game	= {}

local level		= 1
local question	= 0
local time		= 5

function Game:enter(level, question)
	question	= question and question or 0
	self:getQuestion(level)
	time		= level == 5 and 9999 or 5
end

function Game:update(dt)
	time		= time - dt
	if time < 0 then
		Gamestate.switch(gamestates.GameOver)
	end
end

function Game:draw()

	love.graphics.setFont(fonts.big)
	love.graphics.printf(string.format("%.2f", time), 0, 50, screenMode.width, "center")
	love.graphics.setFont(fonts.normal)
	love.graphics.printf(q.question, 100, 150, screenMode.width - 200, "center")
	love.graphics.printf(q.answer1, 100, 300, 200, "center")
	love.graphics.printf(q.answer2, 500, 300, 200, "center")

	love.graphics.setFont(fonts.small)
	love.graphics.printf("Push LEFT or RIGHT to choose", 0, 550, screenMode.width, "center")
	love.graphics.print(question, 20, 20)


end

function Game:getQuestion(level)
	q			= Questions.getQuestion(1)
	question	= question + 1
end

function Game:keypressed(key, code)
    if key == 'space' or key == 'left' or key == 'right' then
		-- self:getQuestion(level)
		Gamestate.switch(gamestates.Game, level, question)
    end
end

return Game
