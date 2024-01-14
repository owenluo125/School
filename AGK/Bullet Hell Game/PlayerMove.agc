playermove:

// basic movements we've used in a lot of programs
if GetRawKeyState(87) // w
	secret = 0
	if ((GetSpriteX(1) - 7200) ^ 2) + ((GetSpriteY(1) - 50 - 7200) ^ 2) < 5800 ^ 2
		playery = playery - speed
	endif
endif

if GetRawKeyState(83) // s
	secret = 0
	if ((GetSpriteX(1) - 7200) ^ 2) + ((GetSpriteY(1) + 50 - 7200) ^ 2) < 5800 ^ 2
		playery = playery + speed
	endif
endif

if GetRawKeyState(65) // a
	secret = 0
	if ((GetSpriteX(1) - 50 - 7200) ^ 2) + ((GetSpriteY(1) - 7200) ^ 2) < 5800 ^ 2
		playerx = playerx - speed
		SetSpriteFlip(1,1,0)
	endif
endif

if GetRawKeyState(68) // d
	secret = 0
	if ((GetSpriteX(1) + 50 - 7200) ^ 2) + ((GetSpriteY(1) - 7200) ^ 2) < 5800 ^ 2
		playerx = playerx + speed
		SetSpriteFlip(1,0,0)
	endif
endif


// yeah... something secret if you want you could probably easily find out what this does
if GetRawKeyPressed(52)
	secret = 1
endif

if GetRawKeyPressed(50) and secret = 1
	secret = 2
endif

if GetRawKeyPressed(48) and secret = 2
	secret = 3
endif



if GetRawKeyState(262) and secret = 3
	score = score + 100000
	if corner = 0
		playerx = 500
		playery = 500
		SetSpritePosition(1,playerx,playery)
		corner = corner + 1
	else
		if corner = 1
			playerx = GetVirtualHeight() - 500
			playery = 500
			SetSpritePosition(1,playerx,playery)
			corner = corner + 1
		else
			if corner = 2
				playerx = GetVirtualHeight() - 500
				playery = GetVirtualWidth() - 500
				SetSpritePosition(1,playerx,playery)
				corner = corner + 1
			else
				if corner = 3
					playerx = 500
					playery = GetVirtualWidth() - 500
					SetSpritePosition(1,playerx,playery)
					corner = corner + 1
				else
					corner = 1
					playerx = 500
					playery = 500
					SetSpritePosition(1,playerx,playery)
				endif
			endif
		endif
	endif
endif

// if esc is pressed exit
if GetRawKeyPressed(27)
	reset = 0
endif

// set sprite positin
SetSpritePosition(1,playerx,playery)

return
