local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10050111,5))
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(Kirafan6.damcon)
	e5:SetCost(Kirafan2.dottecost2)
	e5:SetTarget(Kirafan6.nodamtg)
	e5:SetOperation(s.damop)
	c:RegisterEffect(e5)
	Kirafan6.NoDotteEffcon2(c)
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	if Duel.GetMatchingGroupCount(nil,tp,LOCATION_GRAVE,0,nil)>0
	and Duel.SelectYesNo(tp,aux.Stringid(10050111,4)) then
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	dam=2
	else
	dam=1 end
	local ag=enemy:GetFirst()
	for ag in aux.Next(enemy) do
	ag:AddCounter(0xd16,dam)
	end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end