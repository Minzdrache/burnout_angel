# game_programming
Author of this game: Minzfee
Game on Itch.io: https://minzfee.itch.io/burnout-angel
Video Pitch on YouTube: https://youtu.be/q4zrjPt8Zxo

This repo saves my efforts for the class game programming of semester 7 of my artificial intelligence bachelor.
The game engine is Godot 4!


progress:
* 13.12.2024: initialized git for this project 
* 14.12.2024: 
    fixed "start game" button to activate the timeline "000triggers"
    dialouge for stat introduction in "002first_day"
    added scene calendartest with containers for a weekly planning 
* 15.12.2024: 
    worked on calendar management items: 
    added small and big boxes in 2 scenes https://www.youtube.com/watch?v=cNvzGKCkNXg&t=447s
    (when the correct small box is put into the correct big box, the big box changes color )
    user can drag small boxes
* 28.12.2024:
    saved background images
* 02.01.2025: 
    Drag and Drop works from one source_container to one target_container
    added main_menu https://www.youtube.com/watch?v=zHYkcJyE52g more good stuff on: https://cococode.net/godot
    added font for title
    made first visual progress bar
* 03.01.2025:
    progress bars are visible in calender scene
    progress bars get updated (I think)
    calendar choosing activities from source to target_container works, updates stats
* 04.01.2025:
    real character picture, changes mood in Dialogic for Lory
    nice start menu, start game leads to first dialouge
    pause game implemented with pause_manager (must be in every scene)
    menu in game with current day, level and experience
    hovering over progress bars shows their name
    dragging a calendar activity shows its stat changes
    "start day" button in calender scene -> loads next scene 
    progress bars get updated every frame
    doctor visit 1 as scene and timeline, scene has button "go home" that loads the next activity
* 05.01.2025: 
    status bars update themselves
    journal minigame (in progress), fixed: progress bars update as result of finishing journal minigame
    connect scenes to get fully playable game, minor fix: connected main_menu with bedroom and bedroom with timelines
    made font equal everywhere (except the source and target container of calendar, except the dialouge (maybe find a better font for dialouges)...)
* 06.01.2025:
    minor fixes in dialouges
     fixed bug: nach Main_menu kommt man auf bedroom, von hier aus startet dann 001triggers timeline,
     nach 002first_day kommt man zurück ins bedroom, klickt "next_activity" und kommt zum Kalender (1. Aktivität läuft an), es läuft alles gut bis man wieder im Bedroom ist und auf "next_activity" klickt, dann startet 001triggers erneut...
     fix used: made started_timelines a global variable (instead of a local var in bedroom (this resets every time the scene is left!))
    fixed bug: in game when journal comes, every letter gets a seperate line... like:
      I  
      a
      m
    fixed bug: journal entry in "You finished your first game" is "placeholder..." (only appears in full game)
    fixed bug: activity_doctor, activity_walk has local variable that should be public "counter"
* 12.01.2025: 
    after all 3 activities are done, make gratitude journal (with timeline intro )
    made "next activity" into an extra scene that is included in all scenes (where it is necessary)
    fixes repülayability: when you reach the end and want to play again, reset_ all variables in stats_manager and activities_manager
    write extra function to reset stats, not do each individually in start button
    fixed bug: bars dont move... (was because the update function in stats_manager was wrong)
    fixed bug: doctor choice looks odd
    added cafe music, added walking sounds
    added picture with facial expressions for angel
    test dialouges without backgrounds ( so the stat bars show...)
* 13.01.2025
    fixed bug: activity_walk dialouge does not get played
    before journaling: implemented a dialouge
    uploaded game to https://minzfee.itch.io/burnout-angel
    link to survey: https://minzfee.limesurvey.net/271731
* 16.01.2025
    opened experimental branch develop2
    added calendar icon to ingame menu on top (with one time glow effect)

    Feedback from users: want dialouge boxes to scroll up, want status bars (I thought  they were visible?)
         want explanation on how to navigate the game (with space or click)
* 19.01.2025
    feedback from users implemented
    calendar glow now bigger 
    shortened the sound for cafe
    
todo:
    after mindfullness I can't go on to the journaling
    make "next" and similar buttons into extra script and include them....
    fix font in source and target container of calendar
    get sounds to all dialouge scenes, and cut the sound of the cafeteria...
    make all buttons in same design (like in main_menu)
   

    additional character ideas: 
        angel? change colors and add wings https://noranekogames.itch.io/chie-free-character-sprite
        girlfriend Valerie: https://noranekogames.itch.io/natsumi 
        little sister: https://noranekogames.itch.io/suminewstyle
        friend: https://noranekogames.itch.io/sora-newstyle-free-to-use-sprite https://noranekogames.itch.io/kana 

