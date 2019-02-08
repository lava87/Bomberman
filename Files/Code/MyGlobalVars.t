%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Final Program Name Here and a brief description of the game
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   MyGlobalVars.t
%   All global variables are coded in this file.
%   These will have FILE scope.
%   These must be document thoroughly - Descriptive name,
%   where used and for what purpose

% Main program variables
var YesToInstructions : boolean
var grid : array 1 .. 13, 1 .. 15 of string (2)
%Introduction Window
var isIntroWindowOpen : boolean
var isFontWindowOpen : boolean
var exitGame : boolean
var num : int
var GameOver : boolean
var RedLife, WhiteLife, BlackLife, BlueLife : int
var bombArray : array 1 .. 13, 1 .. 15 of string (2)
var characterArray : array 1 .. 13, 1 .. 15 of string (2)
var playerArrayPosx : int
var playerArrayPosy : int
var playerPosx, playerPosy, bombPosx, bombPosy : int

proc setInitialGameValues
    YesToInstructions := false
    isIntroWindowOpen := false
    isFontWindowOpen := false
    GameOver := false
    exitGame := false
    RedLife := 0
    WhiteLife := 0
    BlackLife := 0
    BlueLife := 0
    playerArrayPosx := 2
    playerArrayPosy := 2
    playerPosx := 32
    playerPosy := maxy - 32 * 2
    bombPosx := -100
    bombPosy := -100
    for row : 1 .. upper (grid, 1)
	for col : 1 .. upper (grid, 2)
	    grid (row, col) := "BB"
	end for
    end for
    for row : 1 .. upper (grid, 1)
	grid (row, 1) := "SB"
	grid (row, upper (grid, 2)) := "SB"
    end for
    for col : 1 .. upper (grid, 2)
	grid (1, col) := "SB"
	grid (upper (grid, 1), col) := "SB"
    end for
    for row : 3 .. upper (grid, 1) - 2
	for col : 3 .. upper (grid, 2) - 2
	    if row div 2 not= row / 2 & col div 2 not= col / 2 then
		grid (row, col) := "SB"
	    end if
	end for
    end for
    for row : 1 .. upper (grid, 1)
	for col : 1 .. upper (grid, 2)
	    if grid (row, col) not= "SB" then
		num := Rand.Int (1, 5)
		if num = 1 then
		    grid (row, col) := "E"
		else
		    grid (row, col) := "BB"
		end if
	    end if
	end for
    end for
    grid (2, 3) := "E"
    grid (3, 2) := "E"
    grid (2, 13) := "E"
    grid (3, 14) := "E"
    grid (11, 2) := "E"
    grid (12, 3) := "E"
    grid (11, 14) := "E"
    grid (12, 13) := "E"
    grid (2, 2) := "E"
    grid (2, 14) := "E"
    grid (12, 2) := "E"
    grid (12, 14) := "E"
    for row : 1 .. upper (characterArray, 1)
	for col : 1 .. upper (characterArray, 2)
	    characterArray (row, col) := ""
	end for
    end for
    characterArray (2, 2) := "W"
    characterArray (2, 14) := "R"
    characterArray (12, 2) := "BU"
    characterArray (12, 14) := "BA"
    for row : 1 .. upper (bombArray, 1)
	for col : 1 .. upper (bombArray, 2)
	    bombArray (row, col) := ""
	end for
    end for
end setInitialGameValues

proc updatePlayerPos
    for i : 2 .. 12
	if playerPosx >= 32 * i and playerPosx < 32 * i + 32 then
	    for j : 2 .. 14
		if playerPosy <= maxy - 32 * j and playerPosy > maxy - 32 * j - 32 then
		    characterArray (playerArrayPosx, playerArrayPosy) := ""
		    characterArray (i + 1, j) := "W"
		    playerArrayPosx := i
		    playerArrayPosy := j 
		end if
	    end for
	end if
    end for
end updatePlayerPos
