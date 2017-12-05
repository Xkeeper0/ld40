local FinalGameOver	= {}


function FinalGameOver:enter()

end


function FinalGameOver:draw()
	love.graphics.setFont(fonts.big)
	love.graphics.printf("The Only Winning Move", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.normal)
	love.graphics.printf("There is no ending (yet). Sorry.", 0, 300, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Press any key to quit", 0, 500, screenMode.width, "center")
end

function FinalGameOver:keypressed(key, code)
	love.event.quit()
end

return FinalGameOver
