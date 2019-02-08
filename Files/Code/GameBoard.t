%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:
%Teacher:
%Program Name:
%Descriptions:  Draws and updates game board visuals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc DrawField
    var picID : int
    var x : int := 0
    var y : int := maxy - 32
    for row : 1 .. upper (grid, 1)
	for col : 1 .. upper (grid, 2)
	    if grid (row, col) = "SB" then
		picID := Pic.FileNew ("././Images/SolidBlock.jpg")
		Pic.Draw (picID, x, y, picMerge)
		Pic.Free (picID)
	    end if
	    if grid (row, col) = "BB" then
		picID := Pic.FileNew ("././Images/BreakableBrick.jpg")
		Pic.Draw (picID, x, y, picMerge)
		Pic.Free (picID)
	    end if
	    if grid (row, col) = "E" then
		if row = 2 then
		    picID := Pic.FileNew ("././Images/TopGrass.jpg")
		    Pic.Draw (picID, x, y, picMerge)
		    Pic.Free (picID)
		else
		    picID := Pic.FileNew ("././Images/Grass.jpg")
		    Pic.Draw (picID, x, y, picMerge)
		    Pic.Free (picID)
		end if
	    end if
	    x += 32
	end for
	y -= 32
	x := 0
	picID := Pic.FileNew ("Images/Bomb1.bmp")
	Pic.Draw (picID, bombPosx, bombPosy, picMerge)
	Pic.Free (picID)
	picID := Pic.FileNew ("Images/Sprite.bmp")
	Pic.Draw (picID, playerPosx, playerPosy, picMerge)
	Pic.Free (picID)
	View.UpdateArea (0, 0, maxx, maxy)
    end for
end DrawField

proc DrawStartBombers

end DrawStartBombers

proc DrawBomberman (direction, Color : string)
    var picID : int
    var x, y : int := 0
    if Color = "White" then
	if grid (playerPosx, playerPosy - 1) = "E" and bombArray (playerPosx, playerPosy - 1) = "" then
	    y += 2
	end if
	picID := Pic.FileNew ("././Images/SpritePos1White.jpg")
	Pic.Draw (picID, x, y, picMerge)
	Pic.Free (picID)
    end if
    if Color = "Black" then

    end if
    if Color = "Blue" then
    end if
    if Color = "Red" then
    end if
end DrawBomberman
