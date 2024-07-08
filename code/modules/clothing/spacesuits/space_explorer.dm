/obj/item/clothing/head/helmet/spaceexplo
	name = "Scanvenger's helmet"
	icon = 'icons/obj/clothing/head/spacehelm.dmi'
	worn_icon = 'icons/mob/clothing/head/spacehelm.dmi'
	icon_state = "spaceexplo"
	inhand_icon_state = "space_helmets"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. Come with eyes protection for welders."
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | PLASMAMAN_HELMET_EXEMPT | HEADINTERNALS
	armor_type = /datum/armor/spaceexplo
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	flash_protect = FLASH_PROTECTION_WELDER
	strip_delay = 50
	equip_delay_other = 50
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	resistance_flags = NONE
	dog_fashion = null

/datum/armor/spaceexplo
	bio = 100
	fire = 80
	acid = 70

/obj/item/clothing/suit/space/spaceexplorer
	name = "Scavenger's EVA Suit"
	desc = "A modified suit made for space explorers, manufactured with better and more durable materials while still allowing decent mobility."
	icon_state = "spaceexplora"
	worn_icon = 'icons/mob/clothing/suits/spacesuit.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	slowdown = 0
	armor_type = /datum/armor/spess_armor
	strip_delay = 40
	equip_delay_other = 20

/datum/armor/spess_armor
	melee = 10
	bullet = 25
	laser = 15
	energy = 20
	bomb = 5
	bio = 30
	fire = 45
	acid = 25
