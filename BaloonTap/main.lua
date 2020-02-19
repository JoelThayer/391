------------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local physics = require( "physics" )
physics.start()
local gameLoopTimer

-- create the background images
local background = display.newImageRect( "background.png",650, 970 )
-- set the x and y of the background
background.x = display.contentCenterX
background.y = display.contentCenterY

local balloon = display.newImageRect( "balloon.png", 112, 112 )

balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8
-- make the balloon fall
physics.addBody( balloon, "dynamic", { radius=55, bounce=.75 } )


local platform = display.newImageRect( "platform.png", 350, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight+25
physics.addBody( platform, "static" )


local platform2 = display.newImageRect( "platform.png", 100, 50 )
platform2.x = display.contentWidth-10
platform2.y = display.contentHeight-100
physics.addBody( platform2, "static" )

local platform3 = display.newImageRect( "platform.png", 200, 50 )
platform3.x = 50
platform3.y = display.contentHeight-250
physics.addBody( platform3, "static" )

local platform4 = display.newImageRect( "platform.png", 150, 50 )
platform4.x = display.contentWidth-10
platform4.y = display.contentHeight-400
physics.addBody( platform4, "static" )

local function moveEverything()

    platform2.x = display.contentWidth-100
    platform2.y = display.contentHeight-100

    platform3.x = display.contentWidth - 50
    platform3.y = display.contentHeight-250

    platform4.x = display.contentWidth-200
    platform4.y = display.contentHeight-400
    balloon.x = display.contentCenterX
    balloon.y = display.contentHeight - platform.contentHeight-55
end



local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
   -- tapCount= tapCount + 1
   -- tapText.text = tapCount
   if balloon.y <= 0 then
        moveEverything()
   end

end



local function gameLoop()
    if balloon.x <= balloon.contentWidth/2-10 then
        balloon:applyLinearImpulse(0.20,0,balloon.x,balloon.y)
    elseif(balloon.x >= display.contentWidth-(balloon.contentWidth/2-10)) then
        balloon:applyLinearImpulse(-0.20,0,balloon.x,balloon.y)
    end
end

local function onAccelerate( event )
print( event.name, event.xInstant, event.yInstant, event.zInstant )
    --balloon.x = balloon.x * event.xGravity
    --balloon.y = balloon.y * event.yGravity

end

balloon:addEventListener( "tap", pushBalloon )
gameLoopTimer = timer.performWithDelay( 10, gameLoop, 0 )
Runtime:addEventListener( "accelerometer", onAccelerate )
--]]
