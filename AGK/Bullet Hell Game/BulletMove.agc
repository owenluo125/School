movebulletstart:

// only start this when the shooting has started
if counter > 105
	// add 2 to the score
	score = score + 2
	// when to activate a bullet
	for i = 1 to x
		// if the counter for a bullet is 0 then activate the bullet
		if bulletcounter[i] = 0
			bulletactive[i] = 1
		endif
		// reduce the bulletcounter by 1 every frame
		bulletcounter[i] = bulletcounter[i] - 1
	next i
endif

return



movebullet:

// mpove each bullet
for i = 1 to x
	// only move it if it is active (refer to the loop beforethis)
	if bulletactive[i] = 1
		if not bulletmovement[i] = 98
			bulletxpos[i] = bulletxpos[i] + (bulletxdir[i] * bulletx[i])
			bulletypos[i] = bulletypos[i] - (bulletydir[i] * bullety[i])
			SetSpritePosition(i+2,bulletxpos[i],bulletypos[i])
			bulletmovement[i] = bulletmovement[i] + 1
		else
			if bulletflip[i] = 0
				bulletflip[i] = 1
			else
				bulletflip[i] = 0
			endif
			
			SetSpriteFlip(i+2,bulletflip[i],0)
			bulletxdir[i] = bulletxdir[i] * -1
			bulletydir[i] = bulletydir[i] * -1
			
			bulletxpos[i] = bulletxpos[i] + (bulletxdir[i] * bulletx[i])
			bulletypos[i] = bulletypos[i] - (bulletydir[i] * bullety[i])
			SetSpritePosition(i+2,bulletxpos[i],bulletypos[i])
			
			bulletmovement[i] = 1
		endif
	endif
next i


return
