function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'forestBackground', -150, -150);
	setScrollFactor('stageback', 0, 0);
	scaleObject('stageback',2,2);
	
	makeLuaSprite('stagefront', 'forestGround', -650, 700);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 2.5, 2.5);

	makeLuaSprite('stagetrees', 'forestTreesFront', -650, -50);
	setScrollFactor('stagetrees', 0.9, 0.9);
	scaleObject('stagetrees', 2.5, 2.5);

	makeLuaSprite('stagetreesback', 'forestTreesBack', -800, 100);
	setScrollFactor('stagetreesback', 0.5, 0.5);
	scaleObject('stagetreesback', 2.5, 2.5);

	makeLuaSprite('stagetreesbackk', 'forestTreesBack', 600, 100);
	setScrollFactor('stagetreesbackk', 0.5, 0.5);
	scaleObject('stagetreesbackk', 2.5, 2.5);

	makeLuaSprite('stagetreesbackB', 'forestTreesBack', -600, 0);
	setScrollFactor('stagetreesbackB', 0.25, 0.25);
	scaleObject('stagetreesbackB', 2.8, 2.8);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then


	end

	addLuaSprite('stageback', false);
	addLuaSprite('stagetreesbackB', false);
	addLuaSprite('stagetreesback', false);
	addLuaSprite('stagetreesbackk', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagetrees', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end