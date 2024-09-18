/datum/job/lawyer
	title = JOB_LAWYER
	description = "Advocate for prisoners, create law-binding contracts, \
		ensure Security is following protocol and Space Law."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = SUPERVISOR_CAPTAIN
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "JUDGE"

	outfit = /datum/outfit/job/judge
	plasmaman_outfit = /datum/outfit/plasmaman/bar

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SRV

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order =	JOB_DISPLAY_ORDER_JUDGE
	departments_list = list(
		/datum/job_department/service,
		)
	rpg_title = "Magistrate"
	family_heirlooms = list(/obj/item/gavelhammer, /obj/item/book/manual/wiki/security_space_law)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	job_tone = "objection"


/datum/outfit/job/judge
	name = "Judge"
	jobtype = /datum/job/judge

	id_trim = /datum/id_trim/job/judge
	uniform = /obj/item/clothing/under/suit/black_really
	suit = /obj/item/clothing/suit/costume/judgerobe
	belt = /obj/item/modular_computer/pda/lawyer
	ears = /obj/item/radio/headset/headset_srvsec
	shoes = /obj/item/clothing/shoes/laceup
	neck = /obj/item/clothing/neck/tie/red/tied
	head = /obj/item/clothing/head/costume/powdered_wig
	l_pocket = /obj/item/laser_pointer/red
	l_hand = /obj/item/storage/briefcase/lawyer
	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = /obj/item/stamp/law
