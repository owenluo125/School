makebullet:

//declare these variables as integers and make them global
GLOBAL bulletx as integer [192]
GLOBAL bullety as integer [192]
GLOBAL bulletxpos as integer [192]
GLOBAL bulletypos as integer [192]
GLOBAL bulletxdir as integer [192]
GLOBAL bulletydir as integer [192]
GLOBAL bulletcounter as integer [192]
GLOBAL bulletactive as integer [192]
GLOBAL bulletmovement as integer [192]
GLOBAL bulletflip as integer [192]

side = 0 // 0 br, 1 bl, 2 tl, 3 tr

// make 192 bullets
// not gonna make a lot of comments cause its a lot but ill make a general desc of whats happening in this loop
// we make the sprite, assign all the values (direction, position, etc.)
// make a lot of variables for each bullet, around 10-ish for each sprite which comes out to a lot of variables
// and yeah... thats about it
// just a lot of variables and math going on in here (had to do some quick maths to find out how much each bullet should move with the help of a graph)
for i = 1 to 192

	if i < 97
		CreateSprite(i+2,2)
		SetSpriteSize(i+2,480,480)
		bulletxpos[i] = GetVirtualWidth()/2 - GetSpriteWidth(i+2)/2
		bulletypos[i] = GetVirtualHeight()/2 - GetSpriteHeight(i+2)/2
		SetSpritePosition(i+2, bulletxpos[i], bulletypos[i])
			
		if mod(i, 12) = 1
			if side = 0 or side = 2
				bulletx[i] = 0
				bullety[i] = 60
			else
				bulletx[i] = 60
				bullety[i] = 0
			endif
			bulletcounter[i] = 0
		endif

		if mod(i, 12) = 2
			if side = 0 or side = 2
				bulletx[i] = 10
				bullety[i] = 60
			else
				bulletx[i] = 60
				bullety[i] = 10
			endif
			bulletcounter[i] = 8
		endif

		if mod(i, 12) = 3
			if side = 0 or side = 2
				bulletx[i] = 19
				bullety[i] = 58
			else
				bulletx[i] = 58
				bullety[i] = 19
			endif
			bulletcounter[i] = 16
		endif

		if mod(i, 12) = 4
			if side = 0 or side = 2
				bulletx[i] = 27
				bullety[i] = 54
			else
				bulletx[i] = 54
				bullety[i] = 27
			endif
			bulletcounter[i] = 24
		endif

		if mod(i, 12) = 5
			if side = 0 or side = 2
				bulletx[i] = 34
				bullety[i] = 51
			else
				bulletx[i] = 51
				bullety[i] = 34
			endif
			bulletcounter[i] = 32
		endif

		if mod(i, 12) = 6
			if side = 0 or side = 2
				bulletx[i] = 39
				bullety[i] = 47
			else
				bulletx[i] = 47
				bullety[i] = 39
			endif
			bulletcounter[i] = 40
		endif

		if mod(i, 12) = 7
			if side = 0 or side = 2
				bulletx[i] = 43
				bullety[i] = 43
			else
				bulletx[i] = 43
				bullety[i] = 43
			endif
			bulletcounter[i] = 48
		endif

		if mod(i, 12) = 8
			if side = 0 or side = 2
				bulletx[i] = 47
				bullety[i] = 39
			else
				bulletx[i] = 39
				bullety[i] = 47
			endif
			bulletcounter[i] = 56
		endif

		if mod(i, 12) = 9
			if side = 0 or side = 2
				bulletx[i] = 51
				bullety[i] = 34
			else
				bulletx[i] = 34
				bullety[i] = 51
			endif
			bulletcounter[i] = 64
		endif

		if mod(i, 12) = 10
			if side = 0 or side = 2
				bulletx[i] = 54
				bullety[i] = 27
			else
				bulletx[i] = 27
				bullety[i] = 54
			endif
			bulletcounter[i] = 72
		endif

		if mod(i, 12) = 11
			if side = 0 or side = 2
				bulletx[i] = 58
				bullety[i] = 19
			else
				bulletx[i] = 19
				bullety[i] = 58
			endif
			bulletcounter[i] = 80
		endif

		if mod(i, 12) = 0
			if side = 0 or side = 2
				bulletx[i] = 60
				bullety[i] = 10
			else
				bulletx[i] = 10 
				bullety[i] = 60
			endif
			bulletcounter[i] = 88
			side = side + 1
		endif

		if i <= 48
			SetSpriteAngle(i+2,(i*7.5) + 90)
		endif
		if i >= 49
			SetSpriteAngle(i+2,((i-48)*7.5) + 90)
			bulletcounter[i] = bulletcounter[i] + 96
		endif
		
		if mod(i, 48) = 12
			angle = 270
		endif
		if mod(i, 48) = 24
			angle = 0
		endif
		if mod(i, 48) = 36
			angle = 90
		endif
		if mod(i, 48) = 0
			angle = 180
		endif
		
		bulletflip[i] = 0
		
		if side = 4
			side = 0
		endif
		if side = 3
			bulletxdir[i] = 1
			bulletydir[i] = -1
		endif
		if side = 0
			bulletxdir[i] = 1
			bulletydir[i] = 1
			bulletflip[i] = 1
			SetSpriteFlip(i+2,bulletflip[i],0)
		endif
		if side = 1
			bulletxdir[i] = -1
			bulletydir[i] = 1
		endif
		if side = 2
			bulletxdir[i] = -1
			bulletydir[i] = -1
			bulletflip[i] = 1
			SetSpriteFlip(i+2,bulletflip[i],0)
		endif
		
		bulletactive[i] = 0
		bulletmovement[i] = 0
		
		if mod(i, 12) = 0
			if side = 0 or side = 2
				bulletx[i] = 60
				bullety[i] = 10
				SetSpriteAngle(i+2, 90 * i)
			else
				bulletx[i] = 10
				bullety[i] = 60
				SetSpriteAngle(i+2, (90 * i) - 90)
			endif
		endif
		
		if i = 96 or i = 48
			bulletflip[i] = 0
			SetSpriteFlip(i+2,bulletflip[i],0)
		endif
		
		if mod(i,48) = 36
			bulletflip[i] = 1
			SetSpriteFlip(i+2,bulletflip[i],0)
		endif
	endif
	
	if i > 96
		if alwayszero = 0
			CreateSprite(i+2,2)
			SetSpriteSize(i+2,480,480)
			bulletxpos[i] = GetVirtualWidth()/2 - GetSpriteWidth(i+2)/2
			bulletypos[i] = GetVirtualHeight()/2 - GetSpriteHeight(i+2)/2
			SetSpritePosition(i+2, bulletxpos[i], bulletypos[i])
				
			if mod(i, 12) = 1
				if side = 0 or side = 2
					bulletx[i] = 0
					bullety[i] = 60
				else
					bulletx[i] = 60
					bullety[i] = 0
				endif
				bulletcounter[i] = 48
			endif

			if mod(i, 12) = 2
				if side = 0 or side = 2
					bulletx[i] = 10
					bullety[i] = 60
				else
					bulletx[i] = 60
					bullety[i] = 10
				endif
				bulletcounter[i] = 56
			endif

			if mod(i, 12) = 3
				if side = 0 or side = 2
					bulletx[i] = 19
					bullety[i] = 58
				else
					bulletx[i] = 58
					bullety[i] = 19
				endif
				bulletcounter[i] = 64
			endif

			if mod(i, 12) = 4
				if side = 0 or side = 2
					bulletx[i] = 27
					bullety[i] = 54
				else
					bulletx[i] = 54
					bullety[i] = 27
				endif
				bulletcounter[i] = 72
			endif

			if mod(i, 12) = 5
				if side = 0 or side = 2
					bulletx[i] = 34
					bullety[i] = 51
				else
					bulletx[i] = 51
					bullety[i] = 34
				endif
				bulletcounter[i] = 80
			endif

			if mod(i, 12) = 62
			SetSpritePosition(i+2, bulletxpos[i], bulletypos[i])
				if side = 0 or side = 2
					bulletx[i] = 39
					bullety[i] = 47
				else
					bulletx[i] = 47
					bullety[i] = 39
				endif
				bulletcounter[i] = 88
			endif

			if mod(i, 12) = 7
				if side = 0 or side = 2
					bulletx[i] = 43
					bullety[i] = 43
				else
					bulletx[i] = 43
					bullety[i] = 43
				endif
				bulletcounter[i] = 0
			endif

			if mod(i, 12) = 8
				if side = 0 or side = 2
					bulletx[i] = 47
					bullety[i] = 39
				else
					bulletx[i] = 39
					bullety[i] = 47
				endif
				bulletcounter[i] = 8
			endif

			if mod(i, 12) = 9
				if side = 0 or side = 2
					bulletx[i] = 51
					bullety[i] = 34
				else
					bulletx[i] = 34
					bullety[i] = 51
				endif
				bulletcounter[i] = 16
			endif

			if mod(i, 12) = 10
				if side = 0 or side = 2
					bulletx[i] = 54
					bullety[i] = 27
				else
					bulletx[i] = 27
					bullety[i] = 54
				endif
				bulletcounter[i] = 24
			endif

			if mod(i, 12) = 11
				if side = 0 or side = 2
					bulletx[i] = 58
					bullety[i] = 19
				else
					bulletx[i] = 19
					bullety[i] = 58
				endif
				bulletcounter[i] = 32
			endif

			if mod(i, 12) = 0
				if side = 0 or side = 2
					bulletx[i] = 60
					bullety[i] = 10
				else
					bulletx[i] = 10 
					bullety[i] = 60
				endif
				bulletcounter[i] = 40
				side = side + 1
			endif

			if i <= 144
				SetSpriteAngle(i+2,(i*7.5) + 90)
			endif
			if i >= 145
				SetSpriteAngle(i+2,((i-48)*7.5) + 90)
				bulletcounter[i] = bulletcounter[i] + 96
			endif
			
			if mod(i, 48) = 12
				angle = 270
			endif
			if mod(i, 48) = 24
				angle = 0
			endif
			if mod(i, 48) = 36
				angle = 90
			endif
			if mod(i, 48) = 0
				angle = 180
			endif
			
			bulletflip[i] = 0
			
			if side = 4
				side = 0
			endif
			if side = 3
				bulletxdir[i] = 1
				bulletydir[i] = -1
			endif
			if side = 0
				bulletxdir[i] = 1
				bulletydir[i] = 1
				bulletflip[i] = 1
				SetSpriteFlip(i+2,bulletflip[i],0)
			endif
			if side = 1
				bulletxdir[i] = -1
				bulletydir[i] = 1
			endif
			if side = 2
				bulletxdir[i] = -1
				bulletydir[i] = -1
				bulletflip[i] = 1
				SetSpriteFlip(i+2,bulletflip[i],0)
			endif
			
			bulletactive[i] = 0
			bulletmovement[i] = 0
			
			if mod(i, 12) = 0
				if side = 0 or side = 2
					bulletx[i] = 60
					bullety[i] = 10
					SetSpriteAngle(i+2, 90 * i)
				else
					bulletx[i] = 10
					bullety[i] = 60
					SetSpriteAngle(i+2, (90 * i) - 90)
				endif
			endif
			
			if i = 192 or i = 144
				bulletflip[i] = 0
				SetSpriteFlip(i+2,bulletflip[i],0)
			endif
			
			if mod(i,48) = 36
				bulletflip[i] = 1
				SetSpriteFlip(i+2,bulletflip[i],0)
			endif
		endif
	endif
next i


return
