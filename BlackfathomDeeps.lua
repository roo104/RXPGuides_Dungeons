-- Blackfathom Deeps quest route (Classic Forever, Alliance).
-- Quest chain and quest text from the Attune addon (ID_ATTUNE="200"); NPC, flight master, boat and dungeon
-- entrance positions from the RestedXP Forever and Classic Alliance guides.

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Quests
#name 25-28 Blackfathom Deeps

-- Ironforge
step
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gerrig Bonegrip|r
    >>|cRXP_WARN_Skip this if you are not near Ironforge, and ask your group to share Knowledge in the Deeps instead|r
    .accept 971 >> Accept Knowledge in the Deeps
    .target Gerrig Bonegrip
step
    .goto 1455/0,-1152.39,-4820.914
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryth Thurden|r
    .fly Wetlands >> Fly to Menethil Harbor
    .target Gryth Thurden
    .zoneskip Ironforge,1
step
    .goto 1437,4.370,56.762
    .zone Darkshore >> Take the boat to Auberdine in Darkshore
    .zoneskip Wetlands,1

-- Auberdine
step
    .goto Darkshore,38.327,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gershala Nightwhisper|r
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 1275 >> Accept Researching the Corruption
    .target Gershala Nightwhisper
step
    #optional
    .goto 1439/1,515.55,6406.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shaussiy|r downstairs
    .home >> Set your Hearthstone to Auberdine
    .target Innkeeper Shaussiy
    .bindlocation 442
step
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caylais Moonfeather|r
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Caylais Moonfeather
    .zoneskip Darkshore,1

-- Darnassus
step
    .goto Teldrassil,55.889,89.456,15,0
    .goto Darnassus,55.239,23.996
    >>Take the portal up to Darnassus and go upstairs. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Guard Manados|r
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 1199 >> Accept Twilight Falls
    .target Argent Guard Manados
step
    .goto Darnassus,55.360,25.024
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dawnwatcher Shaedlass|r up stairs
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 1198 >> Accept In Search of Thaelrid
    .target Dawnwatcher Shaedlass
step
    .goto Darnassus,29.466,41.405,15,0
    .goto 1438/1,841.10,8640.58
    >>Take the portal down to Rut'theran Village. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fly Darkshore >> Fly to Auberdine
    .target Vesprystus
    .zoneskip Darkshore

-- Blackfathom Deeps
step
    .goto Ashenvale,14.230,14.618
    >>Run south along the coast of Darkshore into Ashenvale, to the Zoram Strand. Find a group
    .subzoneskip 2797
step
    #completewith EnterBFD
    >>Kill |cRXP_ENEMY_Fallenroot Rogues|r, |cRXP_ENEMY_Fallenroot Satyrs|r, |cRXP_ENEMY_Blackfathom Oracles|r and |cRXP_ENEMY_Blackfathom Tide Priestesses|r. Loot them for their |cRXP_LOOT_Corrupted Brain Stems|r
    >>|cRXP_WARN_You can also loot them inside the dungeon|r
    .complete 1275,1 -- Corrupted Brain Stem (8)
    .mob Blackfathom Tide Priestess
    .mob Blackfathom Oracle
    .mob Fallenroot Rogue
    .mob Fallenroot Satyr
step
    #label EnterBFD
    .goto 1414/1,937.2426,4186.2938,25,0
    .goto 1414/1,904.1228,4321.2264,25,0
    .goto 1414/1,867.3230,4318.7731,25,0
    .goto 1414/1,749.5636,4252.5334
    .subzone 2797,2 >> Enter Blackfathom Deeps
step
    #completewith BFDEnd
    >>Kill |cRXP_ENEMY_Nagas|r and |cRXP_ENEMY_Satyrs|r. Loot them for their |cRXP_LOOT_Corrupted Brain Stems|r
    .complete 1275,1 -- Corrupted Brain Stem (8)
step
    #completewith BFDEnd
    >>|cRXP_WARN_If you loot a|r |cRXP_LOOT_Blackfathom Pearl|r|cRXP_WARN_, use it to start The Heart of the Void|r
    .accept 78916 >> Accept The Heart of the Void
step
    >>Open the |cRXP_PICK_Pitted Iron Chest|r underwater near the area with the turtles. Loot it for |cRXP_LOOT_Lorgalis' Manuscript|r
    .complete 971,1 -- Lorgalis Manuscript (1)
    .isOnQuest 971
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Guard Thaelrid|r
    >>|cRXP_WARN_You can accept Blackfathom Villainy without In Search of Thaelrid, or ask your group to share it|r
    .turnin -1198 >> Turn in In Search of Thaelrid
    .accept 1200 >> Accept Blackfathom Villainy
    .target Argent Guard Thaelrid
step
    #completewith BFDEnd
    >>Kill the |cRXP_ENEMY_Twilight's Hammer|r. Loot them for their |cRXP_LOOT_Twilight Pendants|r
    .complete 1199,1 -- Twilight Pendant (10)
step
    #label BFDEnd
    >>Kill |cRXP_ENEMY_Twilight Lord Kelris|r. Loot him for his |cRXP_LOOT_Head|r
    .complete 1200,1 -- Head of Kelris (1)
    .mob Twilight Lord Kelris
step
    >>Finish looting |cRXP_LOOT_Twilight Pendants|r and |cRXP_LOOT_Corrupted Brain Stems|r before you leave
    >>|cRXP_WARN_The altar at the end of the dungeon teleports you back to the entrance. The mobs outside also drop Corrupted Brain Stems|r
    .complete 1199,1 -- Twilight Pendant (10)
    .complete 1275,1 -- Corrupted Brain Stem (8)

-- Turn-ins
step
    #optional
    .hs >> Hearth to Auberdine
    .bindlocation 442,1
step
    .goto Darkshore,38.327,43.039
    >>Return to Auberdine. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gershala Nightwhisper|r
    .turnin 1275 >> Turn in Researching the Corruption
    .target Gershala Nightwhisper
step
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caylais Moonfeather|r
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Caylais Moonfeather
    .zoneskip Darkshore,1
step
    .goto Teldrassil,55.889,89.456,15,0
    .goto Darnassus,55.239,23.996
    >>Take the portal up to Darnassus and go upstairs. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Guard Manados|r
    .turnin 1199 >> Turn in Twilight Falls
    .target Argent Guard Manados
step
    .goto Darnassus,56.167,24.395
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dawnwatcher Selgorm|r up stairs
    .turnin 1200 >> Turn in Blackfathom Villainy
    .target Dawnwatcher Selgorm
step
    #optional
    .isOnQuest 78916
    .goto Darnassus,56.167,24.395
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dawnwatcher Selgorm|r up stairs
    .turnin 78916 >> Turn in The Heart of the Void
    .target Dawnwatcher Selgorm
step
    #optional
    .isQuestComplete 971
    .goto Darnassus,29.466,41.405,15,0
    .goto 1438/1,841.10,8640.58
    >>Take the portal down to Rut'theran Village. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fly Darkshore >> Fly to Auberdine
    .target Vesprystus
    .zoneskip Darkshore
step
    #optional
    .isQuestComplete 971
    .goto Darkshore,32.29,44.05
    .zone Wetlands >> Take the boat to Menethil Harbor
    .zoneskip Darkshore,1
step
    #optional
    .isQuestComplete 971
    .goto 1437/0,-782.03,-3793.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shellei Brondir|r
    .fly Ironforge >> Fly to Ironforge
    .target Shellei Brondir
    .zoneskip Ironforge
step
    .isQuestComplete 971
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gerrig Bonegrip|r
    .turnin 971 >> Turn in Knowledge in the Deeps
    .target Gerrig Bonegrip
]])
