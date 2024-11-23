local s,id=GetID()
function s.initial_effect(c)
	Kirafan3.SpCreamateAllHeal(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10050113,4))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
    e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Kirafan6.spcreamatecon)
	e1:SetCost(s.dottecost1)
	e1:SetTarget(Kirafan6.spdamtg)
	e1:SetOperation(s.dotteop)
	c:RegisterEffect(e1)
	Kirafan3.SpCreamateCharacter(c)
end
function s.dotteop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_CHANGE_LEVEL)
    e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetValue(1)
    e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	tc:RegisterEffect(e1)
    local e2=e1:Clone()
    e2:SetCode(EFFECT_UPDATE_ATTACK)
    e1:SetValue(1)
    tc:RegisterEffect(e2)
end

function s.dottecost1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_SZONE)>0
	and Duel.IsExistingMatchingCard(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,1,nil,tp) 
    and Duel.GetTurnPlayer()==tp end
	Duel.MoveToField(e:GetHandler(),tp,tp,LOCATION_SZONE,POS_FACEUP,true)
	Kirafan6.dottehint(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
end