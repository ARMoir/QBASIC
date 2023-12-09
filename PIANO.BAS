REM https://en.wikipedia.org/wiki/Piano_key_frequencies
DIM Hertz AS DOUBLE
DIM Ticks AS INTEGER
DIM Note AS STRING

Ticks = 5

DO

	Hertz = 0
	key$ = INKEY$
	
	IF key$ <> "" THEN
		SELECT CASE key$
			CASE "q":
				Hertz = 415.3047
				Note = "G#4 Ab4"
			CASE "a":
				Hertz = 440!
				Note = "A4"
			CASE "w":
				Hertz = 466.1638
				Note = "A#4 Bb4"
			CASE "s":
				Hertz = 493.8833
				Note = "B4"
			CASE "d":
				Hertz = 523.2511
				Note = "C5"
			CASE "r":
				Hertz = 554.3653
				Note = "C#5 Db5"
			CASE "f":     
				Hertz = 587.3295
				Note = "D5"
			CASE "t":
				Hertz = 622.254
				Note = "D#5 Eb5"
			CASE "g":
				Hertz = 659.2551
				Note = "E5"
			CASE "h":
				Hertz = 698.4565
				Note = "F5"
			CASE "u":
				Hertz = 739.9888
				Note = "F#5 Gb5"
			CASE "j":
				Hertz = 783.9909
				Note = "G5"
			CASE "i":
				Hertz = 830.6094
				Note = "G#5 Ab5"
			CASE "k":
				Hertz = 880!
				Note = "A5"
			CASE "o":
				Hertz = 932.3275
				Note = "A#5 Bb5"
			CASE "l":
				Hertz = 987.7666
				Note = "B5"
			CASE ";":
				Hertz = 1046.502
				Note = "C6"
			CASE "[":
				Hertz = 1108.731
				Note = "C#6 Bb6"
			CASE "'":
				Hertz = 1174.659
				Note = "D6"
			CASE "z":
				Hertz = 1318.51
				Note = "E6"
			CASE "x":
				Hertz = 1396.913
				Note = "F6"
			CASE "e":
				Hertz = 1479.978
				Note = "F#6 Gb6"
			CASE "c":
				Hertz = 1567.982
				Note = "G6"
			CASE "v":
				Hertz = 1760!
				Note = "A6"
			CASE "t":
				Hertz = 1864.655
				Note = "A#6 Bb6"
			CASE "b":
				Hertz = 1975.533
				Note = "B6"
			CASE "y":
				Hertz = 2217.461
				Note = "c#7 Db7"
			CASE "n":
				Hertz = 2093.005
				Note = "C7"
			CASE "m":
				Hertz = 2349.318
				Note = "D7"
			CASE ",":
				Hertz = 2637.02
				Note = "E7"
			CASE ".":
				Hertz = 2793.826
				Note = "F7"
			CASE "p":
				Hertz = 2959.955
				Note = "F#7 Gb7"
			CASE "/":
				Hertz = 3135.963
				Note = "G7"
			CASE "]":
				Hertz = 3322.438
				Note = "G#7 Ab7"
			CASE "Q":
				Hertz = 51.91309
				Note = "G#1 Ab1"
			CASE "A":
				Hertz = 55!
				Note = "A1"
			CASE "W":
				Hertz = 58.27047
				Note = "A#1 Bb1"
			CASE "S":
				Hertz = 61.73541
				Note = "B1"
			CASE "D":
				Hertz = 65.40639
				Note = "C2"
			CASE "R":
				Hertz = 69.29566
				Note = "C#2 Db2"
			CASE "F":     
				Hertz = 73.41619
				Note = "D2"
			CASE "T":
				Hertz = 77.78175
				Note = "D#2 Eb2"
			CASE "G":
				Hertz = 82.40689
				Note = "E2"
			CASE "H":
				Hertz = 87.30706
				Note = "F2"
			CASE "U":
				Hertz = 92.49861
				Note = "F#2 Gb2"
			CASE "J":
				Hertz = 97.99886
				Note = "G2"
			CASE "I":
				Hertz = 103.8262
				Note = "G#2 Ab2"
			CASE "K":
				Hertz = 110!
				Note = "A2"
			CASE "O":
				Hertz = 116.5409
				Note = "A#5 Bb5"
			CASE "L":
				Hertz = 123.4708
				Note = "B2"
			CASE ":":
				Hertz = 130.8128
				Note = "C3"
			CASE "{":
				Hertz = 138.5913
				Note = "C#3 Db3"
			CASE CHR$(34):
				Hertz = 146.8324
				Note = "D6"
			CASE "Z":
				Hertz = 164.8138
				Note = "E3"
			CASE "X":
				Hertz = 174.6141
				Note = "F3"
			CASE "E":
				Hertz = 184.9972
				Note = "F#3 Gb3"
			CASE "C":
				Hertz = 195.9977
				Note = "G3"
			CASE "V":
				Hertz = 220!
				Note = "A3"
			CASE "T":
				Hertz = 233.0819
				Note = "A#3 Bb3"
			CASE "B":
				Hertz = 246.9417
				Note = "B3"
			CASE "Y":
				Hertz = 277.1826
				Note = "C#4 Db4"
			CASE "N":
				Hertz = 261.6256
				Note = "C4"
			CASE "M":
				Hertz = 293.6648
				Note = "D4"
			CASE "<":
				Hertz = 329.6276
				Note = "E4"
			CASE ">":
				Hertz = 349.2282
				Note = "F4"
			CASE "P":
				Hertz = 369.9944
				Note = "F#4 Gb4"
			CASE "?":
				Hertz = 391.9954
				Note = "G4"
			CASE "}":
				Hertz = 415.3047
				Note = "G#4 Ab4"
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
			CASE CHR$(27):
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

