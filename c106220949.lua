--Delphi测试2
function c106220949.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetOperation(c106220949.op)
	c:RegisterEffect(e1)
end
function c106220949.op(e,tp,eg,ep,ev,re,r,rp)
sc= e:GetHandler()
Duel.SendtoHand(sc,tp,0x400)
---
local tt,xx=Duel.AnnounceNumber(tp,5,10,15,20,25,30)
 for gli=1,tt do
---Global 
--math.randomseed(os.time())
randadd()
 g1=Duel.GetFieldGroup(0,0x08,0x08)
local g2=Duel.GetFieldGroup(0,0x04,0x04)
Group.Merge(g1,g2)
local tc =g1:Select(tp,1,1,nil)
--x
Duel.SendtoDeck(tc,0,0,0x400)
--Clearall 
local ct = 1
while ct > 0 do
ct = 0
----
local cc =g1:GetFirst()
while cc do
--ForEachsamecard..
local n1=cc:GetAttribute()
--Debug.ShowHint("cc:GetAttribute() = "..n1)
local tgc=Duel.GetFieldCard(0,LOCATION_DECK,0)
local n2=tgc:GetAttribute()
--Debug.ShowHint("tgc:GetAttribute() = "..n2)
--x
--print('n1,n2 = '..n1..','..n2)
if ( n1 == n2 ) then
 for i =1,4 do
if cc:GetLocation() == 0x04 or cc:GetLocation() == 0x08 then
else
break 
end
if mov(cc,i) == 1 then
--Debug.ShowHint("i= "..i)
ct = ct + Clearc(cc,g1)
--Debug.ShowHint("ct = "..ct)
break
end
 end
end
--ForEachsamecard..
cc =g1:GetNext()
end
----

end
--Clearall 
--math.randomseed(os.time())
local tw=randtw()
--Debug.ShowHint("tw = "..tw)
g1=Duel.GetFieldGroup(0,0x08,0x08)
g2=Duel.GetFieldGroup(0,0x04,0x04)
Group.Merge(g1,g2)
mvg(g1,tw)
--
g1=nil
tc=nil
local g3=Duel.GetFieldGroup(0,0x01,0)
Duel.Remove(g3,POS_FACEUP_ATTACK,0x400)
---Global 

 end
Duel.SendtoHand(sc,tp,0x400)
randadd()
local opct=Duel.GetFieldGroupCount(tp,0,LOCATION_REMOVED)
local sect=Duel.GetFieldGroupCount(tp,0x20,0)
if sect >= opct then
Duel.SetLP(1-tp,0)
else
Duel.SetLP(tp,0)
end
end
