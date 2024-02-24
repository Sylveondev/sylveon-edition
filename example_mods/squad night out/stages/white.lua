function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'treehouseback', -300, -100);
	setScrollFactor('stageback', 0.9, 0.9);
	scaleObject('stageback',0.8,0.8);
	
	makeLuaSprite('stagefront', 'treehousefront', -650, 500);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then


	end

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end