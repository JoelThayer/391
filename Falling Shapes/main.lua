-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Meta class
local vertical=1
local cat=1
local dog=1
local bear=1
local pig=1
local cow=1
local horse=1
local lion=1


local gameLoopTimer
local speed = 10
Shape = {area = 0}

-- Base class method new

function Shape:new (o,side)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   side = side or 0
   self.area = side*side;
   return o
end

-- Base class method printArea

function Shape:printArea ()
   print("The area is ",self.area)
end

-- Creating an object
myshape = Shape:new(nil,10)

myshape:printArea()

local background = display.newImageRect( "background.jpg",450, 800)

background.x = display.contentCenterX
background.y = display.contentCenterY

local paint = {.57,.5,1}
local circ = display.newCircle(40,vertical,25)
circ.fill = paint;
local rect = display.newRect(100,cat,40,40)
rect.fill = {.45,.45,1}
local circ1 = display.newCircle(150,dog,29)
circ1.fill = {.91,.22,.41}
local rect1 = display.newRect( 190, bear, 15, 25 )
rect1.fill ={.44,.9,.1}
local circ2 = display.newCircle(240, pig, 45)
circ2.fill ={.7,.4,.99}
local rect2 = display.newRect( 15, cow, 15, 25 )
rect2.fill ={.8,.9,.1}
local circ3 = display.newCircle(270, horse, 5)
circ3.fill ={.13,.4,.18}
local rect3 = display.newRect( 290, lion, 3, 50)
rect3.fill ={.02,.05,.1}

local rock = display.newImageRect("rock.png", 100,100)
rock.x = display.contentCenterX
rock.y = display.contentCenterY
rock.fill.blendMode = "multiply"


local function gameLoop()
circ.y =  circ.y + speed

if circ.y > display.contentHeight then
circ.y=0
end
circ1.y =  circ1.y + speed

if circ1.y > display.contentHeight then
circ1.y=0
end


circ2.y =  circ2.y + speed

if circ2.y > display.contentHeight then
circ2.y=0
end


circ3.y =  circ3.y + speed

if circ3.y > display.contentHeight then
circ3.y=0
end


rect.y = rect.y + speed

if rect.y > display.contentHeight then
rect.y=0
end


rect1.y = rect1.y + speed

if rect1.y > display.contentHeight then
rect1.y=0
end


rect2.y = rect2.y + speed

if rect2.y > display.contentHeight then
rect2.y=0
end

rect3.y = rect3.y + speed

if rect3.y > display.contentHeight then
rect3.y=0
end
--[[
   rock.x = rock.x + speed
   if(rock.x > display.contentWidth) or rock.x < 0 then

      speed = speed * -1
end
]]--
end
gameLoopTimer = timer.performWithDelay( 100, gameLoop, 0 )
