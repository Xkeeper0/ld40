local Title	= {}


function Title:enter()

end


function Title:draw()
	love.graphics.print("Title screen", 100, 100)
	love.graphics.print("Push enter to start", 100, 120)
end

function Title:keypressed(key, code)
    if key == 'return' then
        Gamestate.switch(gamestates.Game)
    end
end

return Title
