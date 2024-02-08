local defaultNotePos = {};
local DefaultUiPos = {};
local hasreset = false
local somerandom

function onCreate()
    if getPropertyFromClass('ClientPrefs','windowMove') then
	    --setPropertyFromClass('openfl.Lib','application.window.width', 480)
        --setPropertyFromClass('openfl.Lib','application.window.height', 480 / 2)	
    end
end

function onSongStart()

    for i = 0,7 do
 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x, y})
 
        --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
    end

    table.insert(DefaultUiPos, {getProperty('boyfriend.x'), getProperty('boyfriend.y')})
    table.insert(DefaultUiPos, {getProperty('gf.x'), getProperty('gf.y')})
    table.insert(DefaultUiPos, {getProperty('dad.x'), getProperty('dad.y')})
    table.insert(DefaultUiPos, {getProperty('scoretable.x'), getProperty('scoretable.y')})
    table.insert(DefaultUiPos, {getProperty('healthBar.x'), getProperty('healthBar.y')})
    table.insert(DefaultUiPos, {getProperty('timeBar.x'), getProperty('timeBar.y')})
    table.insert(DefaultUiPos, {getProperty('scoreTxt.x'), getProperty('scoreTxt.y')})
    table.insert(DefaultUiPos, {getProperty('iconP1.x'), getProperty('iconP1.y')})
    table.insert(DefaultUiPos, {getProperty('iconP2.x'), getProperty('iconP2.y')})

end

function opponentNoteHit()
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
    triggerEvent('Add Camera Zoom', '0.025', '0.025');
    
end

function onBeatHit()
    triggerEvent('Add Camera Zoom', '0.025', '0.025');
end