-- Excavation Site: Wetlands quest route (Classic Forever, Alliance).
-- Quest chain and quest text from the Attune addon (ID_ATTUNE="195"); NPC, area and flight master positions
-- from the RestedXP Forever Wetlands and Redridge guides.

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Quests
#name 24-29 Excavation Site: Wetlands

-- Lakeshire
step
    #optional
    .goto 1433/0,-2240.400,-9247.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorin Songblade|r in Lakeshire
    >>|cRXP_WARN_Skip this if you are not in Redridge Mountains|r
    .accept 95772 >> Accept Songblade Search
    .target Dorin Songblade
    .zoneskip Redridge Mountains,1
step
    .goto 1433/0,-2234.89,-9435.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariena Stormfeather|r
    >>|cRXP_WARN_If you do not have the Menethil Harbor flight path, fly to Thelsamar in Loch Modan instead. It is much faster than running from Ironforge|r
    >>|cRXP_WARN_If you do not have the Thelsamar flight path either, fly to Stormwind, take the Deeprun Tram to Ironforge and run east through Dun Morogh and Loch Modan. Get the Thelsamar flight path on the way|r
    .fly Wetlands >> Fly to Menethil Harbor
    .target Ariena Stormfeather
    .zoneskip Redridge Mountains,1
step
    #completewith next
    .goto 1437/0,-2677.900,-4451.500,20,0
    .goto 1437/0,-2629.900,-4086.400,15 >> Run north from Loch Modan through Dun Algaz into the Wetlands, then follow the road west to Menethil Harbor
    .zoneskip Wetlands

-- Menethil Harbor
step
    .goto 1437/0,-782.03,-3793.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shellei Brondir|r
    .fp Menethil Harbor >> Get the Menethil Harbor flight path
    .target Shellei Brondir
step
    .goto 1437/0,-839.93,-3792.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Fitzsimmons|r
    .accept 463 >> Accept The Greenwarden
    .target First Mate Fitzsimmons
step
    .goto 1437/0,-880.100,-3769.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caitlin Grassman|r
    .turnin 95737 >> Turn in Seeking Caitlin
    .accept 95647 >> Accept Lost in the Thicket Things
    .target Caitlin Grassman

-- The Greenwarden
step
    .goto 1437/0,-2453.82,-3233.00
    >>Follow the road east. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Einar Stonegrip|r
    .accept 469 >> Accept Daily Delivery
    .target Einar Stonegrip
step
    .goto 1437/0,-2720.72,-3261.440
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 463 >> Turn in The Greenwarden
    .accept 276 >> Accept Tramping Paws
    .target Rethiel the Greenwarden
step
    .goto 1437/0,-3033.36,-3899.24,60,0
    .goto 1437/0,-2967.60,-4059.10,60,0
    .goto 1437/0,-2936.17,-4161.91,60,0
    .goto 1437/0,-2967.60,-4059.10
    >>Kill |cRXP_ENEMY_Mosshide Gnolls|r and |cRXP_ENEMY_Mosshide Mongrels|r
    .complete 276,1
    .mob +Mosshide Gnoll
    .complete 276,2
    .mob +Mosshide Mongrel
step
    .goto 1437/0,-2720.72,-3261.440
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 276 >> Turn in Tramping Paws
    .accept 277 >> Accept Fire Taboo
    .target Rethiel the Greenwarden
step
    .goto 1437/0,-1663.29,-3002.35,80,0
    .goto 1437/0,-1952.77,-2963.77,80,0
    .goto 1437/0,-2167.81,-3062.99
    >>Kill the |cRXP_ENEMY_Mosshides|r. Loot them for their |cRXP_LOOT_Crude Flints|r
    .complete 277,1 -- Crude Flint (9)
    .mob Mosshide Brute
    .mob Mosshide Trapper
    .mob Mosshide Fenrunner
    .mob Mosshide Mistweaver
    .mob Mosshide Mystic
    .mob Mosshide Alpha
step
    .goto 1437/0,-2720.72,-3261.440
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 277 >> Turn in Fire Taboo
    .accept 275 >> Accept Blisters on The Land
    .target Rethiel the Greenwarden
step
    .goto 1437/0,-2708.73,-3441.7,40,0
    .goto 1437/0,-2648.76,-3368.11,40,0
    .goto 1437/0,-2574.74,-3130.24,40,0
    .goto 1437/0,-2599.55,-3023.58,40,0
    .goto 1437/0,-2501.13,-3049.76
    >>Kill |cRXP_ENEMY_Fen Creepers|r in the ponds north and south of the |cRXP_FRIENDLY_Greenwarden|r
    >>|cRXP_ENEMY_Fen Creepers|r |cRXP_WARN_are in|r |T132320:0|t[Stealth]
    .complete 275,1 -- Fen Creeper slain (8)
    .mob Fen Creeper
step
    .goto 1437/0,-2720.72,-3261.440
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 275 >> Turn in Blisters on The Land
    .accept 95646 >> Accept Horrors in the Highland
    .target Rethiel the Greenwarden

-- Back to Menethil for Highland Hides
step
    .goto 1437/0,-742.75,-3683.97
    >>Return to Menethil Harbor. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    >>|cRXP_WARN_If he doesn't offer Highland Hides, do his Young Crocolisk Skins quest first|r
    .turnin 469 >> Turn in Daily Delivery
    .accept 98815 >> Accept Highland Hides
    .target James Halloran

-- Excavation Site: Wetlands
step
    #completewith ExcavationEnd
    .goto 1437/0,-2554.900,-3973.300
    >>Travel to the Excavation Site: Wetlands dungeon entrance and find a group
    .zoneskip Wetlands,1
step
    #completewith ExcavationEnd
    >>Kill |cRXP_ENEMY_Thicket Raptors|r inside the dungeon. Loot them for their |cRXP_LOOT_Hides|r
    .complete 98815,1 -- Thicket Raptor Hide (4)
step
    >>Find |cRXP_FRIENDLY_Ardin Grassman|r inside the dungeon and learn what happened to him
    .turnin 95647 >> Turn in Lost in the Thicket Things
    .accept 95809 >> Accept Heartwoven
    .target Ardin Grassman
step
    #optional
    .isOnQuest 95772
    >>Find |cRXP_FRIENDLY_Daewyn Songblade|r inside the dungeon
    .turnin 95772 >> Turn in Songblade Search
    .accept 95795 >> Accept Fallen in the Fen
    .target Daewyn Songblade
step
    >>Kill the |cRXP_ENEMY_Highland Horror|r. Loot it for the |cRXP_LOOT_Horrible Rootcore|r
    .complete 95646,1 -- Horrible Rootcore (1)
    .mob Highland Horror
step
    #label ExcavationEnd
    >>Kill the |cRXP_ENEMY_Relic Guardian|r. Loot it for the |cRXP_LOOT_Titan Relic|r and use it to start the quest
    .collect 270865,1,95810 -- Titan Relic (1)
    .accept 95810 >> Accept Lost Relic Carry
    .use 270865
    .mob Relic Guardian
step
    >>Finish looting |cRXP_LOOT_Thicket Raptor Hides|r before you leave
    .complete 98815,1 -- Thicket Raptor Hide (4)

-- Turn-ins
step
    .goto 1437/0,-1994.50,-3591.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Whelgar|r at the excavation site
    .turnin 95810 >> Turn in Lost Relic Carry
    .accept 98824 >> Accept Prehistoric Prism
    .target Prospector Whelgar
step
    .goto 1437/0,-2720.72,-3261.440
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 95646 >> Turn in Horrors in the Highland
    .target Rethiel the Greenwarden
step
    .goto 1437/0,-880.100,-3769.600
    >>Return to Menethil Harbor. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caitlin Grassman|r
    .turnin 95809 >> Turn in Heartwoven
    .target Caitlin Grassman
step
    .goto 1437/0,-742.75,-3683.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    .turnin 98815 >> Turn in Highland Hides
    .target James Halloran
step
    #optional
    .isOnQuest 95795
    .goto 1437/0,-782.03,-3793.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shellei Brondir|r
    >>|cRXP_WARN_If you do not have the Redridge Mountains flight path, fly to Stormwind and run east instead|r
    .target Shellei Brondir
    .fly Redridge >> Fly to Redridge Mountains
    .zoneskip Redridge Mountains
step
    #optional
    .isOnQuest 95795
    .goto 1433/0,-2240.400,-9247.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorin Songblade|r in Lakeshire
    .turnin 95795 >> Turn in Fallen in the Fen
    .target Dorin Songblade
]])
