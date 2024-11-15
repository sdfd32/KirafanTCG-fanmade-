local s,id=GetID()
function s.initial_effect(c)
	c:SetUniqueOnField(1,0,id)
	Kirafan2.CreamateCharacter(c)
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10050111,5))
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(s.damcon)
	e5:SetCost(Kirafan2.dottecost3)
	e5:SetOperation(s.damop)
	c:RegisterEffect(e5)
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    local tama=c:GetAttack()-c:GetBaseAttack()
	if tama>0 then
    c:AddCounter(0xc01,tama)
	c:AddCounter(0xb06,1)
	else end
    Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end
function s.damcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetCurrentPhase()==PHASE_BATTLE_STEP and e:GetHandler():GetCounter(0xb03)==0
	and e:GetHandler():GetCounter(0xc01)>0
	and e:GetHandler():GetAttack()>e:GetHandler():GetBaseAttack()
	and not e:GetHandler():IsDefensePos() and Duel.GetCurrentChain()==0
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and Duel.GetTurnPlayer()==tp
end