local defaultZoom = 0.9
local defaultCamSpeed = 1
local invertmii = -1
local trailEnabled = false
local totalTrails = 0

function onBeatHit()
    if curBeat == 16 then
        setProperty("defaultCamZoom", 1.2)
    end
    if curBeat == 32 then
        setProperty("defaultCamZoom", defaultZoom)
    end
    if curBeat >= 64 and curBeat < 92 then
        if curBeat % 2 == 0 then
            setProperty('camGame.zoom',getProperty('camGame.zoom')+0.2)
            setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.1)
        end
    end
    if curBeat == 92 then
        setProperty("defaultCamZoom", 2)
    end
    if curBeat == 96 then
        cameraFlash("other", 0xFFFFFFFF, 2, false)
        setProperty("defaultCamZoom", defaultZoom)
    end
    if curBeat >= 96 and curBeat < 159 then
        setProperty('camGame.zoom',getProperty('camGame.zoom')+0.4)
        setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.2)
        if curBeat % 2 == 0 then
            doTweenAngle("camtween", "camGame", 6*invertmii, 1, "circOut")
            doTweenAngle("hudtween", "camHUD", 6*invertmii, 1, "circOut")
            invertmii = invertmii * -1;
        end
    end
    if curBeat == 159 then invertmii = -1 end
    if curBeat == 160 or curBeat == 168 or curBeat == 176 or curBeat == 184 or curBeat == 192 or curBeat == 200 or curBeat == 208 or curBeat == 216 then
        cameraFlash("other", 0xFFFFFFFF, 1, false)
        setProperty("cameraSpeed", 1000)
        setProperty('camGame.zoom',getProperty('camGame.zoom')+2)
        setProperty("defaultCamZoom", 2)
        setProperty('camGame.angle',8*invertmii)
        setProperty('camHUD.angle',8*invertmii)
        doTweenAngle("camtween", "camGame", 16*invertmii, 6, "circOut")
        doTweenAngle("hudtween", "camHUD", 16*invertmii, 6, "circOut")
        invertmii = invertmii * -1;
    end
    if curBeat == 224 then
        setProperty("cameraSpeed", defaultCamSpeed)
        doTweenAngle("camtween", "camGame", 0, 0.5, "linear")
        doTweenAngle("hudtween", "camHUD", 0, 0.5, "linear")
        setProperty("defaultCamZoom", defaultZoom)
    end
    
    --Trail part
    if curBeat == 228 then
        trailEnabled = true
    end
    if curBeat == 232 then
        trailEnabled = false
    end
    if curBeat == 260 then
        trailEnabled = true
    end
    if curBeat == 264 then
        trailEnabled = false
    end
    if curBeat == 292 then
        trailEnabled = true
    end
    if curBeat == 296 then
        trailEnabled = false
    end
    if curBeat == 324 then
        trailEnabled = true
    end
    if curBeat == 328 then
        trailEnabled = false
    end

    if curBeat >=224 and curBeat <288 then
        setProperty('camGame.zoom',getProperty('camGame.zoom')+0.4)
        setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.2)
    end
    if curBeat == 383 then
        setProperty("defaultCamZoom", 1.2)
    end
    if curBeat >= 416 and curBeat < 448 then
        setProperty("defaultCamZoom", defaultZoom)
        if curBeat % 2 == 0 then
            setProperty('camGame.zoom',getProperty('camGame.zoom')+0.2)
            setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.1)
        end
    end

    --Trail part again
    if curBeat == 452 then
        trailEnabled = true
    end
    if curBeat == 456 then
        trailEnabled = false
    end
    if curBeat == 484 then
        trailEnabled = true
    end
    if curBeat == 488 then
        trailEnabled = false
    end
    if curBeat == 516 then
        trailEnabled = true
    end
    if curBeat == 520 then
        trailEnabled = false
    end
    if curBeat == 548 then
        trailEnabled = true
    end
    if curBeat == 552 then
        trailEnabled = false
    end

    if curBeat >=448 and curBeat <512 then
        setProperty('camGame.zoom',getProperty('camGame.zoom')+0.4)
        setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.2)
    end
    if curBeat >= 512 and curBeat < 576 then
        if curBeat % 2 == 0 then
            setProperty('camGame.zoom',getProperty('camGame.zoom')+0.2)
            setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.1)
        end
    end
end

function onSongStart()
    defaultZoom = getProperty("defaultCamZoom")
    defaultCamSpeed = getProperty("cameraSpeed")
    setProperty("camZooming", true)
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
	setProperty(trailTag .. '.velocity.x', math.random(-512,512))
	setProperty(trailTag .. '.velocity.y', 0)
	setObjectOrder(trailTag, dadOrder - 0.1)
	setBlendMode(trailTag, 'add')
	addAnimationByPrefix(trailTag, 'stuff', getProperty('dad.animation.frameName'), 0, false)
	addLuaSprite(trailTag, false)
	doTweenAlpha(trailTag..'Tween', trailTag, 0, 0.5, "linear")
	runTimer(trailTag, 0.5, 0)
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