--全移动
function c106151452.initial_effect(c)
	

	local e1=Effect.CreateEffect(c)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetOperation(c106151452.op)
	c:RegisterEffect(e1)
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

--function movc(c,n) 
--ct = ct + mov(c,n)
--end

function c106151452.op(e,tp,eg,ep,ev,re,r,rp)
local sc=e:GetHandler()
Duel.SendtoHand(sc,tp,REASON_RULE)
local g1=Duel.GetFieldGroup(0,0x08,0x08)
local g2=Duel.GetFieldGroup(0,0x04,0x04)
Group.Merge(g1,g2)
local n,m = Duel.AnnounceNumber(tp,1,2,3,4)


local ct =0

--xx
for i =1,4 do
--taijiandantaibaoli 
--Debug.ShowHint("1")
--ct = 0

 local c1=g1:GetFirst()
 while c1 do
 --Debug.ShowHint("2")
 ct= ct + mov(c1,n)
 
 c1= g1:GetNext()
 end

--Group.ForEach( g1 , movc ( n ) )
end
--
--Debug.ShowHint("oping")
Duel.SendtoHand(sc,tp,0x400)
end