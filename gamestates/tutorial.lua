local Tutorial	= {}


function Tutorial:enter()

end


function Tutorial:draw()
	love.graphics.setFont(fonts.big)
	love.graphics.printf("Instructions", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("In this game, you will be given several questions to answer.\nUse the LEFT and RIGHT arrow keys to choose an answer.\nThink carefully, but quickly: you have limited time.", 100, 300, 600, "center")
	love.graphics.printf("Press enter to continue", 0, 500, screenMode.width, "center")
end

function Tutorial:keypressed(key, code)
	if key == 'return' then
		Gamestate.switch(gamestates.Game)
	end
end

return Tutorial
