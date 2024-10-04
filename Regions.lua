-------------------------------------------------------------------------------
-- Premade Regions
-------------------------------------------------------------------------------
-- Copyright (c) 2019 Bernhard Saumweber (gihub.com/0xbs)
--                and github.com/Rustyb0y
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------

local PR = select(2, ...)

-- Optimization: Use local variables for frequently accessed global functions
local setmetatable = setmetatable
local table_concat = table.concat

-- Optimization: Optimize table creation for PR.REGION_TEXT
PR.REGION_TEXT = {
    oce = "Oceanic",
    la = "Los Angeles",
    chi = "Chicago",
    mex = "Mexican",
    bzl = "Brazil",
}

-- Optimization: Simplify metatable creation
PR.REGION_TEXT_META = {
    __index = function() return "Unknown" end
}
setmetatable(PR.REGION_TEXT, PR.REGION_TEXT_META)

-- Optimization: Optimize table creation for PR.REGION_COLORED and use table.concat for string concatenation
PR.REGION_COLORED = {
    oce = "|cFF009900OCE|r",
    la = "|cFF3399FFLA|r",
    chi = "|cFFFF0000CHI|r",
    mex = table_concat({"|cFF006600M", "|cFFFFFFFFE", "|cFFCC3300X"}),
    bzl = table_concat({"|cFF006600B", "|cFFFFFF00Z", "|cFF3333CCL"}),
}

PR.REGION_COLORED_META = {
    __index = function() return "|cFFFFFFFF?|r " end
}
setmetatable(PR.REGION_COLORED, PR.REGION_COLORED_META)

PR.REGION_REALMS = {
    ["oce"] = {
        "Aman'Thul",
        "Barthilas",
        "Caelestrasz",
        "Dath'Remar",
        "Dreadmaul",
        "Frostmourne",
        "Gundrak",
        "Jubei'Thos",
        "Khaz'goroth",
        "Nagrand",
        "Saurfang",
        "Thaurissan",
    },
    ["la"] = {
        "Aegwynn",
        "Akama",
        "Antonidas",
        "Anub'arak",
        "Arathor",
        "Azjol-Nerub",
        "Azjolnerub",
        "Blackrock",
        "Blackwater Raiders",
        "Bladefist",
        "Bloodscalp",
        "Bonechewer",
        "Borean Tundra",
        "Boulderfist",
        "Bronzebeard",
        "Cairne",
        "Cenarion Circle",
        "Cenarius",
        "Chromaggus",
        "Crushridge",
        "Daggerspine",
        "Darkspear",
        "Darrowmere",
        "Draenor",
        "Dragonblight",
        "Dragonmaw",
        "Drak'Tharon",
        "Drak'thul",
        "Draka",
        "Drenden",
        "Dunemaul",
        "Echo Isles",
        "Eitrigg",
        "Eldre'Thalas",
        "Farstriders",
        "Feathermoon",
        "Fenris",
        "Firetree",
        "Frostmane",
        "Frostwolf",
        "Garithos",
        "Garrosh",
        "Gurubashi",
        "Hakkar",
        "Hydraxis",
        "Hyjal",
        "Khaz Modan",
        "Kil'jaeden",
        "Kilrogg",
        "Korgath",
        "Korialstrasz",
        "Kul Tiras",
        "Lightbringer",
        "Maiev",
        "Malorne",
        "Misha",
        "Mok'Nathal",
        "Moon Guard",
        "Mug'thol",
        "Muradin",
        "Nathrezim",
        "Nazgrel",
        "Ner'zhul",
        "Nesingwary",
        "Nordrassil",
        "Perenolde",
        "Proudmoore",
        "Quel'dorei",
        "Rexxar",
        "Rivendare",
        "Runetotem",
        "Scarlet Crusade",
        "Sen'jin",
        "Shadow Council",
        "Shadowsong",
        "Shandris",
        "Shu'halo",
        "Silver Hand",
        "Silvermoon",
        "Sisters of Elune",
        "Skywall",
        "Smolderthorn",
        "Spirestone",
        "Stonemaul",
        "Stormscale",
        "Suramar",
        "Terenas",
        "Thorium Brotherhood",
        "Tichondrius",
        "Tortheldrin",
        "Uldum",
        "Uther",
        "Vashj",
        "Vek'nilash",
        "Windrunner",
        "Winterhoof",
        "Wyrmrest Accord",
    },
    ["chi"] = {
        "Aerie Peak",
        "Agamaggan",
        "Aggramar",
        "Alexstrasza",
        "Alleria",
        "Altar of Storms",
        "Alterac Mountains",
        "Andorhal",
        "Anetheron",
        "Anvilmar",
        "Archimonde",
        "Area 52",
        "Argent Dawn",
        "Arthas",
        "Arygos",
        "Auchindoun",
        "Azgalor",
        "Azshara",
        "Azuremyst",
        "Baelgun",
        "Balnazzar",
        "Black Dragonflight",
        "Blackhand",
        "Blackwing Lair",
        "Blade's Edge",
        "Bleeding Hollow",
        "Blood Furnace",
        "Bloodhoof",
        "Burning Blade",
        "Burning Legion",
        "Cho'gall",
        "Coilfang",
        "Dalaran",
        "Dalvengyr",
        "Dark Iron",
        "Dawnbringer",
        "Deathwing",
        "Demon Soul",
        "Dentarg",
        "Destromath",
        "Dethecus",
        "Detheroc",
        "Doomhammer",
        "Durotan",
        "Duskwood",
        "Earthen Ring",
        "Elune",
        "Emerald Dream",
        "Eonar",
        "Eredar",
        "Executus",
        "Exodar",
        "Fizzcrank",
        "Galakrond",
        "Garona",
        "Ghostlands",
        "Gilneas",
        "Gnomeregan",
        "Gorefiend",
        "Gorgonnash",
        "Greymane",
        "Grizzly Hills",
        "Gul'dan",
        "Haomarush",
        "Hellscream",
        "Icecrown",
        "Illidan",
        "Jaedenar",
        "Kael'thas",
        "Kalecgos",
        "Kargath",
        "Kel'Thuzad",
        "Khadgar",
        "Kirin Tor",
        "Laughing Skull",
        "Lethon",
        "Lightning's Blade",
        "Lightninghoof",
        "Llane",
        "Lothar",
        "Madoran",
        "Maelstrom",
        "Magtheridon",
        "Mal'Ganis",
        "Malfurion",
        "Malygos",
        "Mannoroth",
        "Medivh",
        "Moonrunner",
        "Nazjatar",
        "Norgannon",
        "Onyxia",
        "Ravencrest",
        "Ravenholdt",
        "Sargeras",
        "Scilla",
        "Sentinels",
        "Shadowmoon",
        "Shattered Halls",
        "Shattered Hand",
        "Skullcrusher",
        "Spinebreaker",
        "Staghelm",
        "Steamwheedle Cartel",
        "Stormrage",
        "Stormreaver",
        "Tanaris",
        "Terokkar",
        "The Forgotten Coast",
        "The Scryers",
        "The Underbog",
        "The Venture Co",
        "Thrall",
        "Thunderhorn",
        "Thunderlord",
        "Trollbane",
        "Turalyon",
        "Twisting Nether",
        "Uldaman",
        "Undermine",
        "Ursin",
        "Velen",
        "Warsong",
        "Whisperwind",
        "Wildhammer",
        "Ysera",
        "Ysondre",
        "Zangarmarsh",
        "Zul'jin",
        "Zuluhed",
    },
    ["mex"] = {
        "Drakkari",
        "Quel'Thalas",
        "Ragnaros",
    },
    ["bzl"] = {
        "Azralon",
        "Gallywix",
        "Goldrinn",
        "Nemesis",
        "Tol Barad",
    }
}
