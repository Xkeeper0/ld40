local GameOver	= {}


function GameOver:enter()

end


function GameOver:draw()
	love.graphics.setFont(fonts.big)
	love.graphics.printf("Game Over", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.normal)
	love.graphics.printf("You have to answer each question\nwithin the time limit.", 0, 300, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Push enter to quit", 0, 500, screenMode.width, "center")
end

function GameOver:keypressed(key, code)
    if key == 'return' then
        love.event.quit()
    end
end

return GameOver
