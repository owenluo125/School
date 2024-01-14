collision:

// check for collision between bullets and player
for i = 1 to 192
	if invincibility = 0
		if GetSpriteCollision(1,i+2)
			lives = lives - 1
			invincibility = 50
			flashcounter = 50
		endif
	endif
next i

// if invincibility is not equal to 0 reduce it by 1
if not invincibility = 0
	invincibility = invincibility - 1
endif

// flash counter that will make the player flash every 5 frames for 50 frames to show it is invincible
if not flashcounter = 0
	if mod(flashcounter,10) = 0
		SetSpriteVisible(1,0)
		flashcounter = flashcounter - 1
	else
		SetSpriteVisible(1,1)
		flashcounter = flashcounter - 1
	endif
endif

return
