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

-- Cache frequently used global functions for better performance
local print, pairs, lower, gsub = print, pairs, string.lower, string.gsub
local GetCurrentRegionName, GetRealmName = GetCurrentRegionName, GetRealmName
local C_LFGList = C_LFGList

-- Use local variables to prevent repeated table lookups
local REGION_REALMS = PR.REGION_REALMS
local REGION_TEXT = PR.REGION_TEXT
local REGION_COLORED = PR.REGION_COLORED

-- prevent error message spamming by printing the messages only once
PR.GlobalRegionNotSupportedPrinted = false
PR.RealmUnknownPrinted = {}

-- Optimize string concatenation by using table.concat
local function PrintGlobalRegionNotSupported()
    if not PR.GlobalRegionNotSupportedPrinted then
        print(table.concat({
            "Premade Regions currently only support the 'Americas' region ",
            "(North/Latin/South America, Australia and New Zealand)"
        }))
        PR.GlobalRegionNotSupportedPrinted = true
    end
end
PR.PrintGlobalRegionNotSupported = PrintGlobalRegionNotSupported

local function PrintRealmNotFound(realm)
    if realm and not PR.RealmUnknownPrinted[realm] then
        print(table.concat({
            "Premade Regions: the realm ", realm, " could not be matched to a region. ",
            "Please open an issue at https://github.com/0xbs/premade-regions/issues"
        }))
        PR.RealmUnknownPrinted[realm] = true
    end
end
PR.PrintRealmNotFound = PrintRealmNotFound

--- Returns the region identifier of a player
--- @param name string the name of the character of the player
--- @return number region identifier (see Regions.lua)
local function GetRegion(name)
    if not name then
        return nil
    end

    -- Check current region
    if GetCurrentRegionName() ~= "US" then
        PrintGlobalRegionNotSupported()
        return nil
    end

    -- Extract realm name and normalize it
    local leaderRealm = name:match("%-(.+)")
    leaderRealm = leaderRealm and lower(gsub(leaderRealm, " ", ""))
        or lower(gsub(GetRealmName(), " ", ""))

    -- Optimize realm name comparison
    for region, regionRealms in pairs(REGION_REALMS) do
        for _, realm in pairs(regionRealms) do
            if lower(gsub(realm, " ", "")) == leaderRealm then
                return region
            end
        end
    end

    -- Could not match the realm to a region
    PrintRealmNotFound(leaderRealm)
    return nil
end
PR.GetRegion = GetRegion

function PR.GetRegionText(name) return REGION_TEXT[GetRegion(name)] end
function PR.GetRegionColored(name) return REGION_COLORED[GetRegion(name)] end

--- Hook on LFGListSearchEntry_Update to add the region to the activity
--- @param self any LFGList
function PR.OnLFGListSearchEntryUpdate(self)
    local searchResultInfo = C_LFGList.GetSearchResultInfo(self.resultID)
    if not searchResultInfo then return end -- Add error handling
    local region = PR.GetRegionColored(searchResultInfo.leaderName)
    self.ActivityName:SetFormattedText("%s %s", region, self.ActivityName:GetText())
end

--- Hook on LFGListApplicationViewer_UpdateApplicantMember to add the region to the name
--- @param member any member object
--- @param appID number applicant identifier for C_LFGList.GetApplicantMemberInfo
--- @param memberIdx number member index for C_LFGList.GetApplicantMemberInfo
--- @param status string failed/cancelled/declined/declined_full/declined_delisted/invitedeclined/timedout/invited/inviteaccepted/invitedeclined
--- @param pendingStatus boolean
function PR.OnLFGListApplicationViewerUpdateApplicantMember(member, appID, memberIdx, status, pendingStatus)
    local name = C_LFGList.GetApplicantMemberInfo(appID, memberIdx)
    if not name then return end -- Add error handling
    local region = PR.GetRegionColored(name)
    member.Name:SetFormattedText("%s %s", region, member.Name:GetText())
end

hooksecurefunc("LFGListSearchEntry_Update", PR.OnLFGListSearchEntryUpdate)
hooksecurefunc("LFGListApplicationViewer_UpdateApplicantMember", PR.OnLFGListApplicationViewerUpdateApplicantMember)

-- Export functions and make them global for other addons like Premade Groups Filter
PremadeRegions = {
    GetRegion = GetRegion,
    GetRegionText = PR.GetRegionText,
    GetRegionColored = PR.GetRegionColored
}
