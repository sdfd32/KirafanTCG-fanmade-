local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
    local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
    e1:SetCode(EVENT_DAMAGE_STEP_END)
	e1:SetCondition(s.battlecon)
	e1:SetOperation(s.battleop)
    c:RegisterEffect(e1)
    local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10050111,5))
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(Kirafan6.damcon)
	e5:SetCost(Kirafan2.dottecost3)
	e5:SetTarget(Kirafan6.nodamtg)
	e5:SetOperation(s.damop)
	c:RegisterEffect(e5)
    Kirafan6.NoDotteEffcon2(c)
end
function s.battlecon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp
	and e:GetHandler():GetCounter(0xb08)==0
end
function s.battleop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    local bg=Duel.GetDecktopGroup(tp,2)
	Duel.Overlay(c,bg)
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
    local hp = c:GetDefense()
	local dam=math.floor(hp/3)
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local ag=enemy:GetFirst()
	for ag in aux.Next(enemy) do
	local g=ag:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=ag:GetOverlayGroup():RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end