; [wd0b5] = pokemon ID
; hl = dest addr
PrintMonType:
	call GetPredefRegisters
	push hl
	ld a, [wLoadedMonDVs]
	call PrintType
	ld a, [wLoadedMonDVs+$01]
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc

; a = type
; hl = dest addr
PrintType:
	jp PrintType_

PrintMoveType:
	call GetPredefRegisters
	push hl
	ld a, [wPlayerMoveType]
	add a
	ld hl, TypeNamesProper
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "text/type_names.asm"
