local s,id=GetID()
function s.initial_effect(c)
	Kirafan5.KnCreamateCharacter(c)
	Kirafan5.Aggroknight(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_REMOVE)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.kncon)
	e1:SetOperation(s.knop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_REMOVE)
	e2:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCondition(s.kncon2)
	e2:SetOperation(s.knop2)
	c:RegisterEffect(e2)
end
function s.knconfilter(c,tp)
	return c:IsPreviousControler(tp) and c:IsPreviousLocation(LOCATION_OVERLAY)
end
function s.kncon(e,tp,eg,ep,ev,re,r,rp)
	return eg:IsExists(s.knconfilter,1,nil,tp) and Duel.GetTurnPlayer()~=tp and e:GetHandler():GetCounter(0xb08)==0
end
function s.knop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    c:AddCounter(0xc07,1)
end
function s.kncon2(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetDefense()==0 and Duel.GetTurnPlayer()~=tp and e:GetHandler():GetCounter(0xb08)==0 and e:GetHandler():GetCounter(0xd15)==0
end
function s.knop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local deckcount=Duel.GetMatchingGroupCount(nil,tp,LOCATION_DECK,0,nil)
	local refill=Duel.GetMatchingGroup(nil,tp,LOCATION_REMOVED,0,nil)
	heal=math.floor((c:GetBaseDefense()-c:GetCounter(0xd16)-c:GetCounter(0xd17)*2+c:GetCounter(0xc07)+c:GetCounter(0xc08)*2)/2)
	local bg=Duel.GetDecktopGroup(tp,heal)
	if deckcount<heal then
	local bg1=Duel.GetDecktopGroup(tp,deckcount)
	Duel.Overlay(c,bg1)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	local bg2=Duel.GetDecktopGroup(tp,heal-deckcount)
	Duel.Overlay(c,bg2)
	else
	local bg=Duel.GetDecktopGroup(tp,heal)
	Duel.Overlay(c,bg) end
	c:AddCounter(0xd15,1)
end