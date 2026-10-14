-- City of Dalaran quest route (Classic Forever, Alliance).
-- Quest chain and quest text from the Attune addon (ID_ATTUNE="225"); Stormwind NPC, portal and Dalaran portal
-- positions checked in game.

RXPGuides.RegisterGuide([[
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Quests
#name 28-32 City of Dalaran

-- Stormwind pickups
step
    .goto 1453,31.3,62.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shylamiir|r
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 92456 >> Accept A Green Sample
    .target Shylamiir
step
    .goto 1453,48.8,87.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Sorcerer Andromath|r in the Mage Quarter
    >>|cRXP_WARN_If you skip this, ask your group to share it with you|r
    .accept 92489 >> Accept Power Overwhelming
    .target High Sorcerer Andromath
step
    .goto 1453,48.8,87.6
    .zone Alterac Mountains >> Take the portal to Dalaran in the Mage Quarter tower
    .zoneskip Hillsbrad Foothills

-- Southshore
step
    .goto Hillsbrad Foothills,48.3,60.1
    >>Travel south-east to Southshore. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emissary Jacques|r
    .accept 92432 >> Accept An Alarming Request
    .target Emissary Jacques

-- City of Dalaran
step
    .goto Silverpine Forest,68.6,45.2
    >>Travel back to the City of Dalaran. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Image of Archmage Modera|r outside the city
    >>|cRXP_WARN_Modera is outside the city walls, not inside Dalaran. Go around the outside of the city to reach her|r
    .turnin 92432 >> Turn in An Alarming Request
    .accept 92458 >> Accept Heart of Disruption
    .accept 92457 >> Accept Starving Arcane
    .target Image of Archmage Modera
step
    #completewith DalaranEnd
    >>Enter the City of Dalaran dungeon with your group
    >>|cRXP_WARN_Only one person in the group needs the key to enter|r
step
    #completewith DalaranEnd
    >>Loot the |cRXP_LOOT_Fel Infused Blossom|r inside the dungeon
    .complete 92456,1 -- Fel Infused Blossom (1)
step
    #completewith DalaranEnd
    >>Kill |cRXP_ENEMY_Seeking Remnants|r, |cRXP_ENEMY_Saturated Remnants|r and |cRXP_ENEMY_Mana Echoes|r inside the dungeon
    .complete 92457,1 -- Seeking Remnant (8)
    .mob +Seeking Remnant
    .complete 92457,2 -- Saturated Remnant (8)
    .mob +Saturated Remnant
    .complete 92457,3 -- Mana Echo (8)
    .mob +Mana Echo
step
    >>Kill the |cRXP_ENEMY_Arcanic Enigma|r
    .complete 92489,1 -- Arcanic Enigma slain (1)
    .mob Arcanic Enigma
step
    #label DalaranEnd
    >>Loot the |cRXP_LOOT_Arcane Mote|r
    .complete 92458,1 -- Arcane Mote (1)
step
    >>Finish looting the |cRXP_LOOT_Fel Infused Blossom|r and killing |cRXP_ENEMY_Remnants|r and |cRXP_ENEMY_Mana Echoes|r before you leave
    .complete 92456,1 -- Fel Infused Blossom (1)
    .complete 92457,1 -- Seeking Remnant (8)
    .complete 92457,2 -- Saturated Remnant (8)
    .complete 92457,3 -- Mana Echo (8)

-- Turn-ins
step
    .goto Silverpine Forest,68.6,45.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Image of Archmage Modera|r outside the city
    >>|cRXP_WARN_Modera is outside the city walls, not inside Dalaran. Go around the outside of the city to reach her|r
    .turnin 92458 >> Turn in Heart of Disruption
    .turnin 92457 >> Turn in Starving Arcane
    .target Image of Archmage Modera
step
    .goto Alterac Mountains,11.9,56.0
    .zone Stormwind City >> Take the portal back to Stormwind
step
    .goto 1453,48.8,87.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Sorcerer Andromath|r in the Mage Quarter
    .turnin 92489 >> Turn in Power Overwhelming
    .target High Sorcerer Andromath
step
    .goto 1453,31.3,62.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shylamiir|r
    .turnin 92456 >> Turn in A Green Sample
    .target Shylamiir
]])
