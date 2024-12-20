local s,id=GetID()
function s.initial_effect(c)
    Kirafan.MainCharacter(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10050110,0))
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_EMZONE)
	e1:SetOperation(s.handop2)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10050110,1))
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_EMZONE)
	e2:SetOperation(s.handop3)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(10050110,2))
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_EMZONE)
	e3:SetOperation(s.handop4)
	c:RegisterEffect(e3)
end
function s.handop2(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
	local tc=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_DECK,0,0,#g,nil)
	Duel.SendtoHand(tc,nil,REASON_EFFECT)
end
function s.handop3(e,tp,eg,ep,ev,re,r,rp)
	local ac=Duel.AnnounceNumber(tp,1,2,3,4,5,6)
	local bg=Duel.GetDecktopGroup(tp,ac)
	Duel.SendtoGrave(bg,REASON_RULE)
end
function s.handop4(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
	local tc=Duel.SelectMatchingCard(tp,nil,1-tp,0,LOCATION_DECK,0,#g,nil)
	if Duel.SelectYesNo(tp,aux.Stringid(10050110,3)) then
	Duel.SendtoExtraP(tc,tp,REASON_EFFECT)
	else
	Duel.SendtoExtraP(tc,1-tp,REASON_EFFECT) end
end