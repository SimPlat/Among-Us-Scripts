function OnEvent(event, arg)
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then
        arrayOfSources = {16000, 27600, 39000, 50600}
        arrayOfTargets = {16000, 27600, 39000, 50600}
        size = 4

        for i = 1, 4 do
            MoveMouseTo(20000, arrayOfSources[i])
            FindTarget()
        end

    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
        MoveMouseTo(28000, 50000)
        Sleep(200)
        PressMouseButton(1)
        Sleep(200)
        ReleaseMouseButton(1)
        MoveMouseTo(20000, 30000)
        Sleep(550)
        PressMouseButton(1)
        for slideX = 20000, 49000, 1500 do
            Sleep(1)
            MoveMouseTo(slideX, 30000)
            Sleep(1)
        end
        Sleep(100)
        ReleaseMouseButton(1)
    end
end

function FindTarget()
    Sleep(150)
    PressMouseButton(1)
    Sleep(150)
    while (IsMouseButtonPressed(1)) do
        for i = 1, size do
            MoveMouseTo(44000, arrayOfTargets[i])
            Sleep(350 - size * 25)
            if (not IsMouseButtonPressed(1)) then
                DeleteCompletedTarget(i)
                ReleaseMouseButton(1)
                return
            end
        end
    end
    ReleaseMouseButton(1)
    return
end

function DeleteCompletedTarget(completedTarget)
    for i = completedTarget, size do
        arrayOfTargets[i] = arrayOfTargets[i + 1]
    end
    size = size - 1
end
