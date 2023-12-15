DECLARE FUNCTION SetFrame$ ()
RANDOMIZE TIMER
DIM Frame AS STRING
DIM Display AS STRING
DIM Directions AS STRING
DIM Pixel AS STRING
DIM Wide AS INTEGER
DIM Position AS INTEGER
DIM Length AS INTEGER
DIM Feed AS INTEGER
DIM Food AS INTEGER
DIM Dead AS INTEGER
DIM Count AS INTEGER
DIM Mute AS INTEGER
DIM Colors AS INTEGER
DIM Speed AS SINGLE
DIM Locations(Length) AS INTEGER

Directions = "NONE"
Length = 0
Food = 0
Dead = 0
Count = 0
Colors = 0
Feed = 1
Mute = 1
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
	key$ = INKEY$

	IF key$ <> "" THEN
		SELECT CASE UCASE$(key$)
			CASE "W": Directions = "UP"
			CASE "A": Directions = "LEFT"
			CASE "S": Directions = "DOWN"
			CASE "D": Directions = "RIGHT"
			CASE "I": Directions = "UP"
			CASE "J": Directions = "LEFT"
			CASE "K": Directions = "DOWN"
			CASE "L": Directions = "RIGHT"
			CASE "C": Colors = Colors + 1
			CASE "M": Mute = Mute + 1
			CASE "N": Dead = 1
			CASE "B": COLOR 1
			CASE "G": COLOR 2
			CASE "R": COLOR 4
			CASE "V": COLOR 5
			CASE "Y": COLOR 14			
			CASE "Q": EXIT DO
			CASE CHR$(27): EXIT DO
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
	
	IF Feed = 1 THEN
		Food = INT(RND * LEN(Frame) + 1)
		
		IF MID$(Display, Food, 1)  = " " THEN
			Feed = 0
		END IF
		
	END IF
	
	IF Feed = 0 THEN
		MID$(Display, Food, 1)  = "*"
	END IF

	IF MID$(Display, Position, 1) <> " " THEN
	
		IF MID$(Display, Position, 1) = "*" THEN
			MID$(Display, Position, 1) = "0"
			Feed = 1
			Length = Length + 1
			Speed = Speed - 0.01
			SOUND 370, Mute
		ELSE
			Dead = 1
			SOUND 330, Mute
		END IF
		
	ELSE
		MID$(Display, Position, 1) = "0"
	END IF
	
	IF Colors > 1 THEN
		Colors = 0
		COLOR 7
	END IF
	
	IF Mute > 1 THEN
		Mute = 0
	END IF
	
	IF Speed <= 0 THEN
		Speed = 0.01
	END IF
	
	LOCATE 1, 1
		
	IF Colors = 1 THEN
	
		FOR i = 1 TO LEN(Frame) STEP 1
			Pixel = MID$(Display, i, 1)
			COLOR 6

			SELECT CASE Pixel
				CASE "0": COLOR 4
				CASE "O": COLOR 5
				CASE "*": COLOR 2
			END SELECT

			PRINT Pixel;	
			
		NEXT i		
		
		PRINT ""
	ELSE
		PRINT Display
	END IF
	
	PRINT "Score: "; Length

	Start = TIMER
	DO
	LOOP UNTIL TIMER > Start + Speed
	
	IF Dead = 1 THEN
		Directions = "NONE"
		Length = 0
		Food = 0
		Dead = 0
		Count = 0
		Feed = 1
		Speed = 0.50
		Position = (LEN(Frame) / 2) + (Wide / 2)
	END IF

LOOP WHILE 1

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

