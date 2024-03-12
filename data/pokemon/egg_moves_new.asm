SECTION "Egg Moves 3", ROMX

EggMovePointers3::
    dw NoEggMoves3
	dw NoEggMoves3
	dw NoEggMoves3
	dw AzurillEggMoves
	dw NoEggMoves3
    dw NoEggMoves3
    dw NoEggMoves3
    dw NoEggMoves3
    dw NoEggMoves3
    dw NoEggMoves3
	dw NoEggMoves3
	dw NoEggMoves3
	dw CacneaEggMoves
	dw NoEggMoves3
	dw CorphishEggMoves
	dw NoEggMoves3
.IndirectEnd::


NoEggMoves3:
	dw -1 ; end
	
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

CacneaEggMoves:
	dw DISABLE
	dw ACID
	dw COUNTER
	; dw TEETER_DANCE
	; dw BLOCK
	; dw SWITCHEROO
	; dw BELCH
	; dw FELL_STINGER
	dw -1 ; end

CorphishEggMoves:
	dw DOUBLE_EDGE
	dw SLASH
	dw METAL_CLAW
	dw ANCIENTPOWER
	dw AQUA_JET
	; dw SWITCHEROO
	dw -1 ; end
