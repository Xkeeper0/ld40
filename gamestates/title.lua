local Title	= {}


function Title:enter()

end


function Title:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.setFont(fonts.big)
	love.graphics.printf("Decisions", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Press enter to start", 0, 500, screenMode.width, "center")
	love.graphics.setFont(fonts.tiny)
	love.graphics.printf("A LD40 jam game", 0, 200, screenMode.width, "center")

	love.graphics.setColor(220, 140, 200)
	love.graphics.setFont(fonts.micro)
	love.graphics.printf("2017 Xkeeper\n@xkeepah, http://xkeeper.net", 620, 570, 150, "right")
	love.graphics.setColor(255, 255, 255)
end

function Title:keypressed(key, code)
	if key == 'return' then
		Gamestate.switch(gamestates.Tutorial, 4, 21)
	end
end

return Title
