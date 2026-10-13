-- The Deadmines quest route (Classic Forever, Alliance).
-- Quest chain from the Attune addon (Attune_Data.steps, ID_ATTUNE="170"); coordinates from the
-- RestedXP Forever guides where available, otherwise from Attune_Data.questGivers.
-- Toxic Soil quest (927xx/92819) objectives from Attune's quest text (Locales/enUS.lua);
-- mine coordinates from RestedXP's Westfall map bounds.

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Quests
#name 18-21 The Deadmines

step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .accept 65 >> Accept The Defias Brotherhood
    .target Gryan Stoutmantle

-- Toxic Soil storyline
step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .accept 92742 >>Accept Testing the Wells
    .accept 92744 >>Accept Murloc Gills
    .target Alba Fairmoon
step
    .goto 1436/0,1404.200,-10290.900
    .use 254545 >>|cRXP_WARN_Use the|r |T236996:0|t[Well Water Sample Kit] |cRXP_WARN_at the Molsen Farm well|r
    .complete 92742,2 --|1/1 Molsen Farm Water Sample
step
    .goto 1436/0,1192.12,-9641.73,60,0
    .goto 1436/0,1042.67,-9619.33,60,0
    .goto 1436/0,1192.12,-9641.73
    >>Kill |cRXP_ENEMY_Murloc Raiders|r and |cRXP_ENEMY_Murloc Coastrunners|r. Loot them for their |cRXP_LOOT_Gills|r
    .complete 92744,1 -- Longshore Murloc Gills 7/7
    .mob Murloc Raider
    .mob Murloc Coastrunner
step
    .goto 1436/0,1035.300,-9835.101
    .use 254545 >>|cRXP_WARN_Use the|r |T236996:0|t[Well Water Sample Kit] |cRXP_WARN_at the Jansen Stead well|r
    .complete 92742,1 --|1/1 Jansen Stead Water Sample
step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92742 >>Turn in Testing the Wells
    .turnin 92744 >>Turn in Murloc Gills
    .accept 92745 >>Accept The State of the Mines
    .target Alba Fairmoon
step
    .goto Westfall,45.2,21.1
    >>Kill |cRXP_ENEMY_Kobold Diggers|r inside Jangolode Mine
    .complete 92745,1 -- Kobold Digger slain (4)
    .mob Kobold Digger
step
    .goto Westfall,30.0,47.9
    >>Kill |cRXP_ENEMY_Riverpaw Miners|r in the Gold Coast Quarry
    .complete 92745,2 -- Riverpaw Miner slain (6)
    .mob Riverpaw Miner
step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92745 >>Turn in The State of the Mines
    .accept 92747 >>Accept Moonbrook Espionage
    .target Alba Fairmoon
step
    .goto Westfall,44.50,69.62
    >>Loot |cRXP_PICK_Suspicious Industrial Supplies|r around Moonbrook
    .complete 92747,1 -- Suspicious Industrial Supplies (8)
step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92747 >>Turn in Moonbrook Espionage
    .accept 92748 >>Accept Explosive Consultation
    .target Alba Fairmoon

-- Defias Brotherhood: Redridge and back
step
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thor|r
    >>|cRXP_WARN_If you do not have the Redridge Mountains flight path, fly to Stormwind and run east instead|r
    .fly Redridge >> Fly to Redridge Mountains
    .target Thor
    .zoneskip Redridge Mountains
step
    .goto 1433/0,-2164.56,-9213.10,8,0
    .goto 1433/0,-2145.67,-9231.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wiley the Black|r inside upstairs
    .turnin 65 >> Turn in The Defias Brotherhood
    .accept 132 >> Accept The Defias Brotherhood
    .target Wiley the Black
step
    .goto 1433/0,-2234.89,-9435.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariena Stormfeather|r
    .fly Westfall >> Fly to Westfall
    .target Ariena Stormfeather
    .zoneskip Westfall
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 132 >> Turn in The Defias Brotherhood
    .accept 135 >> Accept The Defias Brotherhood
    .target Gryan Stoutmantle

-- Stormwind
step
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thor|r
    .fly Stormwind >> Fly to Stormwind
    .target Thor
    .zoneskip Stormwind City
step
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,5 >> Enter the SI:7 Headquarters. Travel up stairs toward |cRXP_FRIENDLY_Master Mathias Shaw|r
step
    .goto 1453/0,362.28,-8815.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Mathias Shaw|r
    .turnin 135 >> Turn in The Defias Brotherhood
    .accept 141 >> Accept The Defias Brotherhood
    .target Master Mathias Shaw
step
    .goto 1453/0,501.200,-8468.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wilder Thistlenettle|r
    .accept 167 >> Accept Oh Brother. . .
    .accept 168 >> Accept Collecting Memories
    .target Wilder Thistlenettle
step
    .goto 1453/0,634.700,-8390.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shoni the Shilent|r
    .accept 2040 >> Accept Underground Assault
    .target Shoni the Shilent
step
    .goto 1453/0,646.98,-8350.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprite Jumpsprocket|r
    .turnin 92748 >>Turn in Explosive Consultation
    .accept 92749 >>Accept A Dynamite Plan
    .target Sprite Jumpsprocket
step
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Auctioneer Jaxon|r in the Trade District and buy 10 |cRXP_LOOT_Rough Dynamite|r
    >>|cRXP_WARN_Engineers can craft it instead (an early Engineering recipe). Skip the trip if you already have 10|r
    .collect 4358,10 -- Rough Dynamite (10)
    .target Auctioneer Jaxon
step
    .goto 1453/0,646.98,-8350.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprite Jumpsprocket|r
    .turnin 92749 >>Turn in A Dynamite Plan
    .accept 92750 >>Accept Detonation at a Distance
    .target Sprite Jumpsprocket
step
    .goto 1453/0,329.79,-8805.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jasper Fel|r at Stormwind Intelligence in Old Town
    .turnin 92750 >>Turn in Detonation at a Distance
    .accept 92751 >>Accept Detonation at a Distance
    .target Jasper Fel
step
    .goto 1453/0,646.98,-8350.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprite Jumpsprocket|r
    .turnin 92751 >>Turn in Detonation at a Distance
    .accept 92752 >>Accept Explosive Consultation
    .target Sprite Jumpsprocket

-- Westfall: finish the Defias Brotherhood prequests
step
    .goto 1453/0,490.03,-8835.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    .fly Westfall >> Fly to Westfall
    .target Dungar Longdrink
    .zoneskip Westfall
step
    .goto 1436/0,1045.29,-10508.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 141 >> Turn in The Defias Brotherhood
    .accept 142 >> Accept The Defias Brotherhood
    .target Gryan Stoutmantle
step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92752 >>Turn in Explosive Consultation
    .accept 92753 >>Accept Destruction in Deadmines
    .target Alba Fairmoon
step
    .goto 1436/0,1459.17,-11024.47
    >>Kill the |cRXP_ENEMY_Defias Messenger|r. Loot him for his |cRXP_LOOT_Mysterious Message|r
    >>|cRXP_WARN_He walks the road north of Moonbrook to the Gold Coast Quarry and Jangolode Mine. Wait for him to spawn if you can't find him|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan Defias Messenger
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 142 >> Turn in The Defias Brotherhood
    .target Gryan Stoutmantle
step
    .goto 1436/0,1067.87,-10508.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_The Defias Traitor|r
    >>|cRXP_WARN_You may need to wait for him to spawn|r
    .accept 155 >> Accept The Defias Brotherhood
    .target The Defias Traitor
step
    .goto 1436/0,1527.07,-11073.23
    >>Escort |cRXP_FRIENDLY_The Defias Traitor|r to the Deadmines
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target The Defias Traitor
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 155 >> Turn in The Defias Brotherhood
    .accept 166 >> Accept The Defias Brotherhood
    .target Gryan Stoutmantle
step
    .goto 1436/0,1033.22,-10504.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scout Riell|r atop the tower
    .accept 214 >> Accept Red Silk Bandanas
    .target Scout Riell

-- Moonbrook and the Deadmines
step
    #completewith EnterDM
    >>Kill |cRXP_ENEMY_Defias|r. Loot them for their |cRXP_LOOT_Red Silk Bandanas|r
    >>|cRXP_WARN_You can also complete this inside the Deadmines|r
    .complete 214,1 -- Red Silk Bandana (10)
step
    #completewith next
    >>Kill |cRXP_ENEMY_Skeletal Miners|r, |cRXP_ENEMY_Undead Dynamiters|r and |cRXP_ENEMY_Undead Excavators|r on the way to the Foreman. Loot them for their |cRXP_LOOT_Cards|r
    >>|cRXP_WARN_This is OUTSIDE the dungeon|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
    .zoneskip 291/292
step
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>Kill |cRXP_ENEMY_Foreman Thistlenettle|r. Loot him for his |cRXP_LOOT_Badge|r
    >>|cRXP_WARN_This is OUTSIDE the dungeon|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan Foreman Thistlenettle
    .zoneskip 291/292
step
    #label EnterDM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.08,80.11
    >>Kill |cRXP_ENEMY_Skeletal Miners|r, |cRXP_ENEMY_Undead Dynamiters|r and |cRXP_ENEMY_Undead Excavators|r. Loot them for their |cRXP_LOOT_Cards|r
    >>|cRXP_WARN_This is OUTSIDE the dungeon, and slow. Skip it if your group agrees|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
    .zoneskip 291/292
step
    #completewith DMend
    >>Kill |cRXP_ENEMY_Defias|r inside The Deadmines. Loot them for their |cRXP_LOOT_Bandanas|r
    .complete 214,1 -- Red Silk Bandana (10)
step
    #completewith DMend
    >>Find the hidden forge inside the Deadmines and plant the |cRXP_LOOT_Extra-Destructive Explosives|r next to it
    .complete 92753,1
step
    >>Kill |cRXP_ENEMY_Sneed|r. Loot him for the |cRXP_LOOT_Gnoam Sprecklesprocket|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
step
    #label DMend
    >>Kill |cRXP_ENEMY_Edwin VanCleef|r. Loot him for his |cRXP_LOOT_Head|r and |T133471:0|t[|cRXP_LOOT_An Unsent Letter|r]
    >>|cRXP_WARN_Use|r |T133471:0|t[|cRXP_LOOT_An Unsent Letter|r] |cRXP_WARN_to start the quest|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >> Accept The Unsent Letter
    .use 2874 -- An Unsent Letter

step
    #optional
    .isOnQuest 167
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>If you skipped him on the way in, kill |cRXP_ENEMY_Foreman Thistlenettle|r in the mine on your way out. Loot him for his |cRXP_LOOT_Badge|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan Foreman Thistlenettle
step
    #optional
    .isOnQuest 168
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.08,80.11
    >>If you still need them, kill |cRXP_ENEMY_Skeletal Miners|r, |cRXP_ENEMY_Undead Dynamiters|r and |cRXP_ENEMY_Undead Excavators|r in the mine on your way out. Loot them for their |cRXP_LOOT_Cards|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
-- Turn-ins
step
    .goto 1436/0,1527.07,-11073.23
    >>Leave the Deadmines. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r at the Deadmines exit
    .turnin 92753 >>Turn in Destruction in Deadmines
    .accept 92819 >>Accept Destruction in Deadmines
    .target Alba Fairmoon
step
    .goto 1436/0,1527.07,-11073.23
    >>Use the detonator
    .complete 92819,1 -- Use the detonator
step
    .goto 1436/0,1527.07,-11073.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92819 >>Turn in Destruction in Deadmines
    .target Alba Fairmoon
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r and |cRXP_FRIENDLY_Scout Riell|r atop the tower
    .turnin 166 >> Turn in The Defias Brotherhood
    .goto 1436/0,1045.12,-10508.80
    .target +Gryan Stoutmantle
    .turnin 214 >> Turn in Red Silk Bandanas
    .goto 1436/0,1033.22,-10504.83
    .target +Scout Riell
step
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thor|r
    .fly Stormwind >> Fly to Stormwind
    .target Thor
    .zoneskip Stormwind City
step
    .goto 1453/0,501.200,-8468.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wilder Thistlenettle|r
    .turnin 167 >> Turn in Oh Brother. . .
    .turnin 168 >> Turn in Collecting Memories
    .target Wilder Thistlenettle
step
    .goto 1453/0,634.700,-8390.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shoni the Shilent|r
    .turnin 2040 >> Turn in Underground Assault
    .target Shoni the Shilent
step
    .goto 1453/0,719.67,-8550.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baros Alexston|r
    .turnin 373 >> Turn in The Unsent Letter
    .target Baros Alexston
]])
