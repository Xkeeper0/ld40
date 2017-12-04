-- Decisions, a LD40 game that won't be finished in time as usual


-- Gamestate manager
Gamestate	= require "hump.gamestate"

-- Questions for our game.
Questions	= require "questions"

gamestates	= {}
gamestates.Title	= require "gamestates.title"
gamestates.Tutorial	= nil
gamestates.Game		= require "gamestates.game"

-- Register the gamestate events
Gamestate.switch(gamestates.Title)
Gamestate.registerEvents()
