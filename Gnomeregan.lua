-- Gnomeregan quest route (Classic Forever, Alliance).
-- Quest chain and quest text from the Attune addon (ID_ATTUNE="230"); NPC, tram, Kharanos and dungeon
-- positions from the RestedXP Classic Alliance 23-30 guide.

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Quests
#name 31-34 Gnomeregan

-- Stormwind pickups
step
    .goto StormwindClassic,40.551,30.959
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Sarno|r in the Cathedral
    .accept 2923 >> Accept Tinkmaster Overspark
    .target Brother Sarno
step
    .goto StormwindClassic,55.511,12.502
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shoni the Shilent|r in the Dwarven District
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 2928 >> Accept Gyrodrillmatic Excavationators
    .target Shoni the Shilent
step
    #completewith next
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >> Enter the Deeprun Tram. Take the Tram to Ironforge
    .zoneskip Ironforge

-- Tinker Town
step
    .goto Ironforge,69.540,50.325
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkmaster Overspark|r in Tinker Town
    .turnin -2923 >> Turn in Tinkmaster Overspark
    .accept 2922 >> Accept Save Techbot's Brain!
    .target Tinkmaster Overspark
step
    .goto Ironforge,69.182,50.556
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gnoarn|r
    .accept 2927 >> Accept The Day After
    .target Gnoarn
step
    .goto Ironforge,68.743,48.969
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Tinker Mekkatorque|r
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 2929 >> Accept The Grand Betrayal
    .target High Tinker Mekkatorque
step
    .goto Ironforge,67.925,46.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 2924 >> Accept Essential Artificials
    .target Klockmort Spannerspan
step
    #optional
    .goto Ironforge,18.10,51.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Firebrew|r
    .home >> Set your Hearthstone to Ironforge
    .target Innkeeper Firebrew
    .bindlocation 1537

-- Kharanos
step
    #completewith next
    .goto Dun Morogh,53.5,34.9
    .zone Dun Morogh >> Exit Ironforge
step
    .goto Dun Morogh,46.005,48.637,10,0
    .goto Dun Morogh,45.887,49.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r in Kharanos
    .turnin 2927 >> Turn in The Day After
    .accept 2926 >> Accept Gnogaine
    .target Ozzie Togglevolt

-- Outside Gnomeregan
step
    #completewith next
    .goto Dun Morogh,24.35,39.78,30,0
    .goto 1415/0,716.2033,-5160.7777,45 >> Travel west to Gnomeregan and find a group
step
    .goto 1415/0,723.2432,-5066.9113,50,0
    .goto 1415/0,818.2830,-5055.1780,50,0
    .goto 1415/0,730.2832,-4956.6183,50,0
    .goto 1415/0,723.2432,-5066.9113
    .use 9283 >>|cRXP_WARN_Use the|r |T132788:0|t[Empty Leaden Collection Phial] |cRXP_WARN_on an |cRXP_ENEMY_Irradiated Invader|r or|r |cRXP_ENEMY_Irradiated Pillager|r
    >>|cRXP_WARN_The mob must be ALIVE when you use it. This is done OUTSIDE the dungeon|r
    .complete 2926,1 -- Full Leaden Collection Phial (1)
    .mob Irradiated Invader
    .mob Irradiated Pillager
step
    .goto 1415/0,733.8032,-4996.5115,70,0
    .goto 1415/0,828.8429,-4926.1117
    >>Kill |cRXP_ENEMY_Techbot|r. Loot him for his |cRXP_LOOT_Memory Core|r
    >>|cRXP_WARN_Techbot is OUTSIDE the dungeon portal|r
    .complete 2922,1 -- Techbot's Memory Core (1)
    .mob Techbot
step
    .goto 1415/0,804.2030,-5055.1780,40,0
    .goto 1415/0,941.4826,-5160.7777
    .subzone 721,2 >> Enter the Gnomeregan dungeon portal

-- Gnomeregan
step
    #completewith Thermaplugg
    >>Kill |cRXP_ENEMY_Gnomeregan mobs|r. Loot them for their |cRXP_LOOT_Robo-mechanical Guts|r
    .complete 2928,1 -- Robo-mechanical Guts (24)
step
    #completewith Thermaplugg
    >>Open the |cRXP_PICK_Artificial Extrapolators|r. Loot them for |cRXP_LOOT_Essential Artificials|r
    .complete 2924,1 -- Essential Artificial (12)
step
    #completewith Thermaplugg
    >>|cRXP_WARN_If you loot an|r |cRXP_LOOT_Engraved Ring|r|cRXP_WARN_, use it to start Return of the Ring|r
    .accept 79987 >> Accept Return of the Ring
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kernobee|r in The Dormitory, right outside the gnomish safe zone
    >>|cRXP_WARN_This starts an escort quest. The turn-in is with Scooty in Booty Bay, so only take it if you are going there|r
    .accept 2904 >> Accept A Fine Mess
    .unitscan Kernobee
step
    #optional
    >>Escort |cRXP_FRIENDLY_Kernobee|r to the Clockwerk Run exit
    .complete 2904,1 -- Kernobee Rescue
    .isOnQuest 2904
step
    #label Thermaplugg
    >>Kill |cRXP_ENEMY_Mekgineer Thermaplugg|r
    .complete 2929,1 -- Mekgineer Thermaplugg slain
    .mob Mekgineer Thermaplugg
step
    #optional
    >>|cRXP_WARN_If you looted|r |cRXP_LOOT_Thermaplugg's Engineering Notes|r|cRXP_WARN_, use them to start The Mad King|r
    .accept 80324 >> Accept The Mad King
step
    >>Finish looting |cRXP_LOOT_Robo-mechanical Guts|r and |cRXP_LOOT_Essential Artificials|r before you leave
    >>|cRXP_WARN_The Artificial Extrapolators respawn after a few minutes|r
    .complete 2928,1 -- Robo-mechanical Guts (24)
    .complete 2924,1 -- Essential Artificial (12)

-- Turn-ins
step
    #optional
    .hs >> Hearth to Ironforge
    .bindlocation 1537,1
step
    .goto Dun Morogh,46.005,48.637,10,0
    .goto Dun Morogh,45.887,49.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r in Kharanos
    >>|cRXP_WARN_If you hearthed to Ironforge, do this last|r
    .turnin 2926 >> Turn in Gnogaine
    .target Ozzie Togglevolt
step
    .goto Ironforge,69.540,50.325
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkmaster Overspark|r in Tinker Town
    .turnin 2922 >> Turn in Save Techbot's Brain!
    .target Tinkmaster Overspark
step
    .goto Ironforge,68.743,48.969
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Tinker Mekkatorque|r
    .turnin 2929 >> Turn in The Grand Betrayal
    .target High Tinker Mekkatorque
step
    #optional
    .isOnQuest 80324
    .goto Ironforge,68.743,48.969
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Tinker Mekkatorque|r
    .turnin 80324 >> Turn in The Mad King
    .target High Tinker Mekkatorque
step
    .goto Ironforge,67.925,46.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 2924 >> Turn in Essential Artificials
    .target Klockmort Spannerspan
step
    #optional
    .isOnQuest 79987
    .goto Ironforge,36.377,3.614
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talvash del Kissel|r in the Mystic Ward
    .turnin 79987 >> Turn in Return of the Ring
    .target Talvash del Kissel
step
    #completewith next
    .goto 1455/0,-1330.28,-4843.6,5,0
    .zone Stormwind City >> Take the Deeprun Tram to Stormwind
    .zoneskip Stormwind City
step
    .goto StormwindClassic,55.511,12.502
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shoni the Shilent|r in the Dwarven District
    .turnin 2928 >> Turn in Gyrodrillmatic Excavationators
    .target Shoni the Shilent
]])
