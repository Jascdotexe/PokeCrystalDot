BattleCommand_HealMorn:
	ld b, MORN_F
	jr BattleCommand_TimeBasedHealContinue

BattleCommand_HealDay:
	ld b, DAY_F
	jr BattleCommand_TimeBasedHealContinue

BattleCommand_HealNite:
	ld b, NITE_F
	; fallthrough

BattleCommand_TimeBasedHealContinue:
; Time- and weather-sensitive heal.

	ld hl, wBattleMonMaxHP
	ld de, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .start
	ld hl, wEnemyMonMaxHP
	ld de, wEnemyMonHP

.start
; Index for .Multipliers
; Default restores half max HP.
	ld c, 2

; Don't bother healing if HP is already full.
	push bc
	call CompareBytes
	pop bc
	jr z, .Full

; Don't factor in time of day in link battles.
	ld a, [wLinkMode]
	and a
	jr nz, .Weather

	ld a, [wTimeOfDay]
	cp b
	jr z, .Weather
	dec c ; double

.Weather:
	ld a, [wBattleWeather]
	and a
	jr z, .Heal

; x2 in sun
; /2 in rain/sandstorm
	inc c
	cp WEATHER_SUN
	jr z, .Heal
	dec c
	dec c

.Heal:
	ld b, 0
	ld hl, .Multipliers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(GetMaxHP)
	rst FarCall

	call AnimateCurrentMove
	call BattleCommand_SwitchTurn

	callfar RestoreHP

	call BattleCommand_SwitchTurn
	call UpdateUserInParty

; 'regained health!'
	ld hl, RegainedHealthText
	jp StdBattleTextbox

.Full:
	call AnimateFailedMove

; 'hp is full!'
	ld hl, HPIsFullText
	jp StdBattleTextbox

.Multipliers:
	dw GetEighthMaxHP
	dw GetQuarterMaxHP
	dw GetHalfMaxHP
	dw GetMaxHP
    