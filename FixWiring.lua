function OnEvent(event, arg)
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then
        arrayOfSources = {16000, 27600, 39000, 50600}
        arrayOfTargets = {16000, 27600, 39000, 50600}
        size = 4

        for i = 1, 4 do
            MoveMouseTo(20000, arrayOfSources[i])       -- Rotate through source wires
            FindTarget()
        end
    end
end

function FindTarget()
    Sleep(150)
    PressMouseButton(1)                                 -- Hold left-click down
    Sleep(150)
    while (IsMouseButtonPressed(1)) do
        for i = 1, size do
            MoveMouseTo(44000, arrayOfTargets[i])       -- Drag to each target wire
            Sleep(350 - size * 25)
            if (not IsMouseButtonPressed(1)) then       -- No longer pressed = target found
                DeleteCompletedTarget(i)                -- Remove matched target from pool
                ReleaseMouseButton(1)                   
                return                                  -- Move to the next source wire
            end
        end
    end
    ReleaseMouseButton(1)
    return
end

function DeleteCompletedTarget(completedTarget)         -- Update array of target wires by removing completed ones
    for i = completedTarget, size do
        arrayOfTargets[i] = arrayOfTargets[i + 1]
    end
    size = size - 1
end
