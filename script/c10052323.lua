local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
	local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
    e1:SetCode(EVENT_DAMAGE_STEP_END)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetCountLimit(1)
	e1:SetCondition(s.AttackDottecon)
    e1:SetOperation(s.AttackDotteop)
    c:RegisterEffect(e1)
    local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10050111,5))
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(Kirafan6.damcon)
	e5:SetCost(Kirafan2.dottecost1)
	e5:SetTarget(Kirafan6.damtg)
	e5:SetOperation(s.damop)
	c:RegisterEffect(e5)
    Kirafan6.NoDotteEffcon2(c)
end
function s.AttackDottecon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp
end
function s.AttackDotteop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsSetCard(0xb01) then return end
	Duel.DiscardDeck(tp,1,REASON_EFFECT)
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local dam=1
	if Duel.IsExistingMatchingCard(Kirafan6.loadfactorfilter,tp,LOCATION_MZONE,0,1,c)
	and Duel.SelectYesNo(tp,aux.Stringid(10050111,3)) then
	local ag=Duel.SelectMatchingCard(tp,Kirafan6.loadfactorfilter,tp,LOCATION_MZONE,0,1,1,c)
	Duel.ChangePosition(ag:GetFirst(),POS_FACEUP_DEFENSE)
    if deckcount==1 then
    Duel.DiscardDeck(tp,1,REASON_EFFECT)
    Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
    Duel.DiscardDeck(tp,1,REASON_EFFECT)
    else
    Duel.DiscardDeck(tp,2,REASON_EFFECT) end end
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end