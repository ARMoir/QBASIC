REM https://en.wikipedia.org/wiki/Piano_key_frequencies
DIM Hertz AS DOUBLE
DIM Ticks AS INTEGER
DIM Note AS STRING

Ticks = 5

DO

	Hertz = 0	
	key$ = INKEY$
	
	IF key$ <> "" THEN
		SELECT CASE UCASE$(key$)
			CASE "A":
				Hertz = 440!
				Note = "A4"
			CASE "W":
				Hertz = 466.1638
				Note = "A#4 Bb4"
			CASE "S":
				Hertz = 493.8833
				Note = "B4"
			CASE "D":
				Hertz = 523.2511
				Note = "C5"
			CASE "R":
				Hertz = 554.3653
				Note = "C#5 Db5"
			CASE "F":      
				Hertz = 587.3295
				Note = "D5"
			CASE "T":
				Hertz = 622.254
				Note = "D#5 Eb5"
			CASE "G":
				Hertz = 659.2551
				Note = "E5"
			CASE "H":
				Hertz = 698.4565
				Note = "F5"
			CASE "U":
				Hertz = 739.9888
				Note = "F#5 Gb5"
			CASE "J":
				Hertz = 783.9909
				Note = "G5"
			CASE "I":
				Hertz = 830.6094
				Note = "G#5 Ab5"
			CASE "K":
				Hertz = 880!
				Note = "A5"
			CASE "O":
				Hertz = 932.3275
				Note = "A#5 Bb5"
			CASE "L":
				Hertz = 987.7666
				Note = "B5"
			CASE "Z":
				Hertz = 1046.502
				Note = "C6"
			CASE "X":
				Hertz = 1174.659
				Note = "D6"
			CASE "C":
				Hertz = 1318.51
				Note = "E6"
			CASE "V":
				Hertz = 1396.913
				Note = "F6"
			CASE "B":
				Hertz = 1567.982
				Note = "G6"
			CASE "N":
				Hertz = 1760!
				Note = "A6"
			CASE "M":
				Hertz = 1975.533
				Note = "B6"
			CASE "1":
				Ticks = 1
			CASE "2":
				Ticks = 2
			CASE "3":
				Ticks = 3
			CASE "4":
				Ticks = 4
			CASE "5":
				Ticks = 5
			CASE "6":
				Ticks = 6
			CASE "7":
				Ticks = 7
			CASE "8":
				Ticks = 8
			CASE "9":
				Ticks = 9
			CASE "0":
				Ticks = 10
			CASE "Q": 
				EXIT DO
		END SELECT
	END IF
	
	IF Hertz > 37 THEN
		SOUND Hertz, Ticks
		CLS
		PRINT "Note: "; Note
		PRINT "Ticks: "; Ticks
	END IF

LOOP WHILE Hertz < 32767

