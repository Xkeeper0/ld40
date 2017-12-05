local FinalIntro	= {}

local substate	= 1
local stateTime	= 0

local stateTimers	= { 0.25, 2.72, 2, 1, 4, 2, 6, 3, .25, 9999 }

function FinalIntro:enter()
	substate	= 1
	stateTime	= .25
end


function FinalIntro:update(dt)
	stateTime	= stateTime - dt
	if stateTimers[substate] then
		if stateTime < 0 then
			substate	= substate + 1
			stateTime	= stateTimers[substate]
		end
	end

	if substate	== 10 then
		Gamestate.switch(gamestates.GameOver)
	end
end


function FinalIntro:draw()

	if substate == 10 then
		return
	end

	love.graphics.print(string.format("%d , %.2f", substate, stateTime), 10, 10)

	if substate == 1 then
		love.graphics.translate(0, math.max(0, screenMode.height * ((stateTime) / .25)))
	elseif substate == 9 then
		love.graphics.translate(0, math.min(0, screenMode.height * (1 - (stateTime / .25)) * - 1))
	end

	love.graphics.setFont(fonts.big)
	love.graphics.printf("Final Question", 0, 100, screenMode.width, "center")

	local message	= ""
	if substate == 2 then
		message		= "Connecting to server..."
	elseif substate == 3 then
		message		= "Finding partner..."
	elseif substate >= 4 then
		message		= "Partner found."
	end

	love.graphics.setFont(fonts.tiny)
	love.graphics.printf(message, 0, 170, screenMode.width, "center")
	
	love.graphics.setFont(fonts.small)
	if substate	>= 5 then
		love.graphics.printf("You have been assigned a partner.\nYour responses have earned you the right to choose your endings.", 0, 200, screenMode.width, "center")
	end
	if substate >= 6 then
		love.graphics.printf("However...", 0, 270, screenMode.width, "center")
	end
	if substate >= 7 then
		love.graphics.printf("Only one of you can win.\n\nIf you chose to win, the other player loses.\nIf you choose to lose, the other player wins.", 0, 320, screenMode.width, "center")
	end

	if substate >= 8 then
		love.graphics.setFont(fonts.big)
		love.graphics.printf(string.format("%d", math.ceil(substate == 8 and stateTime or 0)), 0, 500, screenMode.width, "center")
	end

end

function FinalIntro:keypressed(key, code)
	love.event.quit()
end

return FinalIntro
