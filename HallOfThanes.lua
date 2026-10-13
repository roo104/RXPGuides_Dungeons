-- The Hall of Thanes quest route (Classic Forever, Alliance).
-- Quest chain from the Attune addon (ID_ATTUNE="163"); steps from the RestedXP Forever dungeon guide,
-- dungeon entrance from Leatrix Maps (Forever map coordinates).

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Quests
#name 10-15 The Hall of Thanes

step
    .goto 1426/0,-2009.87,-5860.22,40,0
    .goto 1426/0,-2034.49,-5922.60
    >>Kill |cRXP_ENEMY_Dark Iron Spies|r until one drops the |T237385:0|t[|cRXP_LOOT_Dark Iron Map|r]
    .use 274268 >>|cRXP_WARN_Use the|r |T237385:0|t[|cRXP_LOOT_Dark Iron Map|r] |cRXP_WARN_to start the quest|r
    .collect 274268,1,96391,1 -- Dark Iron Map (1)
    .accept 96391 >> Accept Underground Map
    .mob Dark Iron Spy
step
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Earthseer Farsen|r
    .turnin 96391 >> Turn in Underground Map
    .accept 96393 >> Accept Old Ironforge Incursion
    .target Earthseer Farsen
step
    .goto 1455/0,-971.800,-4820.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Afadra Dunwall|r
    .accept 96394 >> Accept The Restless Dead
    .target Afadra Dunwall
step
    .goto 1455/0,-968.200,-4803.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thom Filch|r
    .accept 96403 >> Accept Important Heirlooms
    .target Thom Filch
step
    .goto Ironforge,27.7,47.9
    >>Enter |cRXP_WARN_The Hall of Thanes|r
    .zoneskip Ironforge,1
step
    #completewith FaldrimAnvilmar
    >>Loot the |cRXP_PICK_Dwarven Heirlooms|r on the ground through the Hall of Thanes
    >>|cRXP_WARN_You can collect plenty of these at the end of the dungeon as well|r
    .complete 96403,1 -- Dwarven Heirloom (8)
step
    #completewith FaldrimAnvilmar
    >>Kill |cRXP_ENEMY_Enraged Apparitions|r and |cRXP_ENEMY_Tormented Souls|r
    .complete 96394,1 -- Enraged Apparition slain (15)
    .mob +Enraged Apparition slain (15)
    .complete 96394,2 -- Tormented Soul slain (10)
    .mob +Tormented Soul slain (10)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ghostly Attendant|r
    .accept 96395 >> Accept An Ancient Grudge
    .target Ghostly Attendant
step
    #label FaldrimAnvilmar
    >>Kill |cRXP_ENEMY_Faldrim Anvilmar|r
    .complete 96395,1 -- Faldrim Anvilmar slain (1)
    .mob Faldrim Anvilmar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ghostly Attendant|r
    .turnin 96395 >> Turn in An Ancient Grudge
    .target Ghostly Attendant
step
    >>Kill |cRXP_ENEMY_Enraged Apparitions|r and |cRXP_ENEMY_Tormented Souls|r
    >>|cRXP_WARN_Complete this now as you may not have a chance to finish it later|r
    .complete 96394,1 -- Enraged Apparition slain (15)
    .mob +Enraged Apparition slain (15)
    .complete 96394,2 -- Tormented Soul slain (10)
    .mob +Tormented Soul slain (10)
step
    #completewith ToU
    >>Loot the |cRXP_PICK_Dwarven Heirlooms|r on the ground through the Hall of Thanes
    >>|cRXP_WARN_You can collect plenty of these at the end of the dungeon as well|r
    .complete 96403,1 -- Dwarven Heirloom (8)
step
    >>Kill |cRXP_ENEMY_Durgen Dirgehammer|r. Loot him for |cRXP_LOOT_Durgen Dirgehammer's Head|r
    .complete 96393,1 -- Durgen Dirgehammer's Head
    .mob Durgen Dirgehammer
step
    #label ToU
    >>Click the |cRXP_PICK_Treaty of Understanding|r
    .accept 98423 >> Accept The Treaty of Understanding
step
    >>Loot the |cRXP_PICK_Dwarven Heirlooms|r on the ground through the Hall of Thanes
    .complete 96403,1 -- Dwarven Heirloom (8)
step
    .goto 1455/0,-968.200,-4803.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thom Filch|r
    .turnin 96403 >> Turn in Important Heirlooms
    .target Thom Filch
step
    .goto 1455/0,-971.800,-4820.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Afadra Dunwall|r
    .turnin 96394 >> Turn in The Restless Dead
    .target Afadra Dunwall
step
    .goto 1455/0,-1022.600,-4865.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_King Magni Bronzebeard|r
    .turnin 96393 >> Turn in Old Ironforge Incursion
    .turnin 98423 >> Turn in The Treaty of Understanding
    .target King Magni Bronzebeard
]])
