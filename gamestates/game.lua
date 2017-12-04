local Game	= {}

local level		= 1
local question	= 0

function Game:enter(level)
	self:getQuestion(level)
end


function Game:draw()
	love.graphics.print(q.question, 300, 320)
	love.graphics.print(q.answer1, 300, 340)
	love.graphics.print(q.answer2, 300, 360)
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
