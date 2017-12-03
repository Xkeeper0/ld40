local Questions		= {}

-- 4 levels of questions
local actualQuestions	= { {}, {}, {}, {} }

-- Simple helper function to avoid having to write {question = "xxx", answer1 = "..."}
-- over and over again
local function addQuestion(level, question, answer1, answer2)
	table.insert(actualQuestions[level], { question = question, answer1 = answer1, answer2 = answer2})
end

addQuestion(1, "test question 1", "yes", "no")
addQuestion(1, "test question 2", "yes", "no")
addQuestion(1, "test question 3", "yes", "no")
addQuestion(1, "test question 4", "yes", "no")
addQuestion(1, "test question 5", "yes", "no")

-- Get a random question for the selected level
function Questions.getQuestion(level)
	local count	= #actualQuestions[level]
	if count == 0 then
		-- Out of questions, oops
		return { question = "...no more questions", answer1 = "error", answer2 = "error" }
	end

	local r	= love.math.random(1, #actualQuestions[level])
	return table.remove(actualQuestions[level], r)
end

return Questions
