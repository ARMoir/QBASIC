DECLARE FUNCTION SetFrame$ ()
RANDOMIZE TIMER

DIM SFrameString AS STRING
DIM FrameString AS STRING
DIM Directions AS STRING
DIM fWidth AS INTEGER
DIM Position AS INTEGER
DIM LenFrameString AS INTEGER
DIM Length AS INTEGER
DIM Locations(Length) AS INTEGER
DIM Feed AS INTEGER
DIM Food AS INTEGER
DIM Dead AS INTEGER
DIM Count AS INTEGER
DIM Speed AS DOUBLE

Directions = "NONE"
Length = 0
Feed = 0
Food = 0
Dead = 0
Count = 0
Speed = 0.50

CLS
SFrameString = SetFrame
FrameString = SFrameString
LenFrameString = LEN(FrameString)
DIM FrameChar(1 TO LEN(FrameString)) AS STRING
DIM SFrameChar(1 TO LEN(FrameString)) AS STRING

' Convert the string to an array of characters
FOR i = 1 TO LEN(FrameString)
	FrameChar(i) = MID$(FrameString, i, 1)
NEXT i

' Set the Values for Movement Calculations
DO
	fWidth = fWidth + 1
LOOP UNTIL FrameChar(fWidth) = CHR$(10)	

Position = (LEN(FrameString) / 2) + (fWidth / 2)

DO
	Count = Count + 1
	FrameString = SFrameString
	
	FOR i = 1 TO LEN(FrameString)
		FrameChar(i) = MID$(FrameString, i, 1)
	NEXT i
	
	IF Feed = 0 THEN
		Food = INT(RND * LEN(FrameString) + 1)
		IF FrameChar(Food) = " " THEN
			Feed = 1
		END IF
	END IF
	
	IF Feed = 1 THEN
		FrameChar(Food) = "*"
	END IF
    	
	key$ = INKEY$

	IF key$ <> "" THEN
	
		IF key$ = "w" THEN
			Directions = "UP"
		END IF
		
		IF key$ = "a" THEN
			Directions = "LEFT"
		END IF
		
		IF key$ = "s" THEN
			Directions = "DOWN"
		END IF
		
		IF key$ = "d" THEN
			Directions = "RIGHT"
		END IF
		
		IF key$ = "q" THEN
			EXIT DO
		END IF
		
	END IF
	
	IF Directions = "LEFT" THEN
		Position = Position - 1
	END IF 
		
	IF Directions = "RIGHT" THEN
		Position = Position + 1
	END IF
	
	IF Directions = "UP" THEN
		Position = Position - fWidth
	END IF
	
	IF Directions = "DOWN" THEN
		Position = Position + fWidth
	END IF
	
	
	
	REDIM PRESERVE Locations(Count) AS INTEGER
	Locations(Count) = Position
	
	IF FrameChar(Position) <> " " THEN	
		IF FrameChar(Position) = "*" THEN
			Feed = 0
			Length = Length + 1
			'Speed = Speed - 0.01
		ELSE		
			Dead = 1
		END IF
	END IF
	
	FOR i = (UBOUND(Locations) - 1) TO (UBOUND(Locations) - Length) STEP -1
		FrameChar(Locations(i)) = "O"
	NEXT i
	
	IF FrameChar(Position) = "O" THEN
		Dead = 1
	ELSE
		FrameChar(Position) = "0"
	END IF
			
	LenFrameString = LEN(FrameString)
	FrameString = ""
	
	FOR i = 1 TO LenFrameString
		FrameString = FrameString + FrameChar(i)
	NEXT i

	LOCATE 1, 1
	PRINT FrameString	
	PRINT "Score: "; Length
	'Start = TIMER
	'DO
    'LOOP UNTIL TIMER > Start + Speed

LOOP WHILE Dead = 0


FUNCTION SetFrame$
	DIM i AS INTEGER
	DIM FrameString AS STRING

	FrameString = CHR$(201)
	
	FOR i = 1 TO 28
		FrameString = FrameString + CHR$(205)
	NEXT i
	
	FrameString = FrameString + CHR$(187) + CHR$(10)
	
	FOR i = 1 TO 18
		FrameString = FrameString + CHR$(186) + _
		"                            " _
		+ CHR$(186) + CHR$(10)
	NEXT i
	
	FrameString = FrameString + CHR$(200)
	
	FOR i = 1 TO 28
		FrameString = FrameString + CHR$(205)
	NEXT i
	
	FrameString = FrameString + CHR$(188) + CHR$(10)

	SetFrame$ = FrameString
END FUNCTION

