-- Druid class quests (Classic Forever, Alliance): Bear Form, Cure Poison, Aquatic Form.
-- Chains as in Wowhead's "Druid Class Quests in WoW Classic" guide and Attune (AttuneClassQuests.lua);
-- steps and coordinates from the RestedXP Forever Night Elf guides where available, quest text from Attune.

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance Druid
#group RestedXP Forever Class Quests (A)
#subgroup Druid
#name 10 Bear Form
#next 14 Cure Poison

step
    .goto 1457/1,2563.92,10179.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r on the middle level of the Cenarion Enclave in Darnassus
    .turnin 5923 >> Turn in Heeding the Call
    .turnin 5924 >> Turn in Heeding the Call
    .turnin 5925 >> Turn in Heeding the Call
    .accept 5921 >> Accept Moonglade
    .target Mathrengyl Bearwalker
step
    #completewith next
    .cast 18960 >> Cast Teleport: Moonglade
    >>|cRXP_WARN_It will be in your spellbook|r
    .zoneskip Moonglade
step
    .goto 1450/1,-2678.76,8019.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dendrite Starblaze|r up stairs
    .turnin 5921 >> Turn in Moonglade
    .accept 5929 >> Accept Great Bear Spirit
    .target Dendrite Starblaze
step
    .goto 1450/1,-2422.77,8079.37,15,0
    .goto 1450/1,-2285.42,8069.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Great Bear Spirit|r
    .complete 5929,1 -- Seek out the Great Bear Spirit
    .skipgossip
    .target Great Bear Spirit
step
    .goto 1450/1,-2678.76,8019.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dendrite Starblaze|r up stairs
    .turnin 5929 >> Turn in Great Bear Spirit
    .accept 5931 >> Accept Back to Darnassus
    .target Dendrite Starblaze
step
    .goto 1450/1,-2400.33,7795.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Silva Fil'naveth|r
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Silva Fil'naveth
    .zoneskip Moonglade,1
step
    .goto 1457/1,2563.92,10179.040
    >>Take the portal up to Darnassus. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 5931 >> Turn in Back to Darnassus
    .accept 6001 >> Accept Body and Heart
    .target Mathrengyl Bearwalker
step
    .goto 1438/1,841.10,8640.58
    >>Take the portal down to Rut'theran Village. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fly Darkshore >> Fly to Darkshore
    .target Vesprystus
    .zoneskip Darkshore
step
    #completewith Lunaclaw
    .goto 1439/1,92.42,6325.98
    .cast 18974 >>|cRXP_WARN_Use the|r |T132857:0|t[Cenarion Moondust] |cRXP_WARN_at the |cRXP_PICK_Moonkin Stone|r inside the cave to summon |cRXP_ENEMY_Lunaclaw|r at the entrance of the cave|r
    .timer 4,Body and Heart RP
    .use 15208
step
    #label Lunaclaw
    .goto 1439/1,119.27,6344.32
    >>Kill |cRXP_ENEMY_Lunaclaw|r
    .complete 6001,1 -- Defeat Lunaclaw
    .mob Lunaclaw
step
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caylais Moonfeather|r in Auberdine
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Caylais Moonfeather
    .zoneskip Darkshore,1
step
    .goto 1457/1,2563.98,10179.00
    >>Take the portal up to Darnassus. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 6001 >> Turn in Body and Heart
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
]])

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance Druid
#group RestedXP Forever Class Quests (A)
#subgroup Druid
#name 14 Cure Poison
#next 16 Aquatic Form

step
    .goto 1457/1,2563.92,10179.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r on the middle level of the Cenarion Enclave in Darnassus
    .accept 6121 >> Accept Lessons Anew
    .target Mathrengyl Bearwalker
step
    #completewith next
    .cast 18960 >> Cast Teleport: Moonglade
    .zoneskip Moonglade
step
    .goto 1450/1,-2678.76,8019.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dendrite Starblaze|r up stairs
    .turnin 6121 >> Turn in Lessons Anew
    .accept 6122 >> Accept The Principal Source
    .target Dendrite Starblaze
step
    .goto 1450/1,-2400.33,7795.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Silva Fil'naveth|r
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Silva Fil'naveth
    .zoneskip Moonglade,1
step
    .goto 1438/1,841.10,8640.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fly Darkshore >> Fly to Darkshore
    .target Vesprystus
    .zoneskip Darkshore
step
    .goto 1439/1,-660.18,6874.43
    >>|cRXP_WARN_Use the|r |T134776:0|t[Empty Cliffspring Falls Sampler] |cRXP_WARN_in the water at the entrance of the Cliffspring River Cave|r
    .complete 6122,1 -- Filled Cliffspring Falls Sampler (1)
step
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r in Auberdine
    .turnin 6122 >> Turn in The Principal Source
    .accept 6123 >> Accept Gathering the Cure
    .target Alanndarian Nightsong
step
    #completewith next
    >>Get 5 |T134187:0|t[Earthroot]
    >>|cRXP_WARN_Pick it with Herbalism (skill 15), find it in |cRXP_PICK_Battered Chests|r, or buy it from the Auction House|r
    .complete 6123,1 -- Earthroot (5)
step
    .goto 1439/1,98.97,6329.03,90,0
    .goto 1439/1,105.52,6189.30,90,0
    .goto 1439/1,164.47,6036.47,90,0
    .goto 1439/1,-51.68,6136.90,90,0
    .goto 1439/1,-25.48,6005.90
    >>Loot |cRXP_LOOT_Lunar Fungus|r on the ground throughout the caves
    .complete 6123,2 -- Lunar Fungus (12)
step
    >>Finish getting 5 |T134187:0|t[Earthroot]
    >>|cRXP_WARN_Pick it with Herbalism (skill 15), find it in |cRXP_PICK_Battered Chests|r, or buy it from the Auction House|r
    .complete 6123,1 -- Earthroot (5)
step
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .turnin 6123 >> Turn in Gathering the Cure
    .accept 6124 >> Accept Curing the Sick
    .target Alanndarian Nightsong
step
    #loop
    .goto 1439/1,-313.68,6883.60,40,0
    .goto 1439/1,98.97,7237.30,40,0
    .goto 1439/1,347.87,6813.73,40,0
    >>|cRXP_WARN_Use the|r |T132801:0|t[Curative Animal Salve] |cRXP_WARN_on|r |cRXP_ENEMY_Sickly Deer|r
    >>|cRXP_WARN_They are spread from the Cliffspring River down to the Ashenvale border|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .use 15826
    .mob Sickly Deer
step
    #completewith next
    .cast 18960 >> Cast Teleport: Moonglade
    .zoneskip Moonglade
step
    .goto 1450/1,-2678.76,8019.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dendrite Starblaze|r up stairs
    .turnin 6124 >> Turn in Curing the Sick
    .accept 6125 >> Accept Power over Poison
    .target Dendrite Starblaze
step
    .goto 1450/1,-2400.33,7795.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Silva Fil'naveth|r
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Silva Fil'naveth
    .zoneskip Moonglade,1
step
    .goto 1457/1,2563.98,10179.00
    >>Take the portal up to Darnassus. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 6125 >> Turn in Power over Poison
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
]])

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance Druid
#group RestedXP Forever Class Quests (A)
#subgroup Druid
#name 16 Aquatic Form

step
    .goto 1457/1,2563.98,10179.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r on the middle level of the Cenarion Enclave in Darnassus
    .accept 26 >> Accept A Lesson to Learn
    .target Mathrengyl Bearwalker
step
    #completewith next
    .cast 18960 >> Cast Teleport: Moonglade
    .zoneskip Moonglade
step
    .goto 1450/1,-2676.22,8019.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dendrite Starblaze|r up stairs
    .turnin 26 >> Turn in A Lesson to Learn
    .accept 29 >> Accept Trial of the Lake
    .target Dendrite Starblaze
step
    .goto 1450/1,-2595.43,7697.24
    >>Swim into Lake Elune'ara
    >>Open a |cRXP_PICK_Bauble Container|r. Loot it for a |T134125:0|t[Shrine Bauble]
    >>|cRXP_WARN_It may spawn in different locations underwater|r
    .collect 15877,1 -- Shrine Bauble (1)
step
    .goto 1450/1,-2212.85,7854.68
    >>|cRXP_WARN_Use the|r |T134125:0|t[Shrine Bauble] |cRXP_WARN_at the Shrine of Remulos tree|r
    .complete 29,1 -- Complete the Trial of the Lake
    .use 15877
step
    .goto 1450/1,-2224.18,7874.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tajarri|r
    .turnin 29 >> Turn in Trial of the Lake
    .accept 272 >> Accept Trial of the Sea Lion
    .target Tajarri

-- Half Pendant of Aquatic Agility (Darkshore)
step
    .goto 1450/1,-2400.33,7795.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Silva Fil'naveth|r
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Silva Fil'naveth
    .zoneskip Moonglade,1
step
    .goto 1438/1,841.10,8640.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fly Darkshore >> Fly to Darkshore
    .target Vesprystus
    .zoneskip Darkshore
step
    .goto 1439/1,-259.32,7839.03
    >>|cRXP_WARN_Swim out in the water|r
    >>Open the |cRXP_PICK_Strange Lockbox|r. Loot it for the |T133443:0|t[|cRXP_LOOT_Half Pendant of Aquatic Agility|r]
    .collect 15883,1 -- Half Pendant of Aquatic Agility (1)

-- Half Pendant of Aquatic Endurance (Westfall)
step
    .goto Darkshore,30.5,40.9
    .zone Stormwind City >> Take the boat from Auberdine to Stormwind
step
    .goto 1453/0,490.03,-8835.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    >>|cRXP_WARN_If you do not have the Westfall flight path, run south through Elwynn Forest instead|r
    .fly Westfall >> Fly to Westfall
    .target Dungar Longdrink
    .zoneskip Westfall
step
    .goto Westfall,17.928,33.099
    >>|cRXP_WARN_Swim out to sea off the west coast of Westfall|r
    >>Open the |cRXP_PICK_Strange Lockbox|r deep underwater. Loot it for the |T133442:0|t[|cRXP_LOOT_Half Pendant of Aquatic Endurance|r]
    .collect 15882,1 -- Half Pendant of Aquatic Endurance (1)

-- Back to Moonglade
step
    #completewith next
    .cast 18960 >> Cast Teleport: Moonglade
    .zoneskip Moonglade
step
    .goto 1450/1,-2212.85,7854.68
    .use 15883 >>|cRXP_WARN_Use the|r |T133443:0|t[Half Pendant of Aquatic Agility] |cRXP_WARN_to combine it with the|r |T133442:0|t[Half Pendant of Aquatic Endurance] |cRXP_WARN_at the Shrine of Remulos|r
    .complete 272,1 -- Pendant of the Sea Lion (1)
step
    .goto 1450/1,-2678.76,8019.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dendrite Starblaze|r up stairs
    .turnin 272 >> Turn in Trial of the Sea Lion
    .accept 5061 >> Accept Aquatic Form
    .target Dendrite Starblaze
step
    .goto 1450/1,-2400.33,7795.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Silva Fil'naveth|r
    .fly Teldrassil >> Fly to Rut'theran Village
    .target Silva Fil'naveth
    .zoneskip Moonglade,1
step
    .goto 1457/1,2563.98,10179.00
    >>Take the portal up to Darnassus. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 5061 >> Turn in Aquatic Form
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
]])
