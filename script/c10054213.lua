local s,id=GetID()
function s.initial_effect(c)
	Kirafan3.SpCreamateSgHeal(c)
    local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Kirafan6.spcreamatecon)
	e1:SetCost(s.cost1)
	e1:SetTarget(Kirafan6.nospcondamtg)
	e1:SetOperation(s.op1)
	c:RegisterEffect(e1)
    Kirafan3.SpCreamateCharacter(c)
end
function s.cost1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_SZONE)>0 end
	Duel.MoveToField(e:GetHandler(),tp,tp,LOCATION_SZONE,POS_FACEUP,true)
	Kirafan6.summonhint(e,tp,eg,ep,ev,re,r,rp)
end
function s.op1(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local hand=Duel.GetFieldGroupCount(tp,0,LOCATION_HAND)
	if hand>0 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10050111,9))
	local g=Duel.SelectMatchingCard(1-tp,nil,1-tp,LOCATION_HAND,0,1,1,nil)
	local tg=g:GetFirst()
	Duel.Remove(tg,POS_FACEUP,REASON_EFFECT)
	else end
	Kirafan6.drawtrigger(c)
end