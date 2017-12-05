local Title	= {}


function Title:enter()

end


function Title:draw()
	love.graphics.setFont(fonts.big)
	love.graphics.printf("Decisions", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Press enter to start", 0, 500, screenMode.width, "center")
	love.graphics.setFont(fonts.tiny)
	love.graphics.printf("A LD40 jam game", 0, 200, screenMode.width, "center")
end

function Title:keypressed(key, code)
	if key == 'return' then
		Gamestate.switch(gamestates.FinalIntro)
	end
end

return Title
