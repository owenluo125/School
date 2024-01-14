reset:

if score > highscore
	highscore = score
endif

lastscore = score

// just a cool reset subroutine that deletes everything and recreates everything, giving new values to all sprites and variables and stuff
for i = 1 to 194
	DeleteSprite(i)
next i

speed = 0
score = 0
counter = 0
startscreen = 0
skin = 0
invincibility = 0
flashcounter = 0
difficulty = 0 // 1 = easy 2 = insane
corner = 0 
secret = 0

gosub makeplayer
gosub makebullet
gosub enemysprites
gosub startscreentext

reset = 1

return
