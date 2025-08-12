-- CutscenePlayer
-- Andyg

function PlayCutscene(cutsfile)
	
    main.commentary:Print('CUTSCENE START')
        
	Wait(100)
	
	LOAD_CUTSCENE(cutsfile)
    
    while not IS_CUTSCENE_LOADED() do
		Wait(500)
	end
	
	CameraFadeIn(1)
    
    Wait(100)
    
    while IsCameraFading() do
		Wait(100)
    end
    
    START_CUTSCENE()
    
    while not HAS_CUTSCENE_FINISHED() do
		Wait(500)
    end
    
	Wait(100)
		
    while IsCameraFading() do
		Wait(100)
    end
    
    CLEAR_CUTSCENE()
    
    main.commentary:Print('CUTSCENE END!')
      
    
end



