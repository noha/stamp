reading
readLine
	^ self stringStreamContents: [ :out | | endOfLine |
		endOfLine := false.
		[ stream atEnd or: [ endOfLine ] ] whileFalse: [ | char |
			out position >= StampConstants maxHeaderLineLength
				ifTrue: [ self error: 'Line too long' ]. 
			char := encoder nextFromStream: stream.
			char = Character cr
				ifFalse: [ 
					char = Character lf
						ifTrue: [ endOfLine := true ]
						ifFalse: [ out nextPut: char ] ] ] ]