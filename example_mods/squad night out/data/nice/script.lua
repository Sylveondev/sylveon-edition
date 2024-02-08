local defaultNotePos = {};
local defaultSylvPos = {}

function onSongStart()

    for i = 0,7 do
 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x, y})
 
        --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
    end
    
    table.insert(defaultSylvPos, {getProperty("dad.x"),getProperty("dad.y")})
 
end

local spinlength = 0
function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');

    rawBeat = (songPos / 1000) * (bpm / 60)

    currentBeat = math.floor(rawBeat)

    print(currentBeat)

    
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + spinlength * math.sin((rawBeat + i*0.25) * math.pi / 2))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + spinlength * math.sin((rawBeat + i*0.25) * math.pi / 2))
        end
        
        spinlength = spinlength + 0.01
    
        --setProperty('dad.x', defaultSylvPos[1][1] + 64 * math.sin((rawBeat + 1) * math.pi))
        setProperty('dad.y', defaultSylvPos[1][2] + -256 * math.sin((rawBeat + 0.1) * math.pi / 16))
end