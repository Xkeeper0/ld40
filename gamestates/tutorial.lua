local Tutorial	= {}


function Tutorial:enter()

end


function Tutorial:draw()
	love.graphics.print("Tutorial", 100, 100)
	love.graphics.print("In this game, you will be given a question to answer.\nUse the LEFT and RIGHT arrow keys to choose an answer.\nThink carefully, but quickly: you have limited time.\n\nPress enter to continue.", 100, 120)
end

function Tutorial:keypressed(key, code)
    if key == 'return' then
        Gamestate.switch(gamestates.Game)
    end
end

return Tutorial
