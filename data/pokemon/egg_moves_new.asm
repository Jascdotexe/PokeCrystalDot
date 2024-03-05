SECTION "Egg Moves 3", ROMX

EggMovePointers3::
    dw NoEggMoves3
	dw NoEggMoves3
	dw NoEggMoves3
	dw AzurillEggMoves
	dw NoEggMoves3
    dw NoEggMoves3
    dw NoEggMoves3
.IndirectEnd::

AzurillEggMoves:
	dw LIGHT_SCREEN
	dw PRESENT
	dw AMNESIA
	dw FUTURE_SIGHT
	dw BELLY_DRUM
	dw PERISH_SONG
	dw SUPERSONIC
	dw FORESIGHT
	dw -1 ; end
NoEggMoves3:
	dw -1 ; end
