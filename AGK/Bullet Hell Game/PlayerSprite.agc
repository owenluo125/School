makeplayer:
// make player and place it
CreateSprite(1, 1)
SetSpriteSize(1,1440,1440)
playerx = GetVirtualWidth()/2 - GetSpriteWidth(1)/2
playery = GetVirtualHeight()/2 - GetSpriteHeight(1)/2
SetSpritePosition(1,playerx,playery)

// what'll show on the title screen when selectin yoiur charcter
skinstring as string
skinstring = "Wizard"

return
