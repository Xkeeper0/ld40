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
addQuestion(1, "Favorite kind of pet?", "Cats", "Dogs")
addQuestion(1, "Which is the better flavor?", "Chocolate", "Vanilla")
addQuestion(1, "Does pineapple go on pizza?", "Yes", "No")
addQuestion(1, "Do you prefer listening or reading?", "Listening", "Reading")
addQuestion(1, "Are sunny days or rainy days the best?", "Sunny", "Rainy")
addQuestion(1, "Which do you listen to most?", "TV", "Radio")
addQuestion(1, "Which one do you use more often?", "Twitter", "Facebook")
addQuestion(1, "Do you enjoy taking walks?", "Yes", "No")
addQuestion(1, "Favorite time of day?", "Noon", "Midnight")
addQuestion(1, "Which would you rather enjoy?", "Books", "Movies")
addQuestion(1, "What's the best light level?", "Bright", "Dim")
addQuestion(1, "Best kind of music?", "Relaxing", "Intense")
addQuestion(1, "Preferred beverage?", "Water", "Soda")
addQuestion(1, "Like cartoons?", "Yep", "Nope")

-- Level 2 questions
-- Slightly less "fluffy" - some psychoanalys type questions, but nothing too deep
addQuestion(2, "What option have you been picking most?", "Left", "Right")
addQuestion(2, "Is this your first time through this game?", "Yes", "No")
addQuestion(2, "Would you rather have lots of good friends,\nor a few great friend?", "Many good\nfriends", "A few great\nfriends")
addQuestion(2, "Have you answered any of these questions randomly?", "Yes", "No")
addQuestion(2, "Are you happy with your line of work?", "Yes", "No")
addQuestion(2, "Do you have nightmares often?", "Yeah", "Nah")
addQuestion(2, "Are you more of a dreamer or a realist?", "Dreamer", "Realist")
addQuestion(2, "Are you reading every question?", "Yes", "No")
addQuestion(2, "Have you played any other LD40 games?", "Yes", "No")
addQuestion(2, "Do you have enough time to think about your answers?", "Yes", "No")
addQuestion(2, "Do you think this game is fun, so far?", "Yes", "No")
addQuestion(2, "Is making decisions difficult for you?", "Very", "Not at all")

-- Level 3 questions
-- A little more serious in some way -- self-introspective.
addQuestion(3, "Do you prefer to be alone or be with others?", "Be alone", "With others")
addQuestion(3, "Are you more of an introvert or an extrovert?", "Introvert", "Extrovert")
addQuestion(3, "Do you have a lot of friends?", "Yes", "No")
addQuestion(3, "Do you go out of your way to help people?", "Yes", "No")
addQuestion(3, "Have you ever donated to a charity?", "Yes", "No")
addQuestion(3, "Are you non-binary?", "Yes", "No")
addQuestion(3, "Do you find yourself attractive?", "Yes", "No")
addQuestion(3, "Do you get enough sleep?", "Yes", "No")
addQuestion(3, "Have you talked with your family recently?", "Yes", "No")
addQuestion(3, "Do you favor harsher punishments, or forgiveness?", "Punishment", "Forgiveness")
addQuestion(3, "Have you even been the leader of something?", "Yes", "No")
addQuestion(3, "Would you rather be with family or friends?", "Family", "Friends")

-- Level 4 questions
-- The final level, very psychological-type questions and harsher self-commentary.
addQuestion(4, "Do you lie often?", "Yes", "No")
addQuestion(4, "Have you ever thought about what comes after life?", "Yes", "No")
addQuestion(4, "Do you think you are a good person?", "Yes", "No")
addQuestion(4, "Are you happy with your life?", "Yes", "No")
addQuestion(4, "Do you hate yourself?", "Yes", "No")
addQuestion(4, "Do you worry about what other people think of you?", "Yes", "No")
addQuestion(4, "Would you ever give your life to save someone else?", "Yes", "No")


-- Level 5 question
-- The only one (probably). Here for consistency.
addQuestion(5, "What will you do?", "Make them lose", "Let them win")




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
