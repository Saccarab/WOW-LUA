--------------------------------------------------------------------------------
-- Module Declaration
--
local mod, CL = BigWigs:NewBoss("Amalgam of Souls", 1081, 1518)
if not mod then return end
mod:RegisterEnableMob(98542)
--------------------------------------------------------------------------------
-- Locals
--
local gorgeCount = 0
--------------------------------------------------------------------------------
-- Initialization
--
function mod:GetOptions()
	return {
		196078, --Call Souls
		{194956, "TANK"}, --Reap Soul
		196587, --Soul Burst
		{194966, "SAY"}, --Soul Echoes
		195254, --Swirling scythe
		196930, --Soulgorge
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")
	self:Log("SPELL_CAST_START", "CallSouls", 196078)
	self:Log("SPELL_CAST_SUCCESS", "SoulEchoes", 194966) --27.5
	self:Log("SPELL_CAST_START", "SoulBurstStart", 196587)
	self:Log("SPELL_CAST_SUCCESS", "SoulBurstSuccess", 196587)
	self:Log("SPELL_CAST_SUCCESS", "ReapSoul", 194956) -- 14.6
	self:Log("SPELL_CAST_SUCCESS", "SwirlingScythe", 195254) -- 20 SEC CD
	self:Log("SPELL_AURA_APPLIED", "SoulEchoesApplied", 194966)
	self:Log("SPELL_AURA_APPLIED", "Soulgorge", 196930)
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")W
end
--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:OnEngage()
	gorgeCount = 0
	self:Bar(195254, 8.5)
	self:Bar(194966, 15.7)
	self:Bar(194956, 20.4)
end

function mod:Soulgorge(args)
	gorgeCount = gorgeCount + 1
end

function mod:SoulBurstStart(args)
	if gorgeCount == 2 then
		self:Message(args.spellId, "Attention", "Alert", CL.incoming:format(args.spellName))
	else if gorgeCount >= 3 then
		self:Message(args.spellId, "Important", "Warning", CL.incoming:format(args.spellName))
	end
end

function mod:SoulBurstSuccess(args)
	self:CDBar(195254, 8.5)
	self:CDBar(194966, 15.6)
	self:CDBar(194956, 20.4)
	gorgeCount = 0;
end

function mod:CallSouls(args)
	self:CDBar(196587, 29)
	self:StopBar(195254)
	self:StopBar(194966)
	self:StopBar(194956)
end

function mod:ReapSoul(args)
	self:Bar(args.spellId, 13.4)
	if self:Tank() then
		self:Message(args.spellId, "Attention", "Warning", CL.incoming:format(args.spellName))
	end
end

function mod:SwirlingScythe(args)
	self:Message(args.spellId, "Attention")
	self:Bar(args.spellId, 21.2)
end

function mod:SoulEchoes(args)
	self:Bar(args.spellId, 21.2)
end

function mod:SoulEchoesApplied(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId)
	end
end
