-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require "widget"

function nextScene ( event )
	storyboard.gotoScene( "level1" )
end

function scene:createScene( event )
	local group = self.view

	-- display a background image
	local background = display.newImageRect( "background.png", display.contentWidth, display.contentHeight )
	background:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0

	local grass = display.newImage( "grass.png" )
	grass:setReferencePoint( display.BottomLeftReferencePoint )
	grass.x, grass.y = 0, display.contentHeight
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImage( "logo.png" )
	titleLogo:setReferencePoint( display.CenterReferencePoint )
	titleLogo.x = display.contentWidth * 0.5
	titleLogo.y = display.contentHeight * 0.5
	
	titleLogo:addEventListener( "touch", nextScene )
	
	-- create a widget button (which will loads level1.lua on release)
	--playBtn = widget.newButton{
	--	label="Play Now",
	--	labelColor = { default={255}, over={128} },
	--	defaultFile="button.png",
	--	overFile="button-over.png",
	--	width=154, height=40,
	--	onRelease = onPlayBtnRelease	-- event listener function
	--}
	--playBtn:setReferencePoint( display.CenterReferencePoint )
	--playBtn.x = display.contentWidth*0.5
	--playBtn.y = display.contentHeight - 125
	
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( titleLogo )
	
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
end

function glow( event )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

scene:addEventListener( "touch", nextScene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

Runtime:addEventListener( "enterFrame", glow )

-----------------------------------------------------------------------------------------

return scene