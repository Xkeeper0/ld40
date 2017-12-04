local FinalIntro	= {}


function FinalIntro:enter()

end


function FinalIntro:draw()
	love.graphics.setFont(fonts.big)
	love.graphics.printf("The Edge of Forever", 0, 100, screenMode.width, "center")
	love.graphics.setFont(fonts.normal)
	love.graphics.printf("This is where the final question would go, but...\nit isn't ready yet.", 0, 300, screenMode.width, "center")
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Press any key to quit", 0, 500, screenMode.width, "center")
end

function FinalIntro:keypressed(key, code)
	love.event.quit()
end

return FinalIntro
