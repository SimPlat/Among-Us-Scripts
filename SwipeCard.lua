function OnEvent(event, arg)
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
	    MoveMouseTo(28000, 50000)           -- Target card
	    Sleep(200)
	    PressMouseButton(1)
	    Sleep(200)
	    ReleaseMouseButton(1)               -- Move card into the reader
	    MoveMouseTo(20000, 30000)           -- Target card again
	    Sleep(550)
	    PressMouseButton(1)                 -- Grab the card
	    for slideX=20000,49000,1500 do      -- Simulate card slide
	    	Sleep(1)
	    	MoveMouseTo(slideX, 30000)
	    	Sleep(1)
	    end
	    Sleep(100)
	    ReleaseMouseButton(1)               -- Release card and finish the task
    end
end