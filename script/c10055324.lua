local s,id=GetID()
function s.initial_effect(c)
	Kirafan4.DOTTEDotteTrigger(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Kirafan6.spcreamatecon)
	e1:SetCost(s.cost)
	e1:SetTarget(Kirafan6.spdamtg)
	e1:SetOperation(s.op)
	c:RegisterEffect(e1)
	Kirafan3.SpCreamateCharacter(c)
end
function s.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_SZONE)>0 end
	Duel.MoveToField(e:GetHandler(),tp,tp,LOCATION_SZONE,POS_FACEUP,true)
	Kirafan6.summonhint(e,tp,eg,ep,ev,re,r,rp)
end
function s.op(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:GetCounter(0xc05)==0 then tc:AddCounter(0xc05,1) else end
end