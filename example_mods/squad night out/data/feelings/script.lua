-- THIS SCRIPT USES PSYCH ENGINE 0.6.1 AND LATER ONLY
-- author: TheLeerName
-- source: https://gamebanana.com/tools/9815
--[[function onCreatePost()
	addHaxeLibrary('FlxTrail', 'flixel.addons.effects') -- adds FlxTrail library for hscript interpreter (MUST ADD FIRST)

	runHaxeCode('dadtrail = new FlxTrail(game.dad, null, 20, 1, 0.3, 0.002)') -- sets ghost trail of dad via FlxTrail library, below the explanation of values
	-- new FlxTrail(Target:FlxSprite, ?Graphic:Null<FlxGraphicAsset>, Length:Int = 10, Delay:Int = 3, Alpha:Float = 0.4, Diff:Float = 0.05)
	-- "game." is necessary if you sets value from game

	runHaxeCode('game.addBehindDad(dadtrail)') -- adds ghost trail of dad
	runHaxeCode('dadtrail.visible = false')
end]]
local trailEnabled = false
local totalTrails = 0

function onBeatHit()
	if curBeat >= 32 and curBeat < 96 then
		if curBeat % 2 == 0 then
			setProperty("camGame.zoom", 1.25)
		end
	end
	if curBeat == 96 then
		trailEnabled = true
		--runHaxeCode('dadtrail.visible = true')
	end
	if curBeat == 160 then
		--runHaxeCode('dadtrail.visible = false')
		--runHaxeCode('game.remove(dadtrail)') -- fully removes ghost trail
	end
end

function rgbToHex(rgb) --https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
	return string.format("%02x%02x%02x", math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end

function summonTrail()
	--debugPrint("Yes")
	local dadOrder = getObjectOrder('dadGroup')
	local trailTag = "DadTrail"..totalTrails
	totalTrails = totalTrails + 1
	makeAnimatedLuaSprite(trailTag, getProperty('dad.imageFile'), getProperty('dad.x'), getProperty('dad.y'))
	setProperty(trailTag .. '.scale.x', getProperty('dad.scale.x'))
	setProperty(trailTag .. '.scale.y', getProperty('dad.scale.y'))
	setScrollFactor(trailTag, getProperty('dad.scrollFactor.x'), getProperty('dad.scrollFactor.y'))
	setProperty(trailTag .. '.offset.x', getProperty('dad.offset.x'))
	setProperty(trailTag .. '.offset.y', getProperty('dad.offset.y'))
	setProperty(trailTag .. '.origin.x', getProperty('dad.origin.x'))
	setProperty(trailTag .. '.origin.y', getProperty('dad.origin.y'))
	setProperty(trailTag .. '.acceleration.x', getProperty('dad.acceleration.x'))
	setProperty(trailTag .. '.acceleration.y', getProperty('dad.acceleration.y'))
	setProperty(trailTag .. '.flipX', getProperty('dad.flipX'))
	setProperty(trailTag .. '.flipY', getProperty('dad.flipY'))
	setProperty(trailTag .. '.alpha', getProperty('dad.alpha') - 0.4)
	setProperty(trailTag .. '.visible', getProperty('dad.visible'))
	setProperty(trailTag .. '.antialiasing', getProperty('dad.antialiasing'))
	setProperty(trailTag .. '.color', getColorFromHex(rgbToHex(getProperty('dad.healthColorArray'))))
	--debugPrint("No")
	setProperty(trailTag .. '.velocity.x', math.random(-250,250))
	setProperty(trailTag .. '.velocity.y', 0)
	setObjectOrder(trailTag, dadOrder - 0.1)
	setBlendMode(trailTag, 'add')
	addAnimationByPrefix(trailTag, 'stuff', getProperty('dad.animation.frameName'), 0, false)
	addLuaSprite(trailTag, false)
	doTweenAlpha(trailTag..'Tween', trailTag, 0, 1, "linear")
	runTimer(trailTag, 1, 0)
end

function onTimerCompleted(tag, loops, loopsLeft)
	--debugPrint("All done")
	removeLuaSprite(tag, true)
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if trailEnabled == true then
		--debugPrint("Note id".. id)
		summonTrail()
	end
end