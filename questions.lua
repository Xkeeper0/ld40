local Questions		= {}

-- 4 levels of questions
local actualQuestions	= { {}, {}, {}, {}, {} }

-- Simple helper function to avoid having to write {question = "xxx", answer1 = "..."}
-- over and over again
local function addQuestion(level, question, answer1, answer2)
	table.insert(actualQuestions[level], { question = question, answer1 = answer1, answer2 = answer2})
end

-- Level 1 questions
-- Simple and harmless fluff questions.
addQuestion(1, "test question 1", "yes", "no")
addQuestion(1, "test question 2", "yes", "no")
addQuestion(1, "test question 3", "yes", "no")
addQuestion(1, "test question 4", "yes", "no")
addQuestion(1, "test question 5", "yes", "no")

-- Level 2 questions
-- Slightly less "fluffy"

-- Level 3 questions
-- A little more serious in some way. Hard to explain. More psychological theoretical questions.

-- Level 4 questions
-- The final level, very psychological-type questions. Trolley-problem type moral bullshit.

-- Level 5 question
-- The only one (probably). Here for consistency.
addQuestion(5, "You can either win this game and doom someone else to lose it, or lose it and allow somebody else to win. What do you do?")




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
