local s,id=GetID()
function s.initial_effect(c)
	Kirafan5.KnCreamateCharacter(c)
	Kirafan5.Aggroknight(c)
	Kirafan5.KnightDotte2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_REMOVE)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetCondition(s.kncon)
	e1:SetOperation(s.knop)
	c:RegisterEffect(e1)
end
function s.knconfilter(c,tp)
	return c:IsPreviousControler(tp) and c:IsPreviousLocation(LOCATION_OVERLAY)
end
function s.kncon(e,tp,eg,ep,ev,re,r,rp)
	return eg:IsExists(s.knconfilter,1,nil,tp) and Duel.GetTurnPlayer()~=tp
end
function s.knop(e,tp,eg,ep,ev,re,r,rp)
    local hand=Duel.GetFieldGroupCount(tp,0,LOCATION_HAND)
	if hand>0 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10050111,9))
	local g=Duel.SelectMatchingCard(1-tp,nil,1-tp,LOCATION_HAND,0,1,1,nil)
	local tg=g:GetFirst()
	Duel.Remove(tg,POS_FACEUP,REASON_EFFECT)
	else end
end