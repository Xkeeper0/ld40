local Game	= {}

local level		= 1
local question	= 0

function Game:enter(level)
	self:getQuestion(level)
end


function Game:draw()

	love.graphics.setFont(fonts.big)
	love.graphics.printf("0.00", 0, 50, screenMode.width, "center")
	love.graphics.setFont(fonts.normal)
	love.graphics.printf(q.question, 100, 150, screenMode.width - 200, "center")
	love.graphics.printf(q.answer1, 100, 300, 200, "center")
	love.graphics.printf(q.answer2, 500, 300, 200, "center")

	love.graphics.setFont(fonts.small)
	love.graphics.printf("Push LEFT or RIGHT to choose", 0, 550, screenMode.width, "center")


end

function Game:getQuestion(level)
	q			= Questions.getQuestion(1)
	question	= question + 1
end

function Game:keypressed(key, code)
    if key == 'space' then
		self:getQuestion(level)
    end
end

return Game
