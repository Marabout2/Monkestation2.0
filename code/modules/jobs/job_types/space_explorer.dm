/datum/job/space_explorer
	title = JOB_SPACE_EXPLORER
	description = "Like space ? Then it's time.\
		Go out and recover key assets for the station."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 4
	spawn_positions = 4
	supervisors = SUPERVISOR_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SPACE_EXPLORER"

	outfit = /datum/outfit/job/spess_explorer
	plasmaman_outfit = /datum/outfit/plasmaman/mining

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_SPACE_EXPLORER
	bounty_types = CIV_JOB_BASIC
	departments_list =list(
		/datum/job_department/cargo,
	)

	family_heirlooms = list(/obj/item/pickaxe/mini)
	rpg_title = "Pioneer"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	alt_titles = list(
	"Space Explorer",
	"Scrapper",
	"Scavenger",
	"Space hobo"
	)

/datum/outfit/job/spess_explorer
	name = "Space Explorer"
	jobtype = /datum/job/space_explorer


	id_trim = /datum/id_trim/space_explorer
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	backpack_contents = list(
		/obj/item/flashlight/seclite =1,
		/obj/item/knife/hunting =1,
	)
	belt = /obj/item/modular_computer/pda/cargo
	ears = /obj/item/radio/headset/headset_cargo
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/jackboots

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag/explorer

	box = /obj/item/storage/box/survival/mining

/datum/id_trim/job/space_explorer
	assignment = "Space Explorer"
	trim_state = "trim_spaceexplorer"
	department_color = COLOR_CARGO_BROWN
	subdepartment_color = COLOR_CARGO_BROWN
	sechud_icon_state = SECHUD_CARGO_TECHNICIAN
	minimal_access = list(
		ACCESS_CARGO,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MECH_MINING,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_SHIPPING,
		)
	extra_access = list(
		ACCESS_BIT_DEN,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_QM,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)

