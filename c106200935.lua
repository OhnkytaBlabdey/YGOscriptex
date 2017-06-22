--function
function c106200935.initial_effect(c)
	
end
function mov(mc,tw)
if mc and tw then 
else 
--Debug.ShowHint("para needed ")
--print( 'para needed' )
return
end 
local loc =mc:GetLocation()
local ctp = mc:GetControler()
local seq=mc:GetSequence()
local tgseq
if tw == 1 or tw == 2 then
--
if ( seq == 0 and ctp == 0 and tw == 1 ) or ( seq == 4 and ctp == 0 and tw == 2) or ( ctp == 1 and seq == 4 and tw == 1) or ( ctp == 1 and seq == 0 and tw == 2 ) then 
--print('not allowed')
return 0
end
---

if ctp == 0 then
if tw == 1 and seq > 0 then
tgseq=seq-1

elseif tw == 2 and seq < 4 then
tgseq=seq+1

end
else
--ctp == 1 
if tw == 1 and seq < 4 then
tgseq=seq+1

elseif tw == 2 and seq > 0 then
tgseq=seq-1

end
end 
---
if not Duel.GetFieldCard(ctp,loc,tgseq) then
Duel.MoveSequence(mc,tgseq)
return 1
else
-------------------------------------------
----Debug.Show Hint("not available ")
-------------------------------------------
return 0
end
end
--
if tw ==3 or tw == 4 then 

local loc =mc:GetLocation()
local tgp
local dest
---Debug.Show Hint("mov")
--print('mov')
--
if loc == LOCATION_SZONE and  ( ( ctp == 1 and tw ==3 ) or ( ctp == 0 and tw == 4 ) ) then
---Debug.Show Hint("not allowed")
--print('not allowed ')
return 0
end

--
--local seq=mc:GetSequence()
---
tgseq = seq
if ( ctp == 1 and loc == LOCATION_MZONE and tw == 4 ) or ( ctp == 0 and loc == LOCATION_MZONE and tw == 3 ) then
tgp = 1-ctp
--x //control change
tgseq = 4-seq
--dest = LOCATION_MZONE
else
tgp = ctp
 
end
---
if loc == LOCATION_SZONE then 
dest = LOCATION_MZONE
end

if ( ctp == 1 and loc == LOCATION_MZONE and tw == 4 ) or ( ctp == 0 and loc == LOCATION_MZONE and tw == 3 ) then

dest = 0x04
elseif loc ==0x04 then
--x
dest = 0x08

end

if mc and tgp and dest then
if Duel.GetFieldCard(tgp,dest,tgseq) then
 --Debug.ShowHint("not available ")
 return 0
 end
--Debug.ShowHint("para ready tgp,dest,seq: ".. tgp .. "," .. dest .. "," .. seq)
--print('' )
else
--Debug.ShowHint
--print('para error,can t move')
end
--
if tgp == ctp then 
if Duel.MoveToField(mc,0,tgp,dest,POS_FACEUP_ATTACK,false) then
else
return 0
--xx return 1
--Debug.ShowHint
--print('MoveToField')
end 

else 
--x if not tgp == ctp then
if Duel.GetControl(mc,tgp) then
else
return 0
---xx return 1
--Debug.ShowHint("GetControl: ".. tgp )
--print('' )
end

end 
Duel.BreakEffect()
Duel.Readjust()
Duel.MoveSequence(mc,tgseq)
return 1
end 
end
function XyzSummon(tp,mxyz,mg,og,pos)

if not pos then
pos=POS_FACEUP_ATTACK
end

 if mxyz and mg and pos then
--overlaygroup 

if og and og:GetCount()~=0 then
	Duel.Overlay(mxyz,og)
end
	mxyz:SetMaterial(mg)
--
if not og then

local ovg=Group.CreateGroup()
local n=mg:GetCount()
local mgc=mg:Clone()
while n > 0 do
local mc=mgc:GetFirst()
local g1=mc:GetOverlayGroup()
ovg:Merge(g1)
mgc:RemoveCard(mc)

n = n - 1
end

Duel.SendtoGrave(ovg,REASON_RULE)
end
--
	Duel.Overlay(mxyz,mg)
	Duel.SpecialSummon(mxyz,SUMMON_TYPE_XYZ,tp,tp,false,false,pos)
	Duel.Overlay(mxyz,mg)
	mxyz:CompleteProcedure()
Duel.Readjust()
else
Debug.ShowHint("error,no para ")
 end
end
--
function AddCard(pl,code,loc,seq,pos)
if seq then
else
seq=0
end
local c_a=Duel.CreateToken(pl,code)
if loc==LOCATION_GRAVE then
Duel.SendtoGrave(c_a,REASON_RULE)
elseif loc==LOCATION_HAND then
Duel.SendtoHand(c_a,pl,REASON_RULE)
elseif loc==LOCATION_EXTRA then
Duel.SendtoDeck(c_a,pl,seq,REASON_RULE)
elseif loc==LOCATION_DECK then
Duel.SendtoDeck(c_a,pl,seq,REASON_RULE)
elseif loc==LOCATION_MZONE or loc==LOCATION_SZONE then
Duel.SendtoDeck(c_a,pl,0,REASON_RULE)
Duel.MoveToField(c_a,pl,pl,loc,pos,false)
end
--
Duel.MoveSequence(c_a,seq)
return c_a
end
function RandomSelectdeck()
local deckct=Duel.GetFieldGroupCount(0,0,LOCATION_DECK)
--Debug.ShowHint("deckct:"..deckct)
local g1=Duel.GetDecktopGroup(1,deckct)
local n = math.random(1,deckct)
--Debug.ShowHint("n:"..n)
local c_1 = g1:GetFirst()
local i=1
while i < n do
i=i+1
c_1 = g1:GetNext()
end
return c_1 
end
---
function randadd()
  local loc1=LOCATION_MZONE 
 for pl1=0,1 do
for seq = 0,4 do
if Duel.GetFieldCard(pl1,loc1,seq) then
else
local c_1=RandomSelectdeck()
local code1 = c_1:GetOriginalCode()
AddCard(pl1,code1,loc1,seq,POS_FACEUP_ATTACK)
end
end
 end
  ----
loc1=LOCATION_SZONE
 for pl1=0,1 do
for seq = 0,4 do
if Duel.GetFieldCard(pl1,loc1,seq) then
else
local c_1=RandomSelectdeck()
local code1 = c_1:GetOriginalCode()
AddCard(pl1,code1,loc1,seq,POS_FACEUP_ATTACK)
end
end
 end
  ----
end
function randtw()
local n=math.random(1,4)
return n 
end
function Clearc(tc)
if not tc then return 0 end
if Duel.Remove(tc,POS_FACEUP_ATTACK,0x400) == 1 then
Duel.Readjust()
--if Group.IsContains(tg,tc) then
--tg:RemoveCard(tc)
--end
return 1
end
end
function mvg(gmv,n)
local ctl =0

--xx
for i =1,4 do
--taijiandantaibaoli 
--Debug.ShowHint("1")
--ct = 0

 local c1=gmv:GetFirst()
 while c1 do
 --Debug.ShowHint("2")
 ctl= ctl + mov(c1,n)
 
 c1= gmv:GetNext()
 end

end
end