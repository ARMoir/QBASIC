DECLARE FUNCTION SetFrame$ ()
RANDOMIZE TIMER
DIM Frame AS STRING
DIM Display AS STRING
DIM Directions AS STRING
DIM Wide AS INTEGER
DIM Position AS INTEGER
DIM Length AS INTEGER
DIM Feed AS INTEGER
DIM Food AS INTEGER
DIM Dead AS INTEGER
DIM Count AS INTEGER
DIM Speed AS DOUBLE
DIM Locations(Length) AS INTEGER

Directions = "NONE"
Length = 0
Food = 0
Dead = 0
Count = 0
Feed = 1
Speed = 0.50

CLS
Frame = SetFrame

DO
	Wide = Wide + 1
LOOP UNTIL MID$(Frame, Wide, 1) = CHR$(10)	

Position = (LEN(Frame) / 2) + (Wide / 2)

DO
	Count = Count + 1
	Display = Frame
	
	IF Feed = 1 THEN
		Food = INT(RND * LEN(Frame) + 1)
		IF MID$(Display, Food, 1)  = " " THEN
			Feed = 0
		END IF
	END IF
	
	IF Feed = 0 THEN
		MID$(Display, Food, 1)  = "*"
	END IF

	key$ = INKEY$

	IF key$ <> "" THEN
		SELECT CASE UCASE$(key$)
			CASE "W": Directions = "UP"
			CASE "A": Directions = "LEFT"
			CASE "S": Directions = "DOWN"
			CASE "D": Directions = "RIGHT"
			CASE "Q": EXIT DO
		END SELECT
	END IF

	IF Directions = "LEFT" THEN
		Position = Position - 1
	ELSEIF Directions = "RIGHT" THEN
		Position = Position + 1
	ELSEIF Directions = "UP" THEN
		Position = Position - Wide
	ELSEIF Directions = "DOWN" THEN
		Position = Position + Wide
	END IF
	
	REDIM PRESERVE Locations(Count) AS INTEGER
	Locations(Count) = Position
	
	FOR i = (Count - 1) TO (Count - Length) STEP -1
		MID$(Display, Locations(i), 1)  = "O"
	NEXT i

	IF MID$(Display, Position, 1) <> " " THEN	
		IF MID$(Display, Position, 1) = "*" THEN
			MID$(Display, Position, 1) = "0"
			Feed = 1
			Length = Length + 1
			Speed = Speed - 0.01
			SOUND 370, 1
		ELSE		
			Dead = 1
			SOUND 330, 1
		END IF
	ELSE
		MID$(Display, Position, 1) = "0"
	END IF

	LOCATE 1, 1
	PRINT Display	
	PRINT "Score: "; Length

	IF Speed <= 0 THEN
		Speed = 0.01
	END IF
	
	Start = TIMER
	DO
	LOOP UNTIL TIMER > Start + Speed

LOOP WHILE Dead = 0

FUNCTION SetFrame$
	DIM i AS INTEGER
	DIM Display AS STRING

	Display = CHR$(201)
	
	FOR i = 1 TO 40
		Display = Display + CHR$(205)
	NEXT i
	
	Display = Display + CHR$(187) + CHR$(10)
	
	FOR i = 1 TO 18
		Display = Display + CHR$(186) + _
		"                                        " _
		+ CHR$(186) + CHR$(10)
	NEXT i
	
	Display = Display + CHR$(200)
	
	FOR i = 1 TO 40
		Display = Display + CHR$(205)
	NEXT i
	
	Display = Display + CHR$(188) + CHR$(10)

	SetFrame$ = Display
END FUNCTION

