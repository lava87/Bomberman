%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Bomberman Movement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc moveBomberman
    var chars : array char of boolean
    var picID : int
    var timeRunning : int

    loop
	exit when exitGame = true
	Input.KeyDown (chars)
	timeRunning := Time.Elapsed
	%updatePlayerPos
	if chars (KEY_UP_ARROW) then

	    if grid (playerArrayPosx, playerArrayPosy - 1) = "E" and bombArray (playerArrayPosx, playerArrayPosy - 1) = "" then
		playerPosy += 1
	    end if

	    picID := Pic.FileNew ("Images/Sprite2.bmp")
	    Pic.Draw (picID, playerPosx, playerPosy, picMerge)
	    Pic.Free (picID)
	    if Time.Elapsed - timeRunning > 1 then
		delay (10)
		DrawField
		picID := Pic.FileNew ("Images/Bomb1.bmp")
		Pic.Draw (picID, bombPosx, bombPosy, picMerge)
		Pic.Free (picID)
	    end if

	elsif chars (KEY_DOWN_ARROW) then
	    if grid (playerArrayPosx, playerArrayPosy + 1) = "E" and bombArray (playerArrayPosx, playerArrayPosy - 1) = "" then
		playerPosy -= 1
	    end if

	    picID := Pic.FileNew ("Images/Sprite.bmp")
	    Pic.Draw (picID, playerPosx, playerPosy, picMerge)
	    Pic.Free (picID)
	    if Time.Elapsed - timeRunning > 1 then
		DrawField
		picID := Pic.FileNew ("Images/Bomb1.bmp")
		Pic.Draw (picID, bombPosx, bombPosy, picMerge)
		Pic.Free (picID)
	    end if

	elsif chars (KEY_RIGHT_ARROW) then
	    if grid (playerArrayPosx + 1, playerArrayPosy) = "E" and bombArray (playerArrayPosx, playerArrayPosy - 1) = "" then
		playerPosx += 1
	    end if

	    picID := Pic.FileNew ("Images/Sprite.bmp")
	    Pic.Draw (picID, playerPosx, playerPosy, picMerge)
	    Pic.Free (picID)
	    if Time.Elapsed - timeRunning > 1 then
		DrawField
		picID := Pic.FileNew ("Images/Bomb1.bmp")
		Pic.Draw (picID, bombPosx, bombPosy, picMerge)
		Pic.Free (picID)
	    end if

	elsif chars (KEY_LEFT_ARROW) then
	    if grid (playerArrayPosx - 1, playerArrayPosy) = "E" and bombArray (playerArrayPosx, playerArrayPosy - 1) = "" then
		playerPosx -= 1
	    end if

	    picID := Pic.FileNew ("Images/Sprite.bmp")
	    Pic.Draw (picID, playerPosx, playerPosy, picMerge)
	    Pic.Free (picID)
	    if Time.Elapsed - timeRunning > 1 then
		DrawField
		picID := Pic.FileNew ("Images/Bomb1.bmp")
		Pic.Draw (picID, bombPosx, bombPosy, picMerge)
		Pic.Free (picID)
	    end if

	elsif chars ('Q')| chars ('q') then
	    exitGame := true
	elsif chars (' ') then
	    picID := Pic.FileNew ("Images/Bomb1.bmp")
	    Pic.Draw (picID, playerPosx, playerPosy, picMerge)
	    Pic.Free (picID)
	    if Time.Elapsed - timeRunning > 1 then
		DrawField
		picID := Pic.FileNew ("Images/Bomb1.bmp")
		Pic.Draw (picID, bombPosx, bombPosy, picMerge)
		Pic.Free (picID)
	    end if
	    bombPosx := playerPosx
	    bombPosy := playerPosy
	else
	    picID := Pic.FileNew ("Images/Sprite.bmp")
	    Pic.Draw (picID, playerPosx, playerPosy, picMerge)
	    Pic.Free (picID)
	    picID := Pic.FileNew ("Images/Bomb1.bmp")
	    Pic.Draw (picID, bombPosx, bombPosy, picMerge)
	    Pic.Free (picID)
	end if

	View.UpdateArea (0, 0, maxx, maxy)
    end loop
end moveBomberman

proc bombExplosion

end bombExplosion
