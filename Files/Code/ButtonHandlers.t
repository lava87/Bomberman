% Button File - code to handle button events
% Intro Window Procedures
procedure QuitIntroWindowButtonPressed
    isIntroWindowOpen := false
    GUI.Quit
    GUI.ResetQuit
end QuitIntroWindowButtonPressed

procedure InstructionsButtonPressed
    YesToInstructions := true
    GUI.Quit
    GUI.ResetQuit
end InstructionsButtonPressed
