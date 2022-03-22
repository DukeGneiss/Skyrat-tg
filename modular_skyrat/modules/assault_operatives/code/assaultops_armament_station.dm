// VENDOR
/obj/machinery/armament_station/assault_operatives
	name = "Military Grade Armament Station"

	req_access = list(ACCESS_SYNDICATE)


/obj/machinery/armament_station/assault_operatives/Initialize(mapload)
	. = ..()
	products = subtypesof(/datum/armament_entry/assault_operatives)


// POINTS CARDS
/obj/item/armament_points_card/assaultops
	points = 30

// ARMAMENT ENTRIES

#define ARMAMENT_CATEGORY_OTHER "Miscellaneous"
#define ARMAMENT_CATEGORY_OTHER_LIMIT 3

/datum/armament_entry/assault_operatives
	var/mags_to_spawn = 3

/datum/armament_entry/assault_operatives/after_equip(turf/safe_drop_location, obj/item/item_to_equip)
	if(istype(item_to_equip, /obj/item/gun/ballistic))
		var/obj/item/gun/ballistic/spawned_ballistic_gun = item_to_equip
		if(spawned_ballistic_gun.magazine && !istype(spawned_ballistic_gun.magazine, /obj/item/ammo_box/magazine/internal))
			var/obj/item/storage/box/ammo_box/spawned_box = new(safe_drop_location)
			spawned_box.name = "ammo box - [spawned_ballistic_gun.name]"
			for(var/i in 1 to mags_to_spawn)
				new spawned_ballistic_gun.mag_type (spawned_box)

#define ARMAMENT_CATEGORY_PRIMARY "Primary Weapons"
#define ARMAMENT_CATEGORY_PRIMARY_LIMIT 1
#define ARMAMENT_SUBCATEGORY_SUBMACHINEGUN "Submachine Guns"
#define ARMAMENT_SUBCATEGORY_ASSAULTRIFLE "Assault Rifles"
#define ARMAMENT_SUBCATEGORY_SPECIAL "Special Weapons"

/datum/armament_entry/assault_operatives/primary
	category = ARMAMENT_CATEGORY_PRIMARY
	category_item_limit = ARMAMENT_CATEGORY_PRIMARY_LIMIT
	slot_to_equip = ITEM_SLOT_SUITSTORE
	cost = 10

/datum/armament_entry/assault_operatives/primary/submachinegun
	subcategory = ARMAMENT_SUBCATEGORY_SUBMACHINEGUN
	mags_to_spawn = 4

/datum/armament_entry/assault_operatives/primary/submachinegun/p90
	item_type = /obj/item/gun/ballistic/automatic/p90

/datum/armament_entry/assault_operatives/primary/submachinegun/wildcat
	item_type = /obj/item/gun/ballistic/automatic/cfa_wildcat
	cost = 5

/datum/armament_entry/assault_operatives/primary/submachinegun/lynx
	item_type = /obj/item/gun/ballistic/automatic/cfa_lynx

/datum/armament_entry/assault_operatives/primary/submachinegun/mp40
	item_type = /obj/item/gun/ballistic/automatic/mp40
	mags_to_spawn = 3

/datum/armament_entry/assault_operatives/primary/submachinegun/ppsh
	item_type = /obj/item/gun/ballistic/automatic/ppsh
	mags_to_spawn = 1

/datum/armament_entry/assault_operatives/primary/assaultrifle
	subcategory = ARMAMENT_SUBCATEGORY_ASSAULTRIFLE

/datum/armament_entry/assault_operatives/primary/assaultrifle/akm
	item_type = /obj/item/gun/ballistic/automatic/akm

/datum/armament_entry/assault_operatives/primary/assaultrifle/m16
	item_type = /obj/item/gun/ballistic/automatic/m16

/datum/armament_entry/assault_operatives/primary/assaultrifle/stg
	item_type = /obj/item/gun/ballistic/automatic/stg
	cost = 12

/datum/armament_entry/assault_operatives/primary/assaultrifle/fg42
	item_type = /obj/item/gun/ballistic/automatic/fg42

/datum/armament_entry/assault_operatives/primary/special
	subcategory = ARMAMENT_SUBCATEGORY_SPECIAL

/datum/armament_entry/assault_operatives/primary/special/l6saw
	item_type = /obj/item/gun/ballistic/automatic/l6_saw
	cost = 20
	mags_to_spawn = 2

/datum/armament_entry/assault_operatives/primary/special/rocket_launcher
	item_type = /obj/item/gun/ballistic/rocketlauncher/unrestricted
	cost = 15

/datum/armament_entry/assault_operatives/primary/special/smartgun
	item_type = /obj/item/gun/ballistic/automatic/smartgun
	cost = 12

/datum/armament_entry/assault_operatives/primary/special/rocket_launcher/after_equip(turf/safe_drop_location, obj/item/item_to_equip)
	var/obj/item/storage/box/ammo_box/spawned_box = new(safe_drop_location)
	spawned_box.name = "ROCKETS - [item_to_equip.name]"
	for(var/i in 1 to 5)
		new /obj/item/ammo_casing/caseless/rocket(spawned_box)


#define ARMAMENT_CATEGORY_SECONDARY "Secondary Weapons"
#define ARMAMENT_CATEGORY_SECONDARY_LIMIT 1
#define ARMAMENT_SUBCATEGORY_PISTOL "Pistols"

// SECONDARY WEAPONS
/datum/armament_entry/assault_operatives/secondary
	category = ARMAMENT_CATEGORY_SECONDARY
	category_item_limit = ARMAMENT_CATEGORY_SECONDARY_LIMIT
	cost = 5
	mags_to_spawn = 2

/datum/armament_entry/assault_operatives/secondary/pistol
	subcategory = ARMAMENT_SUBCATEGORY_PISTOL

/datum/armament_entry/assault_operatives/secondary/pistol/m1911
	item_type = /obj/item/gun/ballistic/automatic/pistol/m1911

/datum/armament_entry/assault_operatives/secondary/pistol/aps
	item_type = /obj/item/gun/ballistic/automatic/pistol/aps
	cost = 7

/datum/armament_entry/assault_operatives/secondary/pistol/luger
	item_type = /obj/item/gun/ballistic/automatic/pistol/luger

/datum/armament_entry/assault_operatives/secondary/pistol/syndicate
	item_type = /obj/item/gun/ballistic/automatic/pistol

/datum/armament_entry/assault_operatives/secondary/pistol/deagle
	item_type = /obj/item/gun/ballistic/automatic/pistol/deagle
	cost = 9

/datum/armament_entry/assault_operatives/secondary/pistol/deagle_gold
	item_type = /obj/item/gun/ballistic/automatic/pistol/deagle/gold
	cost = 9

/datum/armament_entry/assault_operatives/secondary/pistol/deagle_camo
	item_type = /obj/item/gun/ballistic/automatic/pistol/deagle/camo
	cost = 9

/datum/armament_entry/assault_operatives/secondary/pistol/automag
	item_type = /obj/item/gun/ballistic/automatic/pistol/automag
	cost = 8

/datum/armament_entry/assault_operatives/secondary/pistol/automag
	item_type = /obj/item/gun/ballistic/automatic/pistol/automag
	cost = 8

/datum/armament_entry/assault_operatives/secondary/pistol/taser
	item_type = /obj/item/gun/energy/e_gun/advtaser

/datum/armament_entry/assault_operatives/secondary/pistol/pepperball
	item_type = /obj/item/gun/ballistic/automatic/pistol/pepperball
	cost = 4

// BODYARMOR
#define ARMAMENT_CATEGORY_ARMOR_BODY "Body Armor"
#define ARMAMENT_CATEGORY_ARMOR_BODY_LIMIT 1

/datum/armament_entry/assault_operatives/bodyarmor
	category = ARMAMENT_CATEGORY_ARMOR_BODY
	category_item_limit = ARMAMENT_CATEGORY_ARMOR_BODY_LIMIT
	slot_to_equip = ITEM_SLOT_OCLOTHING

/datum/armament_entry/assault_operatives/bodyarmor/normal
	item_type = /obj/item/clothing/suit/armor/vest
	cost = 3

/datum/armament_entry/assault_operatives/bodyarmor/bulletproof
	item_type = /obj/item/clothing/suit/armor/bulletproof
	cost = 5

/datum/armament_entry/assault_operatives/bodyarmor/laserproof
	item_type = /obj/item/clothing/suit/armor/laserproof
	cost = 5

/datum/armament_entry/assault_operatives/bodyarmor
	item_type = /obj/item/clothing/suit/armor/swat
	cost = 6

/datum/armament_entry/assault_operatives/marine
	item_type = /obj/item/clothing/suit/armor/vest/marine
	cost = 10

// HELMETS
#define ARMAMENT_CATEGORY_ARMOR_HEAD "Headgear"
#define ARMAMENT_CATEGORY_ARMOR_HEAD_LIMIT 1
#define ARMAMENT_SUBCATEGORY_HELMET "Helmets"
#define ARMAMENT_SUBCATEGORY_BERETS "Berets"

/datum/armament_entry/assault_operatives/headgear
	category = ARMAMENT_CATEGORY_ARMOR_HEAD
	category_item_limit = ARMAMENT_CATEGORY_ARMOR_HEAD_LIMIT
	slot_to_equip = ITEM_SLOT_HEAD

/datum/armament_entry/assault_operatives/headgear/helmet
	subcategory = ARMAMENT_SUBCATEGORY_HELMET

/datum/armament_entry/assault_operatives/headgear/helmet/normal
	item_type = /obj/item/clothing/head/helmet
	cost = 3

/datum/armament_entry/assault_operatives/headgear/helmet/bulletproof
	item_type = /obj/item/clothing/head/helmet/alt
	cost = 5

/datum/armament_entry/assault_operatives/headgear/helmet/syndicate
	item_type = /obj/item/clothing/head/helmet/swat
	cost = 7


/datum/armament_entry/assault_operatives/headgear/helmet/syndicate
	item_type = /obj/item/clothing/head/hos/beret/syndicate
	cost = 6

#define ARMAMENT_CATEGORY_MELEE "Melee Weapons"
#define ARMAMENT_CATEGORY_MELEE_LIMIT 1

/datum/armament_entry/assault_operatives/melee
	category = ARMAMENT_CATEGORY_MELEE
	category_item_limit = ARMAMENT_CATEGORY_MELEE_LIMIT

/datum/armament_entry/assault_operatives/melee/combat_knife
	item_type = /obj/item/knife/combat
	cost = 7

/datum/armament_entry/assault_operatives/melee/survival_knife
	item_type = /obj/item/knife/combat/survival
	cost = 5

/datum/armament_entry/assault_operatives/melee/energy
	item_type = /obj/item/melee/energy/sword
	cost = 10

/datum/armament_entry/assault_operatives/melee/baton
	item_type = /obj/item/melee/baton/security/loaded
	cost = 3

/datum/armament_entry/assault_operatives/melee/baton
	item_type = /obj/item/melee/baton/telescopic
	cost = 5

#define ARMAMENT_CATEGORY_MEDICAL "Medical Supplies"
#define ARMAMENT_CATEGORY_MEDICAL_LIMIT 5
#define ARMAMENT_SUBCATEGORY_MEDKIT "Medkits"
#define ARMAMENT_SUBCATEGORY_INJECTOR "Injectors"

/datum/armament_entry/assault_operatives/medical
	category = ARMAMENT_CATEGORY_MEDICAL
	category_item_limit = ARMAMENT_CATEGORY_MEDICAL_LIMIT

/datum/armament_entry/assault_operatives/medical/medkit
	subcategory = ARMAMENT_SUBCATEGORY_MEDKIT

/datum/armament_entry/assault_operatives/medical/medkit/basic
	item_type = /obj/item/storage/medkit
	cost = 1

/datum/armament_entry/assault_operatives/medical/medkit/brute
	item_type = /obj/item/storage/medkit/brute
	cost = 1

/datum/armament_entry/assault_operatives/medical/medkit/toxin
	item_type = /obj/item/storage/medkit/toxin
	cost = 1

/datum/armament_entry/assault_operatives/medical/medkit/fire
	item_type = /obj/item/storage/medkit/fire
	cost = 1

/datum/armament_entry/assault_operatives/medical/medkit/o2
	item_type = /obj/item/storage/medkit/o2
	cost = 1

/datum/armament_entry/assault_operatives/medical/medkit/tactical
	item_type = /obj/item/storage/medkit/tactical
	cost = 5

/datum/armament_entry/assault_operatives/medical/surgery_bag
	item_type = /obj/item/storage/backpack/duffelbag/syndie/surgery
	cost = 2

/datum/armament_entry/assault_operatives/medical/beamgun
	item_type = /obj/item/gun/medbeam
	cost = 5

/datum/armament_entry/assault_operatives/medical/injector
	subcategory = ARMAMENT_SUBCATEGORY_INJECTOR

/datum/armament_entry/assault_operatives/medical/injector/bloodloss
	item_type = /obj/item/reagent_containers/hypospray/medipen/blood_loss
	cost = 2

/datum/armament_entry/assault_operatives/medical/injector/atropine
	item_type = /obj/item/reagent_containers/hypospray/medipen/atropine
	cost = 2

/datum/armament_entry/assault_operatives/medical/injector/salacid
	item_type = /obj/item/reagent_containers/hypospray/medipen/salacid
	cost = 1

/datum/armament_entry/assault_operatives/medical/injector/oxandrolone
	item_type = /obj/item/reagent_containers/hypospray/medipen/oxandrolone
	cost = 1

/datum/armament_entry/assault_operatives/medical/injector/oxandrolone
	item_type = /obj/item/reagent_containers/hypospray/medipen/oxandrolone
	cost = 1


/datum/armament_entry/assault_operatives/medical/injector/stimulant
	item_type = /obj/item/reagent_containers/hypospray/medipen/stimulants
	cost = 3

/datum/armament_entry/assault_operatives/medical/injector/bag
	item_type = /obj/item/storage/bag/medpens
	cost = 6
