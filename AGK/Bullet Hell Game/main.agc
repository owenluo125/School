// Project: BulletHell 
// Created: 2021-11-29

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "BulletHell" )
SetWindowSize( 720, 720, 0 )
SetWindowAllowResize( 0 ) // don't allow the user to resize the window

// set display properties
SetVirtualResolution( 14400, 14400 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

reset = 0
highscore = 0
// random variable i just have here that dont serve much of a purpose
// i just thought it was kinda funny 
alwayszero = 0


// files
#include "LoadImages.agc"
#include "PlayerSprite.agc"
#include "BulletSprite.agc"
#include "PlayerMove.agc"
#include "EnemySprites.agc"
#include "StartScreen.agc"
#include "BulletMove.agc"
#include "Collision.agc"
#include "PlayerHealth.agc"
#include "Reset.agc"


//subroutines
gosub loadimages
gosub loadtexts

// main loop
do
	// if reset = 0 then run reset subroutine
	if reset = 0
		gosub reset
	endif
	
	// show startscreen if startscreen = 0 and allow for customization
	if startscreen = 0
		gosub customization
		gosub startscreen
	else
		// if player is above 0 lives run all these subrountines which run the game part
		if lives > 0
			gosub playermove
			gosub animateenemy
			gosub movebulletstart
			gosub movebullet
			gosub collision
			gosub lives
		else
			// if lives are not above 0 reset game
			reset = 0
		endif
	endif
	
	Sync()
loop
