local swayGui = false
function onBeatHit()
    if curBeat == 256 then
        setProperty("defaultCamZoom", 2)
        doTweenAngle('turn', 'camGame', 5, crochet/300, 'sineInOut')
        doTweenAngle('turnH', 'camHUD', 5, crochet/300, 'sineInOut')
        swayGui = true
    end
    if curBeat == 384 then
        setProperty("defaultCamZoom", 0.9)
        swayGui = false
    end
end

function onTweenCompleted(t)
    if swayGui == false and t ~= "enditall" then
        doTweenAngle('turnH', 'camHUD', 0, crochet/300, 'sineInOut')
	    doTweenAngle('enditall', 'camGame', 0, crochet/300, 'sineInOut')
	else
        if t == 'turn' then
            doTweenAngle('turnH', 'camHUD', -5, crochet/300, 'sineInOut')
            doTweenAngle('turn1', 'camGame', -5, crochet/300, 'sineInOut')
	    end
	    if t == 'turn1' then
            doTweenAngle('turnH', 'camHUD', 5, crochet/300, 'sineInOut')
	    	doTweenAngle('turn', 'camGame', 5, crochet/300, 'sineInOut')
	    end
    end
end

function opponentNoteHit(index, noteDir, noteType, isSustainNote)
    if not isSustainNote and swayGui == true then
        setProperty("camGame.zoom", 1.25)
        setProperty("camHUD.zoom", 0.95)
    end
end

function goodNoteHit(index, noteDir, noteType, isSustainNote)
    if not isSustainNote and swayGui == true then
        setProperty("camGame.zoom", 1.25)
        setProperty("camHUD.zoom", 0.95)
    end
end