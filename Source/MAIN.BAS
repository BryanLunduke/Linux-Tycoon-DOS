DECLARE SUB DoRandomEvents ()
DECLARE FUNCTION GetPackageIndexInMyDistro (PackType AS INTEGER) AS INTEGER
'$FORM Pack
DECLARE SUB LogEvent (NewMessage AS STRING)
DECLARE SUB NewUsersMe ()
DECLARE SUB NewUsersAll ()
DECLARE SUB NewBugs ()
DECLARE SUB SortAllDistros ()
DECLARE SUB InitGameData ()
DECLARE SUB BuildDistroList ()
' Software Types Constants
CONST kTypeWebBrowser = 1
CONST kTypeOfficeSuite = 2
CONST kTypeDesktopEnvironment = 3
CONST kTypeGame = 4
CONST kTypeGraphics = 5
CONST kTypeProgramming = 6
CONST kTypeCommunication = 7
CONST kTypeUtility = 8
CONST kTypeMultimedia = 9

' Packages
TYPE Package
    Name AS STRING * 30
    Bugs AS INTEGER
    Description AS STRING * 80
    NerdCred AS INTEGER
    Popularity AS INTEGER
    SizeInMB AS INTEGER
    Version AS INTEGER
    isOpenSource AS INTEGER
    TypeOfSoftware AS INTEGER
END TYPE

' Distro storage
TYPE Distro
    Name AS STRING * 30
    Bugs AS INTEGER
    Hype AS INTEGER
    PackPop AS INTEGER
    PackCred AS INTEGER

    Size AS INTEGER
    Users AS LONG
    Version AS INTEGER
    AgeInDays AS INTEGER
    WorkersPaid AS INTEGER
    WorkersVolunteers AS INTEGER
END TYPE

DIM SHARED AllPackages(40) AS Package
DIM SHARED AllDistros(20) AS Distro
DIM SHARED MyDistro AS Distro
DIM SHARED tempDistro AS Distro
DIM SHARED tempPackage AS Package
DIM SHARED MyDistroPackages(40) AS INTEGER
DIM SHARED CurrentDay AS INTEGER
DIM SHARED gameSpeed AS INTEGER


'$FORM GameForm

InitGameData
gameSpeed = 1
MyDistro.Name = INPUTBOX$("Name your new Linux Distro.", "", "MyDistro")
IF LTRIM$(RTRIM$(MyDistro.Name)) = "" THEN
    MyDistro.Name = "Nuthin'"
ELSE
    GameForm.SHOW
    GameForm.timeUpdate.Interval = 1
    GameForm.timeRank.Interval = 1
END IF

SUB BuildDistroList ()

    'Build out the Package List

    AllPackages(1).Name = "Midget"
    AllPackages(1).Bugs = 2
    AllPackages(1).Description = "Lightweight, simple desktop envrionment"
    AllPackages(1).NerdCred = 3
    AllPackages(1).Popularity = 20
    AllPackages(1).SizeInMB = 20
    AllPackages(1).Version = 1
    AllPackages(1).isOpenSource = 1
    AllPackages(1).TypeOfSoftware = kTypeDesktopEnvironment

    AllPackages(2).Name = "QDE"
    AllPackages(2).Bugs = 3
    AllPackages(2).Description = "The Q Desktop Environment.  Lots of widgets."
    AllPackages(2).NerdCred = 3
    AllPackages(2).Popularity = 10
    AllPackages(2).SizeInMB = 50
    AllPackages(2).Version = 1
    AllPackages(2).isOpenSource = 1
    AllPackages(2).TypeOfSoftware = kTypeDesktopEnvironment

    AllPackages(3).Name = "UCDE"
    AllPackages(3).Bugs = 0
    AllPackages(3).Description = "The Ultra Confusing Desktop Environment"
    AllPackages(3).NerdCred = 20
    AllPackages(3).Popularity = 1
    AllPackages(3).SizeInMB = 1
    AllPackages(3).Version = 1
    AllPackages(3).isOpenSource = 1
    AllPackages(3).TypeOfSoftware = kTypeDesktopEnvironment



    AllPackages(4).Name = "FlamingRodent"
    AllPackages(4).Bugs = 4
    AllPackages(4).Description = "A big, powerful web browser"
    AllPackages(4).NerdCred = 3
    AllPackages(4).Popularity = 15
    AllPackages(4).SizeInMB = 10
    AllPackages(4).Version = 1
    AllPackages(4).isOpenSource = 1
    AllPackages(4).TypeOfSoftware = kTypeWebBrowser

    AllPackages(5).Name = "ShmoogleShrome"
    AllPackages(5).Bugs = 2
    AllPackages(5).Description = "Lightweight and superfast browser"
    AllPackages(5).NerdCred = 3
    AllPackages(5).Popularity = 10
    AllPackages(5).SizeInMB = 10
    AllPackages(5).Version = 1
    AllPackages(5).isOpenSource = 1
    AllPackages(5).TypeOfSoftware = kTypeWebBrowser

    AllPackages(6).Name = "Text-O-Web"
    AllPackages(6).Bugs = 0
    AllPackages(6).Description = "A text only web browser that runs in the terminal"
    AllPackages(6).NerdCred = 20
    AllPackages(6).Popularity = 0
    AllPackages(6).SizeInMB = 1
    AllPackages(6).Version = 1
    AllPackages(6).isOpenSource = 1
    AllPackages(6).TypeOfSoftware = kTypeWebBrowser



    AllPackages(7).Name = "ReallyFreeOfiice"
    AllPackages(7).Bugs = 4
    AllPackages(7).Description = "A big, powerful office suite"
    AllPackages(7).NerdCred = 5
    AllPackages(7).Popularity = 15
    AllPackages(7).SizeInMB = 60
    AllPackages(7).Version = 1
    AllPackages(7).isOpenSource = 1
    AllPackages(7).TypeOfSoftware = kTypeOfficeSuite

    AllPackages(8).Name = "SpAnDeX"
    AllPackages(8).Bugs = 1
    AllPackages(8).Description = "Hard to use and complicated way to build documents"
    AllPackages(8).NerdCred = 15
    AllPackages(8).Popularity = 2
    AllPackages(8).SizeInMB = 3
    AllPackages(8).Version = 1
    AllPackages(8).isOpenSource = 1
    AllPackages(8).TypeOfSoftware = kTypeOfficeSuite

    AllPackages(9).Name = "OkayOffice"
    AllPackages(9).Bugs = 1
    AllPackages(9).Description = "This office suite... is pretty ok"
    AllPackages(9).NerdCred = 10
    AllPackages(9).Popularity = 10
    AllPackages(9).SizeInMB = 40
    AllPackages(9).Version = 1
    AllPackages(9).isOpenSource = 1
    AllPackages(9).TypeOfSoftware = kTypeOfficeSuite



    AllPackages(10).Name = "PenguinZoomer"
    AllPackages(10).Bugs = 1
    AllPackages(10).Description = "Race around and pretend that penguins are like cars"
    AllPackages(10).NerdCred = 3
    AllPackages(10).Popularity = 8
    AllPackages(10).SizeInMB = 20
    AllPackages(10).Version = 1
    AllPackages(10).isOpenSource = 1
    AllPackages(10).TypeOfSoftware = kTypeGame

    AllPackages(11).Name = "FragBlast4000"
    AllPackages(11).Bugs = 5
    AllPackages(11).Description = "Fancy 3D graphics and fast paced shooting of other people"
    AllPackages(11).NerdCred = 1
    AllPackages(11).Popularity = 15
    AllPackages(11).SizeInMB = 120
    AllPackages(11).Version = 1
    AllPackages(11).isOpenSource = 0
    AllPackages(11).TypeOfSoftware = kTypeGame

    AllPackages(12).Name = "BurstABubble"
    AllPackages(12).Bugs = 0
    AllPackages(12).Description = "There are bubbles.  You hate bubbles.  Pop those bubbles."
    AllPackages(12).NerdCred = 0
    AllPackages(12).Popularity = 20
    AllPackages(12).SizeInMB = 25
    AllPackages(12).Version = 1
    AllPackages(12).isOpenSource = 1
    AllPackages(12).TypeOfSoftware = kTypeGame

    AllPackages(13).Name = "JustCards"
    AllPackages(13).Bugs = 0
    AllPackages(13).Description = "It's a card game"
    AllPackages(13).NerdCred = 0
    AllPackages(13).Popularity = 5
    AllPackages(13).SizeInMB = 20
    AllPackages(13).Version = 1
    AllPackages(13).isOpenSource = 1
    AllPackages(13).TypeOfSoftware = kTypeGame

    AllPackages(14).Name = "TapYerToes"
    AllPackages(14).Bugs = 1
    AllPackages(14).Description = "Tap your toes to the beat of very boring music."
    AllPackages(14).NerdCred = 0
    AllPackages(14).Popularity = 1
    AllPackages(14).SizeInMB = 15
    AllPackages(14).Version = 1
    AllPackages(14).isOpenSource = 1
    AllPackages(14).TypeOfSoftware = kTypeGame

    AllPackages(15).Name = "CityMax"
    AllPackages(15).Bugs = 2
    AllPackages(15).Description = "Design and run a very fancy city."
    AllPackages(15).NerdCred = 0
    AllPackages(15).Popularity = 15
    AllPackages(15).SizeInMB = 120
    AllPackages(15).Version = 1
    AllPackages(15).isOpenSource = 0
    AllPackages(15).TypeOfSoftware = kTypeGame

    AllPackages(16).Name = "CoutTrainer"
    AllPackages(16).Bugs = 3
    AllPackages(16).Description = "Teach a couch how to be a good couch."
    AllPackages(16).NerdCred = 0
    AllPackages(16).Popularity = 5
    AllPackages(16).SizeInMB = 65
    AllPackages(16).Version = 1
    AllPackages(16).isOpenSource = 1
    AllPackages(16).TypeOfSoftware = kTypeGame




    AllPackages(17).Name = "PixelPusher"
    AllPackages(17).Bugs = 0
    AllPackages(17).Description = "A very simple image editor."
    AllPackages(17).NerdCred = 1
    AllPackages(17).Popularity = 2
    AllPackages(17).SizeInMB = 2
    AllPackages(17).Version = 1
    AllPackages(17).isOpenSource = 1
    AllPackages(17).TypeOfSoftware = kTypeGraphics

    AllPackages(18).Name = "The Dork"
    AllPackages(18).Bugs = 2
    AllPackages(18).Description = "Robust, powerful graphics editor."
    AllPackages(18).NerdCred = 5
    AllPackages(18).Popularity = 12
    AllPackages(18).SizeInMB = 65
    AllPackages(18).Version = 1
    AllPackages(18).isOpenSource = 1
    AllPackages(18).TypeOfSoftware = kTypeGraphics

    AllPackages(19).Name = "Pictures-In-Folders"
    AllPackages(19).Bugs = 0
    AllPackages(19).Description = "A simple photo gallery for organizing images."
    AllPackages(19).NerdCred = 0
    AllPackages(19).Popularity = 8
    AllPackages(19).SizeInMB = 8
    AllPackages(19).Version = 1
    AllPackages(19).isOpenSource = 1
    AllPackages(19).TypeOfSoftware = kTypeGraphics

    AllPackages(20).Name = "PainterMcPaint"
    AllPackages(20).Bugs = 1
    AllPackages(20).Description = "Good for painting.  Bad for anything else."
    AllPackages(20).NerdCred = 0
    AllPackages(20).Popularity = 3
    AllPackages(20).SizeInMB = 150
    AllPackages(20).Version = 1
    AllPackages(20).isOpenSource = 1
    AllPackages(20).TypeOfSoftware = kTypeGraphics




    AllPackages(21).Name = "LunarBlackout"
    AllPackages(21).Bugs = 4
    AllPackages(21).Description = "A good, flexible integrated development environment."
    AllPackages(21).NerdCred = 10
    AllPackages(21).Popularity = 4
    AllPackages(21).SizeInMB = 120
    AllPackages(21).Version = 1
    AllPackages(21).isOpenSource = 1
    AllPackages(21).TypeOfSoftware = kTypeProgramming

    AllPackages(22).Name = "JustPascal"
    AllPackages(22).Bugs = 0
    AllPackages(22).Description = "Pascal compiler."
    AllPackages(22).NerdCred = 11
    AllPackages(22).Popularity = 1
    AllPackages(22).SizeInMB = 40
    AllPackages(22).Version = 1
    AllPackages(22).isOpenSource = 1
    AllPackages(22).TypeOfSoftware = kTypeProgramming

    AllPackages(23).Name = "Lunduke Development Kit"
    AllPackages(23).Bugs = 0
    AllPackages(23).Description = "The most awesome programming language.  Ever."
    AllPackages(23).NerdCred = 15
    AllPackages(23).Popularity = 15
    AllPackages(23).SizeInMB = 10
    AllPackages(23).Version = 1
    AllPackages(23).isOpenSource = 1
    AllPackages(23).TypeOfSoftware = kTypeProgramming

    AllPackages(24).Name = "LargeTalk"
    AllPackages(24).Bugs = 0
    AllPackages(24).Description = "The grand-daddy of programming tools."
    AllPackages(24).NerdCred = 20
    AllPackages(24).Popularity = 2
    AllPackages(24).SizeInMB = 10
    AllPackages(24).Version = 1
    AllPackages(24).isOpenSource = 1
    AllPackages(24).TypeOfSoftware = kTypeProgramming

    AllPackages(25).Name = "EchsCode"
    AllPackages(25).Bugs = 7
    AllPackages(25).Description = "This is a terrible development environment.  Nobody likes it."
    AllPackages(25).NerdCred = 0
    AllPackages(25).Popularity = 0
    AllPackages(25).SizeInMB = 900
    AllPackages(25).Version = 1
    AllPackages(25).isOpenSource = 0
    AllPackages(25).TypeOfSoftware = kTypeProgramming




    AllPackages(26).Name = "Mailinator"
    AllPackages(26).Bugs = 1
    AllPackages(26).Description = "Super advanced email client"
    AllPackages(26).NerdCred = 0
    AllPackages(26).Popularity = 12
    AllPackages(26).SizeInMB = 80
    AllPackages(26).Version = 1
    AllPackages(26).isOpenSource = 1
    AllPackages(26).TypeOfSoftware = kTypeCommunication

    AllPackages(27).Name = "Chatchatchat"
    AllPackages(27).Bugs = 1
    AllPackages(27).Description = "You know.  For chatting."
    AllPackages(27).NerdCred = 0
    AllPackages(27).Popularity = 5
    AllPackages(27).SizeInMB = 50
    AllPackages(27).Version = 1
    AllPackages(27).isOpenSource = 1
    AllPackages(27).TypeOfSoftware = kTypeCommunication

    AllPackages(28).Name = "Fir"
    AllPackages(28).Bugs = 0
    AllPackages(28).Description = "Terminal-only email client."
    AllPackages(28).NerdCred = 5
    AllPackages(28).Popularity = 1
    AllPackages(28).SizeInMB = 1
    AllPackages(28).Version = 1
    AllPackages(28).isOpenSource = 1
    AllPackages(28).TypeOfSoftware = kTypeCommunication

    AllPackages(29).Name = "IRC-o-Matic"
    AllPackages(29).Bugs = 3
    AllPackages(29).Description = "The only IRC client that matters."
    AllPackages(29).NerdCred = 4
    AllPackages(29).Popularity = 2
    AllPackages(29).SizeInMB = 6
    AllPackages(29).Version = 1
    AllPackages(29).isOpenSource = 1
    AllPackages(29).TypeOfSoftware = kTypeCommunication




    AllPackages(30).Name = "Calculator"
    AllPackages(30).Bugs = 0
    AllPackages(30).Description = "You do want a calculator, don't you?"
    AllPackages(30).NerdCred = 0
    AllPackages(30).Popularity = 1
    AllPackages(30).SizeInMB = 1
    AllPackages(30).Version = 1
    AllPackages(30).isOpenSource = 1
    AllPackages(30).TypeOfSoftware = kTypeUtility
    



    AllPackages(31).Name = "Video Player Thing"
    AllPackages(31).Bugs = 3
    AllPackages(31).Description = "Plays videos.  Sometimes.  Then it crashes."
    AllPackages(31).NerdCred = 0
    AllPackages(31).Popularity = 1
    AllPackages(31).SizeInMB = 10
    AllPackages(31).Version = 1
    AllPackages(31).isOpenSource = 1
    AllPackages(31).TypeOfSoftware = kTypeMultimedia

    AllPackages(32).Name = "vidCastGrabber"
    AllPackages(32).Bugs = 1
    AllPackages(32).Description = "Downloads and plays video podcasts."
    AllPackages(32).NerdCred = 0
    AllPackages(32).Popularity = 3
    AllPackages(32).SizeInMB = 55
    AllPackages(32).Version = 1
    AllPackages(32).isOpenSource = 1
    AllPackages(32).TypeOfSoftware = kTypeMultimedia

    AllPackages(33).Name = "emTeeVee"
    AllPackages(33).Bugs = 2
    AllPackages(33).Description = "Automatically generates music videos."
    AllPackages(33).NerdCred = 0
    AllPackages(33).Popularity = 2
    AllPackages(33).SizeInMB = 120
    AllPackages(33).Version = 1
    AllPackages(33).isOpenSource = 0
    AllPackages(33).TypeOfSoftware = kTypeMultimedia


    'Set MyDistro
    MyDistro.Name = "MyDistro"
    MyDistro.Users = 0


    'Build out the Distro List
    AllDistros(1).Name = "Ooboontoo"
    AllDistros(1).Users = 100000
    AllDistros(2).Name = "FloppyBeanie"
    AllDistros(2).Users = 50000
    AllDistros(3).Name = "xTr333m3"
    AllDistros(3).Users = 25000
    AllDistros(4).Name = "CuteLittleDoggy"
    AllDistros(4).Users = 15000
    AllDistros(5).Name = "Trumpet"
    AllDistros(5).Users = 1
    AllDistros(6).Name = "Kooboontoo"
    AllDistros(6).Users = 45000
    AllDistros(7).Name = "LooseWare"
    AllDistros(7).Users = 5000
    AllDistros(8).Name = "OpenSnuggle"
    AllDistros(8).Users = 500
    AllDistros(9).Name = "TeddyBearLinux"
    AllDistros(9).Users = 50
    AllDistros(10).Name = "ReduntantLinux"
    AllDistros(10).Users = 200
    AllDistros(11).Name = "Plebian"
    AllDistros(11).Users = 8500
    AllDistros(12).Name = "b00nd0x"
    AllDistros(12).Users = 2500
    AllDistros(13).Name = "FreeHugz"
    AllDistros(13).Users = 900
    AllDistros(14).Name = "Derpnix"
    AllDistros(14).Users = 800
    AllDistros(15).Name = "Unpronounceable"
    AllDistros(15).Users = 1500
    AllDistros(16).Name = "Lozenge"
    AllDistros(16).Users = 4200
    AllDistros(17).Name = "Gat3way"
    AllDistros(17).Users = 3350
    AllDistros(18).Name = "Prune"
    AllDistros(18).Users = 810
    AllDistros(19).Name = "ChakaLaka"
    AllDistros(19).Users = 2100
    AllDistros(20).Name = "SunGlassesNix"
    AllDistros(20).Users = 15



END SUB

SUB CalculateSize ()
    DIM i AS INTEGER
    DIM totalSize AS INTEGER
    DIM totalBugs AS INTEGER
    DIM totalCred AS INTEGER
    DIM totalPop AS INTEGER
    DIM packIndex AS INTEGER


    totalSize = 0
    totalBugs = 0
    totalCred = 0
    totalPop = 0

    FOR i = 1 TO 39

        IF MyDistroPackages(i) = 1 THEN
            tempPackage = AllPackages(i)
            totalSize = totalSize + tempPackage.SizeInMB
            totalBugs = totalBugs + tempPackage.Bugs
            totalCred = totalCred + tempPackage.NerdCred
            totalPop = totalPop + tempPackage.Popularity
        END IF

    NEXT i

    MyDistro.Size = totalSize
    MyDistro.Bugs = totalBugs
    MyDistro.PackPop = totalPop
    MyDistro.PackCred = totalCred

END SUB

SUB DoDailyUpdates ()

    IF gameSpeed > 0 THEN

    'Decrease Hype
    IF MyDistro.Hype > 0 THEN
        MyDistro.Hype = MyDistro.Hype - 1
    ELSEIF MyDistro.Hype < 0 THEN
        MyDistro.Hype = MyDistro.Hype + 1
    END IF


    'Increment Age and Day
    MyDistro.AgeInDays = MyDistro.AgeInDays + 1
    CurrentDay = CurrentDay + 1

    'Add new bugs
    NewBugs

    'Calculate User Gain/Loss for MyDistro
    NewUsersMe

    'Calculate User Gain/Loss for AllDistros
    NewUsersAll

    'Run Random Events
    DoRandomEvents

    END IF

END SUB

SUB DoRandomEvents ()

    DIM userGain AS INTEGER
    DIM rndGain AS SINGLE
    DIM theNum AS INTEGER

    rndGain = RND

    theNum = rndGain * 500

    IF theNum = 20 THEN
        LogEvent ("Your latest version got reviewed favorably in a major magazine!  Hype boost!")
        MyDistro.Hype = MyDistro.Hype + 10
    END IF

    IF theNum = 21 THEN
        LogEvent ("Your latest version got reviewed poorly in a major magazine!  Ut-Oh!")
        MyDistro.Hype = MyDistro.Hype - 10
    END IF

    IF theNum = 22 THEN
        LogEvent ("A new version of Windews is out!  And... it's not so good.  Linux usage goes up!")
        MyDistro.Hype = MyDistro.Hype + 10
    END IF

    IF theNum = 23 THEN
        LogEvent ("A new version of Windows is out!  And... it's... actually pretty good.")
        MyDistro.Hype = MyDistro.Hype - 10
    END IF

    IF theNum = 24 THEN
        IF MyDistro.AgeInDays > 100 THEN
            LogEvent ("It's been a long time since your last release.  Users are getting bored.")
            MyDistro.Hype = MyDistro.Hype - 10
        END IF
    END IF

    IF theNum = 25 THEN
        LogEvent ("Bryan's goats chewed on your power cables.  Productivity goes down.")
        MyDistro.Hype = MyDistro.Hype - 10
    END IF

    IF theNum = 26 THEN
        IF MyDistro.Size < 40 THEN
            LogEvent ("Your Distro has gained a reputation as being super lightweight.  Well done!")
            MyDistro.Hype = MyDistro.Hype + 20
        END IF
    END IF

    IF theNum = 27 THEN
        IF MyDistro.Size > 800 THEN
            LogEvent ("Your Distro is too big to fit on a CD.  That makes people cranky.")
            MyDistro.Hype = MyDistro.Hype - 20
        END IF
    END IF



END SUB

SUB DoUpdateRank ()

    DIM i AS INTEGER
    DIM dName AS STRING * 30

    SortAllDistros

    'Clear the list
    IF GameForm.ListDistroRank.ListCount > 0 THEN
    FOR i = 1 TO GameForm.ListDistroRank.ListCount
        GameForm.ListDistroRank.REMOVEITEM 0
    NEXT i
    END IF


    'Add Everything
    FOR i = 1 TO 20
        tempDistro = AllDistros(i)
        dName$ = STR$(tempDistro.Users) + " - " + tempDistro.Name$
        GameForm.ListDistroRank.ADDITEM dName
    NEXT i

END SUB

SUB DoUpdateUI ()
    DIM tempStr AS STRING * 10
    DIM tempInt AS INTEGER
    DIM tempLong AS LONG

    GameForm.lblName.caption = RTRIM$(MyDistro.Name)

    tempInt = MyDistro.Version
    GameForm.lblVer.caption = LTRIM$(STR$(tempInt)) + ".0"

    tempLong = MyDistro.Users
    GameForm.lblUsers.caption = LTRIM$(STR$(tempLong))

    tempInt = MyDistro.AgeInDays
    IF MyDistro.Version > 0 THEN
        GameForm.lblAge.caption = LTRIM$(STR$(tempInt)) + " days"
    ELSE
        GameForm.lblAge.caption = "UNRELEASED"
    END IF

    GameForm.lblGameAge.caption = STR$(CurrentDay)

    tempInt = MyDistro.WorkersPaid
    GameForm.lblPaid.caption = LTRIM$(STR$(tempInt)) + "/" + LTRIM$(STR$(tempInt))

    tempInt = MyDistro.WorkersVolunteers
    GameForm.lblVol.caption = LTRIM$(STR$(tempInt)) + "/" + LTRIM$(STR$(tempInt))

    tempInt = MyDistro.Hype
    GameForm.lblHype.caption = LTRIM$(STR$(tempInt))

    tempInt = MyDistro.Bugs
    GameForm.lblBugs.caption = LTRIM$(STR$(tempInt))

    tempInt = MyDistro.Size
    GameForm.lblSize.caption = LTRIM$(STR$(tempInt))


END SUB

FUNCTION GetPackageIndexInMyDistro (PackType AS INTEGER) AS INTEGER

   ' DIM i AS INTEGER
   ' DIM theIndex AS INTEGER

   ' theIndex = -1

   ' FOR i = 1 TO 39

   '     IF MyDistroPackages(i) = PackType THEN
   '           theIndex = i
   '     END IF

   ' NEXT

   ' GetPackageIndexInMyDistro = theIndex

END FUNCTION

SUB InitGameData ()
    BuildDistroList
END SUB

SUB LogEvent (NewMessage AS STRING)

    DIM TheMessage AS STRING

    TheMessage = "[Day: " + LTRIM$(STR$(CurrentDay)) + "] - " + NewMessage + CHR$(13) + CHR$(13)

    GameForm.txtEvents.text = RTRIM$(TheMessage) + GameForm.txtEvents.text


END SUB

SUB MakeNewRelease ()

    'Increment version number
    MyDistro.Version = MyDistro.Version + 1

    'Add to Hype
    MyDistro.Hype = MyDistro.Hype + 5

    'Display Release message
    MSGBOX ("Version " + LTRIM$(STR$(MyDistro.Version)) + ".0 of " + RTRIM$(MyDistro.Name) + " has been released!  Time to sit back and enjoy fame and fortune.")
    LogEvent ("Version " + LTRIM$(STR$(MyDistro.Version)) + ".0 of " + RTRIM$(MyDistro.Name) + " has been released!")

    'Reset Age In Days
    MyDistro.AgeInDays = 0

END SUB

SUB NewBugs ()
    DIM i AS INTEGER
    DIM rndBug AS SINGLE
    DIM packIndex AS INTEGER

    FOR i = 1 TO 39

        rndBug = RND
        'GameForm.txtEvents.text = GameForm.txtEvents.text + STR$(rndBug)
        IF rndBug > .995 THEN

            tempPackage = AllPackages(i)
            tempPackage.Bugs = tempPackage.Bugs + 1
            'GameForm.txtEvents.text = GameForm.txtEvents.text + tempPackage.Name

        END IF


    NEXT i

END SUB

SUB NewUsersAll ()

    DIM i AS INTEGER
    DIM dName AS STRING * 30
    DIM userGain AS INTEGER
    DIM rndGain AS SINGLE

    'Loop Through each Distro
    FOR i = 1 TO 20
        tempDistro = AllDistros(i)
        rndGain = RND

        IF rndGain > .5 THEN
            userGain = rndGain * 10
            tempDistro.Users = tempDistro.Users + userGain
            AllDistros(i) = tempDistro
        END IF


        IF rndGain < .5 THEN
            userGain = rndGain * 5
            tempDistro.Users = tempDistro.Users - userGain
            AllDistros(i) = tempDistro

        END IF

    NEXT i


END SUB

SUB NewUsersMe ()

    DIM i AS INTEGER
    DIM userGain AS LONG
    DIM rndGain AS SINGLE
    DIM gainPotential AS LONG

    gainPotential = MyDistro.PackCred + MyDistro.PackPop

    rndGain = RND

    'Set the usergain
    userGain = (rndGain * gainPotential) / 2

    userGain = userGain + MyDistro.Hype

    'If Distro doesn't fit on a CD
    IF MyDistro.Size > 700 THEN
        userGain = userGain * .5
    END IF

    IF MyDistro.Version > 0 THEN
        MyDistro.Users = MyDistro.Users + userGain
    END IF


END SUB

SUB PackIncludeChecked ()
    IF Pack.chkInclude.value = 1 THEN

        MyDistroPackages(Pack.listPackages.listindex + 1) = 1

    ELSE

        MyDistroPackages(Pack.listPackages.listindex + 1) = 0


    END IF

END SUB

SUB PackRefreshList ()

    'Loop through and add all of the packages


    DIM i AS INTEGER
    DIM dName AS STRING * 30

    'Clear the list
    IF Pack.listPackages.ListCount > 0 THEN
    FOR i = 1 TO Pack.listPackages.ListCount
        Pack.listPackages.REMOVEITEM 0
    NEXT i
    END IF


    'Add All Packages
    FOR i = 1 TO 39
        tempPackage = AllPackages(i)
        IF tempPackage.TypeOfSoftware > 0 THEN
            dName$ = RTRIM$(tempPackage.Name)
            Pack.listPackages.ADDITEM dName
        END IF
    NEXT i



END SUB

SUB PackSelectedDetail ()

    'Populate the UI with details of the selected package

    tempPackage = AllPackages(Pack.listPackages.listindex + 1)


    Pack.lblName.caption = tempPackage.Name
    Pack.lblDesc.caption = tempPackage.Description
    Pack.lblBugs.caption = LTRIM$(STR$(tempPackage.Bugs))
    Pack.lblNerdCred.caption = LTRIM$(STR$(tempPackage.NerdCred))
    Pack.lblPop.caption = LTRIM$(STR$(tempPackage.Popularity))
    Pack.lblSize.caption = LTRIM$(STR$(tempPackage.SizeInMB))
    Pack.lblVer.caption = LTRIM$(STR$(tempPackage.Version))

    Pack.lblOS.caption = LTRIM$(STR$(tempPackage.isOpenSource))

    IF tempPackage.isOpenSource = 0 THEN
        Pack.lblOS.caption = "No"
    ELSE
        Pack.lblOS.caption = "Yes"
    END IF


    'Pack.lblType.caption = LTRIM$(STR$(tempPackage.TypeOfSoftware))
    IF tempPackage.TypeOfSoftware = kTypeWebBrowser THEN
        Pack.lblType.caption = "Web Browser"
    ELSEIF tempPackage.TypeOfSoftware = kTypeOfficeSuite THEN
        Pack.lblType.caption = "Office Suite"
    ELSEIF tempPackage.TypeOfSoftware = kTypeDesktopEnvironment THEN
        Pack.lblType.caption = "Desktop Environment"
    ELSEIF tempPackage.TypeOfSoftware = kTypeGame THEN
        Pack.lblType.caption = "Game"
    ELSEIF tempPackage.TypeOfSoftware = kTypeGraphics THEN
        Pack.lblType.caption = "Graphics"
    ELSEIF tempPackage.TypeOfSoftware = kTypeProgramming THEN
        Pack.lblType.caption = "Programming"
    ELSEIF tempPackage.TypeOfSoftware = kTypeCommunication THEN
        Pack.lblType.caption = "Communication"
    ELSEIF tempPackage.TypeOfSoftware = kTypeUtility THEN
        Pack.lblType.caption = "Utility"
    ELSEIF tempPackage.TypeOfSoftware = kTypeMultimedia THEN
        Pack.lblType.caption = "Multimedia"
    END IF

    IF MyDistroPackages(Pack.listPackages.listindex + 1) = 1 THEN
          Pack.chkInclude.value = 1
    ELSE
          Pack.chkInclude.value = 0
    END IF


    'IF GetPackageIndexInMyDistro(tempPackage.TypeOfSoftware) > -1 THEN
    '      chkInclude.value = 1
    'ELSE
    '      chkInclude.value = 0
    'END IF



END SUB

SUB PauseClicked ()
    IF GameForm.btnPause.caption = "||" THEN
        GameForm.btnPause.caption = ">>"
        gameSpeed = 0
    ELSEIF GameForm.btnPause.caption = ">>" THEN
        GameForm.btnPause.caption = "||"
        gameSpeed = 1
    END IF

END SUB

SUB SortAllDistros ()

    FOR i = 1 TO UBOUND(AllDistros) - 1
        FOR j = 1 TO UBOUND(AllDistros) - 1

            tempDistro = AllDistros(j)
            jUsers = tempDistro.Users
            tempDistro = AllDistros(j + 1)
            jPlusUsers = tempDistro.Users

            IF jUsers < jPlusUsers THEN
                SWAP AllDistros(j), AllDistros(j + 1)
            END IF

        NEXT j
    NEXT i
    
END SUB

