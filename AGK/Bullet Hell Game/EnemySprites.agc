enemysprites:

// create sprites
CreateSprite(2,3)
SetSpriteSize(2,1920,1920)
SetSpritePosition(2,GetVirtualWidth()/2 - GetSpriteWidth(2)/2,GetVirtualHeight()/2 - GetSpriteHeight(2)/2)

// make animation
AddSpriteAnimationFrame(2, 4)
AddSpriteAnimationFrame(2, 5)
AddSpriteAnimationFrame(2, 6)
AddSpriteAnimationFrame(2, 7)
AddSpriteAnimationFrame(2, 8)
AddSpriteAnimationFrame(2, 9)
AddSpriteAnimationFrame(2, 10)


return



animateenemy:

//run the animation
if counter = 50
	PlaySprite(2, 1, 0, 1, 3) // windup
endif

if counter = 101
	PlaySprite(2, 10, 1, 4, 7) // spin
endif

counter = counter + 1

return
