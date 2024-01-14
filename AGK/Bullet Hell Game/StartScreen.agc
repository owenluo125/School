startscreentext:

// create start screen text 
SetTextSize(1, 2000)
SetTextSize(2,1000)
SetTextPosition(1,GetVirtualWidth()/2 - GetTextTotalWidth(1)/2, 0)
SetTextPosition(2,GetVirtualWidth()/2 - GetTextTotalWidth(2)/2, 10000)
SetTextVisible(1,0)
SetTextVisible(2,0)

return


startscreen:

// set the text sprites visible
SetTextVisible(1,1)
SetTextVisible(2,1)

// print instructions
print("")
print("")
print("")
print("")
print("High score: " + str(highscore))
print("Last Score: " + str(lastscore))
print("")
print("Press ENTER for EASY mode")
print("Press TAB for HELL mode (very dangerous :D)")
print("Use the ARROW keys to choose a character")

// make player visibla ena dbig for customization
SetSpriteVisible(1,1)
SetSpriteSize(1,1440,1440)

// set sprite position
playerx = GetVirtualWidth()/2 - GetSpriteWidth(1)/2
playery = GetVirtualHeight()/2 - GetSpriteHeight(1)/2
SetSpritePosition(1,playerx,playery)

//set what the text says e.g. wizard, ninj,a knight
SetTextString(2, skinstring)
SetTextPosition(2,GetVirtualWidth()/2 - GetTextTotalWidth(2)/2,8000)

// set everything else invisible (bullets, oryx)
for i = 1 to 193
	SetSpriteVisible(i+1, 0)
next i

// if they press enter start easy mode
if GetRawKeyPressed(13) // enter
	startscreen = 1
	difficulty = 1
	x = 96
	speed = 40
	gosub gamestart
endif

// if they press tab start hard mode
if GetRawKeyPressed(9) // tab
	startscreen = 1
	difficulty = 2
	x = 192
	speed = 70
	gosub gamestart
endif

// set lives to 3
lives = 3

return


customization:

// change skin 
if skin = 0
	SetSpriteImage(1, 1)
	skinstring = "Wizard"
else
	if skin = 1
		SetSpriteImage(1, 11)
		skinstring = "Ninja"
	else
		if skin = 2
			SetSpriteImage(1, 12)
			skinstring = "Knight"
		else
			if skin = 3
				SetSpriteImage(1, 13)
				skinstring = "Archer"
			else
				if skin = 4
					SetSpriteImage(1,14)
					skinstring = "Rogue"
				else
					if skin = 5
						SetSpriteImage(1,15)
						skinstring = "Priest"
					endif
				endif
			endif
		endif
	endif
endif

// if left is pressed change skin
if GetRawKeyPressed(37) // left
	skin = skin - 1
	if skin = -1
		skin = 5
	endif
endif

// if right is pressed change skin
if GetRawKeyPressed(39) // right
	skin = skin + 1
	if skin = 6
		skin = 0
	endif
endif

return


gamestart:

// set everything visible
for i = 1 to 194
	SetSpriteVisible(i, 1)
next i

// make text invisible
SetTextVisible(1,0)
SetTextVisible(2,0)

// set player size back to normal
SetSpriteSize(1,480,480)

// set player position
playerx = GetVirtualWidth()/2 - GetSpriteWidth(1)/2
playery = 10000
SetSpritePosition(1, playerx, playery)

return

