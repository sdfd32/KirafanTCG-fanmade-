local s,id=GetID()
function s.initial_effect(c)
	Kirafan3.SpCreamateSgHeal(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Kirafan6.spcreamatecon)
	e1:SetCost(s.cost)
	e1:SetTarget(Kirafan6.nospcondamtg)
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
	local hand=Duel.GetMatchingGroup(nil,1-tp,0,LOCATION_HAND,nil)
	local handcnt=Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)
	local refill=Duel.GetMatchingGroup(nil,tp,LOCATION_REMOVED,0,nil)
	local deckcount=Duel.GetMatchingGroupCount(nil,tp,LOCATION_DECK,0,nil)
	local ag=hand:GetFirst()
	for ag in aux.Next(hand) do
	Duel.Remove(ag,POS_FACEUP,REASON_EFFECT) end
	if deckcount<handcnt then
	Duel.Draw(tp,deckcount,REASON_RULE)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.Draw(tp,handcnt-deckcount,REASON_RULE)
	else
	Duel.Draw(tp,handcnt,REASON_RULE) end
	Kirafan6.drawtrigger(c)
end