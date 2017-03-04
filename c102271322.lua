--演示
function c102271322.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetOperation(c102271322.op)
	c:RegisterEffect(e1)
end
function DeleteGroup(g)
Duel.SendtoDeck(g,0,-1,REASON_RULE)
end
function c102271322.op(e,tp,eg,ep,ev,re,r,rp)
local sc=e:GetHandler()
Duel.SendtoDeck(sc,tp,-1,REASON_RULE)--Delete card 
sc=nil
local hg1 =AddCard(tp,23571046,LOCATION_GRAVE,0,nil)
local hg2=AddCard(tp,23571046,LOCATION_GRAVE,0,nil)
local dj=AddCard(tp,33420078,LOCATION_GRAVE,0,nil)
local gt2r1=AddCard(tp,32224143,LOCATION_EXTRA,0,nil)
local gt2r2=AddCard(tp,32224143,LOCATION_EXTRA,0,nil)
local gt4r1=AddCard(tp,53334641,LOCATION_EXTRA,0,nil)
local gtt=AddCard(tp,85827713,LOCATION_HAND,0,nil)
local gtm=AddCard(tp,99795159,LOCATION_HAND,0,nil)
local ty=AddCard(tp,67169062,LOCATION_GRAVE,0,nil)
--act dj 
local te=dj:GetActivateEffect()
local tg=te:GetTarget()
if tg(te,tp,eg,ep,ev,re,r,rp,0) then
-- Debug.ShowHint("okay dj")
dj:CreateEffectRelation(te)
local co=te:GetCost()
 g1=Group.FromCards(gtt)
local obg={g1}
if co then co(te,tp,eg,ep,ev,re,r,rp,1,obg,nil) end
obg=nil
g1=nil

local op=te:GetOperation()
if op then op(te,tp,eg,ep,ev,re,r,rp,nil,{POS_FACEUP_ATTACK}) end

dj:ReleaseEffectRelation(te)
te=nil
tg=nil
op=nil
end
--act hg1
local te=hg1:GetActivateEffect()
local con=te:GetCondition()
if con(te,tp,eg,ep,ev,re,r,rp) then
 --Debug.ShowHint("con")
local tg=te:GetTarget()
if tg(te,tp,eg,ep,ev,re,r,rp,0) then
--why?
 --Debug.ShowHint("tg")
hg1:CreateEffectRelation(te)
local op=te:GetOperation()
if op then op(te,tp,eg,ep,ev,re,r,rp,nil,{POS_FACEUP_ATTACK}) end
hg1:ReleaseEffectRelation(te)

end
end

--act hg2
hgsp(e,tp,eg,ep,ev,re,r,rp,hg2,POS_FACEUP_ATTACK)

--test
 local g0=Group.FromCards(hg1,hg2)
 XyzSummon(tp,gt2r1,g0,nil,POS_FACEUP_DEFENCE)
end
--

function hgsp(e,tp,eg,ep,ev,re,r,rp,hg,hgpos)
--act hg
local te=hg:GetActivateEffect()
local con=te:GetCondition()
if con(te,tp,eg,ep,ev,re,r,rp) then
-- Debug.ShowHint("con")
local tg=te:GetTarget()
if tg(te,tp,eg,ep,ev,re,r,rp,0) then
--why?
-- Debug.ShowHint("tg")
hg:CreateEffectRelation(te)
local op=te:GetOperation()
if op then op(te,tp,eg,ep,ev,re,r,rp,nil,{hgpos}) end
hg:ReleaseEffectRelation(te)

end
end


end
function XyzSummon(tp,mxyz,mg,og,pos)
if mxyz and mg and pos then
if og and og:GetCount()~=0 then
	Duel.Overlay(mxyz,og)
end
	mxyz:SetMaterial(mg)
	Duel.Overlay(mxyz,mg)
	Duel.SpecialSummon(mxyz,SUMMON_TYPE_XYZ,tp,tp,false,false,pos)
	mxyz:CompleteProcedure()
else
Debug.ShowHint("error,no para ")
end
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