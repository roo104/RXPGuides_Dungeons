-- The Stockade quest route (Classic Forever, Alliance).
-- Quest chain from the Attune addon (ID_ATTUNE="220"). NPC and flight master positions from the RestedXP
-- Forever guides; Nikova Raskol converted from Attune's classic Stormwind map position to world coordinates.

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Quests
#name 26-29 The Stockade

-- Stormwind pickups
step
    .goto 1453/0,719.67,-8550.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baros Alexston|r
    >>|cRXP_WARN_The Unsent Letter starts from a letter VanCleef drops in the Deadmines. Skip this if you don't have it|r
    .turnin 373 >> Turn in The Unsent Letter
    .accept 389 >> Accept Bazil Thredd
    .target Baros Alexston
step
    .goto 1453/0,394.30,-8696.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nikova Raskol|r in Old Town
    .accept 388 >> Accept The Color of Blood
    .target Nikova Raskol
step
    .goto 1453/0,810.53,-8809.81,10,0
    .goto 1453/0,828.45,-8799.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warden Thelwater|r outside The Stockade
    .accept 387 >> Accept Quell The Uprising
    .turnin 389 >> Turn in Bazil Thredd
    .accept 391 >> Accept The Stockade Riots
    .target Warden Thelwater

-- Redridge and Duskwood pickups
step
    .goto 1453/0,490.03,-8835.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    >>|cRXP_WARN_If you do not have the Redridge Mountains flight path, run east through Elwynn Forest instead|r
    .fly Redridge >> Fly to Redridge Mountains
    .target Dungar Longdrink
    .zoneskip Redridge Mountains
step
    .goto 1433/0,-2140.85,-9249.440
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Berton|r
    .accept 386 >> Accept What Comes Around...
    .target Guard Berton
step
    .goto 1433/0,-2234.89,-9435.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariena Stormfeather|r
    >>|cRXP_WARN_If you do not have the Duskwood flight path, fly to Stormwind and run south through Elwynn Forest instead|r
    .fly Duskwood >> Fly to Duskwood
    .target Ariena Stormfeather
    .zoneskip Duskwood
step
    .goto 1431/0,-1108.99,-10576.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Councilman Millstipe|r in the Darkshire town hall
    .accept 377 >> Accept Crime and Punishment
    .target Councilman Millstipe
step
    .goto 1431/0,-1258.79,-10513.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felicia Maline|r
    .fly Stormwind >> Fly to Stormwind
    .target Felicia Maline
    .zoneskip Stormwind City

-- The Stockade
step
    #completewith StockadeEnd
    .goto 1453/0,810.53,-8809.81 >> Enter The Stockade
    .zoneskip 225
step
    #completewith StockadeEnd
    >>Kill |cRXP_ENEMY_Defias|r inside The Stockade. Loot them for their |cRXP_LOOT_Red Wool Bandanas|r
    .complete 388,1 -- Red Wool Bandana (10)
step
    #completewith StockadeEnd
    >>Kill |cRXP_ENEMY_Defias Prisoners|r, |cRXP_ENEMY_Defias Convicts|r and |cRXP_ENEMY_Defias Insurgents|r
    .complete 387,1
    .complete 387,2
    .complete 387,3
    .mob Defias Prisoner
    .mob Defias Convict
    .mob Defias Insurgent
step
    >>Kill |cRXP_ENEMY_Targorr the Dread|r. Loot him for his |cRXP_LOOT_Head|r
    .complete 386,1 -- Head of Targorr (1)
    .mob Targorr the Dread
step
    >>Kill |cRXP_ENEMY_Dextren Ward|r. Loot him for his |cRXP_LOOT_Hand|r
    .complete 377,1 -- Hand of Dextren Ward (1)
    .mob Dextren Ward
step
    #label StockadeEnd
    >>Kill |cRXP_ENEMY_Bazil Thredd|r. Loot him for his |cRXP_LOOT_Head|r
    .complete 391,1 -- Head of Bazil Thredd (1)
    .mob Bazil Thredd
step
    >>Finish killing |cRXP_ENEMY_Defias|r and looting |cRXP_LOOT_Red Wool Bandanas|r before you leave
    .complete 388,1 -- Red Wool Bandana (10)
    .complete 387,1
    .complete 387,2
    .complete 387,3

-- Turn-ins
step
    .goto 1453/0,810.53,-8809.81,10,0
    .goto 1453/0,828.45,-8799.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warden Thelwater|r outside The Stockade
    .turnin 387 >> Turn in Quell The Uprising
    .turnin 391 >> Turn in The Stockade Riots
    .target Warden Thelwater
step
    .goto 1453/0,394.30,-8696.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nikova Raskol|r in Old Town
    .turnin 388 >> Turn in The Color of Blood
    .target Nikova Raskol
step
    .goto 1453/0,490.03,-8835.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    .fly Duskwood >> Fly to Duskwood
    .target Dungar Longdrink
    .zoneskip Duskwood
step
    .goto 1431/0,-1108.99,-10576.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Councilman Millstipe|r in the Darkshire town hall
    .turnin 377 >> Turn in Crime and Punishment
    .target Councilman Millstipe
step
    .goto 1431/0,-1258.79,-10513.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felicia Maline|r
    .fly Redridge >> Fly to Redridge Mountains
    .target Felicia Maline
    .zoneskip Redridge Mountains
step
    .goto 1433/0,-2140.85,-9249.440
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Berton|r
    .turnin 386 >> Turn in What Comes Around...
    .target Guard Berton
]])
