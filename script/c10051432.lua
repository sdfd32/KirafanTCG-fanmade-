local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
    local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_SET_ATTACK_FINAL)
	e1:SetValue(Kirafan2.alonevalue)
	c:RegisterEffect(e1)
    local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetCondition(s.con)
	e2:SetOperation(s.atklimit)
	c:RegisterEffect(e2)
    local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10050111,5))
	e5:SetCategory(CATEGORY_COUNTER)
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(Kirafan6.damcon)
	e5:SetCost(Kirafan2.dottecost2)
	e5:SetOperation(s.damop)
	c:RegisterEffect(e5)
	Kirafan6.NoDotteEffcon2(c)
end
function Kirafan2.alonevalue(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetBaseAttack()
end
function s.con(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(Card.IsAbleToRemoveAsCost,tp,0,LOCATION_GRAVE,1,nil)
end
function s.atklimit(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumeenemydotte(e,tp,eg,ep,ev,re,r,rp)
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    local con=Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	c:AddCounter(0xc01,3)
    if con>0 and Duel.GetMatchingGroupCount(nil,tp,LOCATION_GRAVE,0,nil)>0 
	and Duel.SelectYesNo(tp,aux.Stringid(10050111,4)) then
    Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
    c:AddCounter(0xc01,con)
    else end
    Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end