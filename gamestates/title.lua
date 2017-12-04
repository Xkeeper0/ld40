local Title	= {}


function Title:enter()

end


function Title:draw()
	love.graphics.setFont(fonts.big)
	love.graphics.printf("Title screen", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Push enter to start", 0, 500, screenMode.width, "center")
end

function Title:keypressed(key, code)
    if key == 'return' then
        Gamestate.switch(gamestates.Tutorial)
    end
end

return Title
