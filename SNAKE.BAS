DECLARE FUNCTION SetFrame$ ()
RANDOMIZE TIMER
DIM Frame AS STRING
DIM FrameString AS STRING
DIM Directions AS STRING
DIM Wide AS INTEGER
DIM Position AS INTEGER
DIM FrameLength AS INTEGER
DIM Length AS INTEGER
DIM Locations(Length) AS INTEGER
DIM Feed AS INTEGER
DIM Food AS INTEGER
DIM Dead AS INTEGER
DIM Count AS INTEGER
DIM Speed AS DOUBLE

Directions = "NONE"
Length = 0
Food = 0
Dead = 0
Count = 0
Feed = 1

CLS
Frame = SetFrame
FrameLength = LEN(Frame)

DIM FrameChar(1 TO FrameLength) AS STRING

' Convert the string to an array of characters
FOR i = 1 TO FrameLength
	FrameChar(i) = MID$(Frame, i, 1)
NEXT i

' Set the Values for Movement Calculations
DO
	Wide = Wide + 1
LOOP UNTIL FrameChar(Wide) = CHR$(10)	

Position = (FrameLength / 2) + (Wide / 2)

DO
	Count = Count + 1
	FrameString = Frame
	
	FOR i = 1 TO FrameLength
		FrameChar(i) = MID$(FrameString, i, 1)
	NEXT i
	
	IF Feed = 1 THEN
		Food = INT(RND * FrameLength + 1)
		IF FrameChar(Food) = " " THEN
			Feed = 0
		END IF
	END IF
	
	IF Feed = 0 THEN
		FrameChar(Food) = "*"
	END IF
    	
	key$ = INKEY$

	IF key$ <> "" THEN
	
		IF UCASE$(key$) = "W" THEN
			Directions = "UP"
		END IF
		
		IF UCASE$(key$) = "A" THEN
			Directions = "LEFT"
		END IF
		
		IF UCASE$(key$) = "S" THEN
			Directions = "DOWN"
		END IF
		
		IF UCASE$(key$) = "D" THEN
			Directions = "RIGHT"
		END IF
		
		IF UCASE$(key$) = "Q" THEN
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
		Position = Position - Wide
	END IF
	
	IF Directions = "DOWN" THEN
		Position = Position + Wide
	END IF
	
	REDIM PRESERVE Locations(Count) AS INTEGER
	Locations(Count) = Position
	
	FOR i = (UBOUND(Locations) - 1) TO (UBOUND(Locations) - Length) STEP -1
		FrameChar(Locations(i)) = "O"
	NEXT i
		
	IF FrameChar(Position) <> " " THEN	
		IF FrameChar(Position) = "*" THEN
			FrameChar(Position) = "0"
			Feed = 1
			Length = Length + 1
		ELSE		
			Dead = 1
		END IF
	ELSE
		FrameChar(Position) = "0"
	END IF
			
	FrameString = ""
	
	FOR i = 1 TO FrameLength
		FrameString = FrameString + FrameChar(i)
	NEXT i

	LOCATE 1, 1
	PRINT FrameString	
	PRINT "Score: "; Length

LOOP WHILE Dead = 0


FUNCTION SetFrame$
	DIM i AS INTEGER
	DIM FrameString AS STRING

	FrameString = CHR$(201)
	
	FOR i = 1 TO 40
		FrameString = FrameString + CHR$(205)
	NEXT i
	
	FrameString = FrameString + CHR$(187) + CHR$(10)
	
	FOR i = 1 TO 18
		FrameString = FrameString + CHR$(186) + _
		"                                        " _
		+ CHR$(186) + CHR$(10)
	NEXT i
	
	FrameString = FrameString + CHR$(200)
	
	FOR i = 1 TO 40
		FrameString = FrameString + CHR$(205)
	NEXT i
	
	FrameString = FrameString + CHR$(188) + CHR$(10)

	SetFrame$ = FrameString
END FUNCTION

