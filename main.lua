-- Decisions, a LD40 game that won't be finished in time as usual


-- Gamestate manager
Gamestate	= require "hump.gamestate"

-- Questions for our game.
Questions	= require "questions"

gamestates	= {}
gamestates.Title	= require "gamestates.title"
gamestates.Tutorial	= require "gamestates.tutorial"
gamestates.Game		= require "gamestates.game"

function love.load(arg)
	-- Register the gamestate events
	Gamestate.switch(gamestates.Title)
	Gamestate.registerEvents()

	fonts			= {}
	fonts.big		= love.graphics.newFont(60)
	fonts.normal	= love.graphics.newFont(30)
	fonts.small		= love.graphics.newFont(20)
	fonts.tiny		= love.graphics.newFont(15)

	screenMode		= {}
	screenMode.width, screenMode.height, screenMode.flags	= love.window.getMode()

end
