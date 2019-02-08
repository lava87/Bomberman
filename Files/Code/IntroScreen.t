%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Demos how to implement a button and a process
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% displays a intro banner
include "InstructionWindow.t"
process displayBanner
    var picID : int
    var x := maxx div 4 - 21
    var y := maxy div 2 - 20

    picID := Pic.FileNew ("././Images/bomberman_logo.bmp")
    loop
	Pic.Draw (picID, x, y, picCopy)
	exit when isIntroWindowOpen = false
    end loop
    Pic.Free (picID)
end displayBanner

% main procedure to handle the intro window
procedure displayIntroWindow

    % flag that intro screen is open - global var isIntroWindowOpen
    isIntroWindowOpen := true
    % Open the window
    var winID : int
    winID := Window.Open ("position:top;center,graphics:600;400,title:Introduction Window")


    fork displayBanner


    % create a button
    var quitIntroWindowButton := GUI.CreateButton (maxx - 150, 50, 0, "1 Player", QuitIntroWindowButtonPressed)
    var Instructions := GUI.CreateButton (maxx - 150, 25, 0, "Instructions", InstructionsButtonPressed)
    % Window will continue until quit button is pressed
    loop
	exit when GUI.ProcessEvent or isIntroWindowOpen = false
	exit when YesToInstructions = true  
    end loop
    % release the button
    GUI.Dispose (quitIntroWindowButton)
    GUI.Dispose (Instructions)
    %close/release the window
    Window.Close (winID)




end displayIntroWindow
