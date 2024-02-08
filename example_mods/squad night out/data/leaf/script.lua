local defaultZoom = 0.9
local defaultCamSpeed = 1
local invertmii = -1

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