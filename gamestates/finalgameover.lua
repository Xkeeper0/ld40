local FinalGameOver	= {}


function FinalGameOver:enter()

end


function FinalGameOver:draw()
	love.graphics.setFont(fonts.big)
	love.graphics.printf("what", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.normal)
	love.graphics.printf("did you seriously wait that long just to fail the final question?????????\n\nno. you have to be cheating.\n\nget out.", 0, 300, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Press any key to quit", 0, 500, screenMode.width, "center")
end

function FinalGameOver:keypressed(key, code)
	love.event.quit()
end

return FinalGameOver
