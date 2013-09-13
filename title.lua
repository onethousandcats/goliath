-----------------------------------------------------------------------------------------
--
-- TITLE SCREEN WITH COMPANY LOGO
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require "widget"



function scene:createScene( event )

	local group = self.view

	local l = display.newImage( "crystal_logo.png")
	l.x = display.contentWidth * 0.5
	l.y = display.contentHeight * 0.5
	
	group:insert( l )
	
end

function scene:enterScene( event )
	local group = self.view
	
	storyboard.gotoScene( "menu", "fade", 1000 )
end


function scene:destroyScene( event )
	
	local group = self.view
	
	
end

-------------------------------------------------------------------
-- add listeners here
-------------------------------------------------------------------

scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

return scene