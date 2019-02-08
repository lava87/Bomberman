%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Program Name:
%Date:
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Final Program Name Here and a brief description of the game
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% files/code folder
include "files/code/includes.t"
setscreen ("graphics:800;800")
setscreen ("noecho")
View.Set ("offscreenonly")
loop
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % procedure to set all initial global variable with file scope
    % even if already set (located in MyGlobalVars.t)
    setInitialGameValues
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    displayIntroWindow

    if YesToInstructions = true then
	displayInstructionWindow
    end if
    cls
    DrawField
    loop
	moveBomberman

	%if bombExploded = true then
	%   update grid
	%   update lives --> must update visually after updating the variable
	%   update bombers
	%end if
	%gameOver = true when whiteLives < 0
	%if PAUSE = true then
	%   loop
	%       something with buttons
	%       if quit game button is pressed, exitGame = true
	%       if main menu button is pressed, gameOver = true
	%       exit when some button is pressed
	%   end loop
	%Write some kind of AI o-o
	exit when exitGame = true
	%exit when gameOver = true
    end loop
    exit when exitGame = true

end loop


