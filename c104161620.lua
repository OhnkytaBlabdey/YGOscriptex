--消消乐
function c104161620.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetOperation(c104161620.op)
	c:RegisterEffect(e1)
end
function DeleteGroup(g)
Duel.SendtoDeck(g,0,-1,REASON_RULE)
end
function zonewrite(zt,m,n,val)
if not zt then return end 
if not zt[m] then zt[m]={} end

if not zt[m][n] then zt[m][n] = val return end 
zt[m][n]=val

end
function zoneget(zt,m,n)
if not zt then return end 
if not zt[m] then zt[m]={} end

if not zt[m][n] then zt[m][n] = -1 return end 
return zt[m][n]

end
function zoneclearcards(cards,zt)
--依据cards清除zt里的变为-1
-------------------------------------------

end
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
return c_a
end
function cidtocard(cid)

local g1=Duel.GetFieldGroup(tp,LOCATION_MZONE,LOCATION_MZONE)
local g2=Duel.GetFieldGroup(tp,LOCATION_SZONE,LOCATION_SZONE)
g1:Merge(g2)
local result_c=g1:GetFirst()
for i=1,g1:GetCount() do
if result_c then 
if result_c.cardid ==cid then return result_c end

end


result_c= g1:GetNext()

end


end
function cidtozone(zt,cid)
if not zt then return end 
for ni=1,4 do
	 if zt[ni] then 
	for nj=1,5 do
		if zt[ni][nj] then 
	   if zt[ni][nj]==cid then return ni,nj end--not table
		end
	end
	 end
end


end
function cardtozone(zt,c)
local cid=c.cardid
return cidtozone(zt,cid)


end
function existcard(cards,c)
-------------------------------------------

end
function filtcardid(cs,c)
if not cs or not c then return end
local cid =c.cardid
local result_cs={c}
local j=#result_cs
for i=1,#cs do
j=#result_cs
if cs[i].cardid ==cid then result_cs[j+1] =cs[i]  end

end

return result_cs

end
function getaroundcard(c)
if not c then return end

local result_cs={c}-- 包括 c
local m,n=cardtozone(c)
local i=#result_cs

--left
if n ==1 then 
else 
	if m <= 2
	then
	
	local loc=c:GetLocation()
	local c1=Duel.GetFieldCard(1,loc,n-2)
	result_cs[i+1]=c1
	i=#result_cs
 
	else
	
	local loc=c:GetLocation()
	local c1=Duel.GetFieldCard(0,loc,n-2)
	result_cs[i+1]=c1
	i=#result_cs

	end

end
--right
if n ==5 then 
else 
	if m <= 2 then 
	local loc=c:GetLocation()
	local c1=Duel.GetFieldCard(1,loc,n)
	result_cs[i+1]=c1
	i=#result_cs

	else
	local loc=c:GetLocation()
	local c1=Duel.GetFieldCard(0,loc,n)
	result_cs[i+1]=c1
	i=#result_cs

	end

end
--down
if m ==4 then 
else 
-------------------------------------------

end
--up
if m ==1 then 
else 
-------------------------------------------

end




return result_cs
end
function cardtoaffectedcard(c,k)
local result_cs={}
if k==1 then
local cs_tmp={}
local ar={}
ar=getaroundcard(c)
local ct=#ar
--遍历ar
do
-------------------------------------------


if #ar ==ct then 

	return result_cs
else
ct=#ar
end

end




end
return result_cs


end
function clearzone(c)
local cs=cardtoaffectedcard(c)
--zoneclearcards(cs,zt)
-------------------------------------------




--snedtodeck
local g0=Group.CreateGroup()
for i=1,#result_cs do
g0:AddCard( result_cs[i] )
--debug
end
Duel.SendtoDeck(g0,nil,2,REASON_RULE)



end
function fillzone()

end 


--m,n到pl,loc,seq的添加
--[[
op 
]]
function c104161620.op(e,tp,eg,ep,ev,re,r,rp)
local sc=e:GetHandler()
Duel.SendtoDeck(sc,tp,-1,REASON_RULE)--Delete card 
sc=nil
--init
zt={}
for ni=1,4 do
	zt[ni]={}
	for nj=1,5 do
	zt[ni][nj]=-1
	end
end
print(zt[4][5] )
-------------------------------------------





end