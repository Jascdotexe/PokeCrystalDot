	object_const_def

LittleGarden_MapScripts:
	def_scene_scripts

	def_callbacks

GardenSign:
	jumptext GardenSignText

GardenSignText:
    text "Partner #MON"
	line "reside in this"
	cont "mysterious garden."
	done


LittleGarden_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
    bg_event 21, 5, BGEVENT_READ, GardenSign

	def_object_events