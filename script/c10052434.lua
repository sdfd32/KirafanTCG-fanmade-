local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacternodotte(c)
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
	e5:SetCost(Kirafan2.dottecost2)
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
	Kirafan6.consumeenemydotte(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,0,LOCATION_GRAVE)>0 then
	Kirafan6.consumeenemydotte(e,tp,eg,ep,ev,re,r,rp) end
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local dam=2
    local dotte=Duel.GetFieldGroupCount(tp,0,LOCATION_GRAVE)
    if dotte<=4 and Duel.GetMatchingGroupCount(nil,tp,LOCATION_GRAVE,0,nil)>0 
	and Duel.SelectYesNo(tp,aux.Stringid(10050111,4)) then
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
    dam=4
    Duel.Damage(1-tp,dam,REASON_EFFECT)
    else
    dam=2
	Duel.Damage(1-tp,dam,REASON_EFFECT) end
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end