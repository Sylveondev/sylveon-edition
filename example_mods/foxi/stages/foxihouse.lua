function onCreate()
	makeLuaSprite('sky/day', 'sky/day', -200, -150);
	setLuaSpriteScrollFactor('sky/day', 0, 0);
	scaleObject('sky/day', 2, 2);
	addLuaSprite('sky/day', false);
	
	makeLuaSprite('house/grass', 'house/grass', -400, -200);
	scaleObject('sky/day', 1, 1);
	addLuaSprite('house/grass', false);
end