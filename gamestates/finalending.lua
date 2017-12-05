local FinalEnding	= {}
local time	= 0
local think	= 0

function FinalEnding:enter(previous, thunk)
	think	= thunk
	time	= 0
end

local function fade(start, stop)
	local v	= math.min(math.max((time - start)) / (stop), 1) * 255
	love.graphics.setColor(v, v, v)
end


function FinalEnding:update(dt)
	time		= time + dt
end


function FinalEnding:draw()

	love.graphics.setFont(fonts.big)
	fade(0, 1)
	love.graphics.printf("The Truth", 0, 100, screenMode.width, "center")

	love.graphics.setFont(fonts.tiny)

	fade(3, 1)
	love.graphics.printf("There never was a partner.", 0, 200, screenMode.width, "center")
	fade(6, 1)
	love.graphics.printf("The choices you made didn't matter.", 0, 220, screenMode.width, "center")
	fade(9, 1)
	love.graphics.printf("It was all conditioning to create an experience.", 0, 240, screenMode.width, "center")


	fade(15, 1)
	love.graphics.printf("By giving you so little time,\nyou didn't have time to think.", 0, 280, screenMode.width, "center")
	fade(18, 1)
	love.graphics.printf("Then at the end, I give you a choice,\nwith actual consequences.", 0, 320, screenMode.width, "center")
	fade(21, 1)
	love.graphics.printf("I wanted the sudden change to throw you off guard,\nto make you indecisive, unsure.", 0, 360, screenMode.width, "center")

	fade(27, 1)
	love.graphics.printf("This year's theme was 'the more you have, the worse it is'.", 0, 420, screenMode.width, "center")
	fade(30, 1)
	love.graphics.printf("In this case, it was time.", 0, 440, screenMode.width, "center")
	fade(33, 1)
	love.graphics.printf("Decisions are easier when you can't overthink them.", 0, 460, screenMode.width, "center")

	fade(40, 1)
	love.graphics.printf("Thank you for playing.", 0, 520, screenMode.width, "center")


	fade(42, 1)
	love.graphics.setFont(fonts.small)
	love.graphics.printf("Press any key to quit.", 0, 560, screenMode.width, "center")

end


function FinalEnding:keypressed(key, code)
	if time >= 42 then
		love.event.quit()
	end
end

return FinalEnding
