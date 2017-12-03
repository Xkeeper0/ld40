-- Decisions, a LD40 game that won't be finished in time as usual


-- Gamestate manager
Gamestate	= require "hump.gamestate"

-- Questions for our game.
Questions	= require "questions"
q			= Questions.getQuestion(1)

function love.load(arg)
	-- Set the random seed so we don't get the same thing
	-- over and over
	love.math.setRandomSeed(love.timer.getTime())
end

function love.draw()
	love.graphics.print("Hello world", 400, 300)
	love.graphics.print(q.question, 300, 320)
	love.graphics.print(q.answer1, 300, 340)
	love.graphics.print(q.answer2, 300, 360)
end


function love.keypressed(key, scancode, isrepeat)
	q			= Questions.getQuestion(1)
end
