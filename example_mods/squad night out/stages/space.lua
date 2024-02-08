function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'spaceback', -300, -100);
	setScrollFactor('stageback', 0.5, 0.5);
	scaleObject('stageback',1.2,01.2);

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