local s,id=GetID()
function s.initial_effect(c)
	Kirafan5.KnCreamateCharacter(c)
	Kirafan5.Aggroknight(c)
    Kirafan5.SkillAggroknight(c)
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10050111,5))
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(s.damcon)
	e5:SetCost(Kirafan2.dottecost2)
	e5:SetTarget(Kirafan6.nospdamtg)
	e5:SetOperation(s.damop)
	c:RegisterEffect(e5)
	Kirafan6.NoDotteEffcon2(c)
end
function s.damcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetCurrentPhase()==PHASE_BATTLE_STEP and e:GetHandler():GetCounter(0xb03)==0
	and e:GetHandler():GetCounter(0xc01)>0
	and not e:GetHandler():IsDefensePos() and Duel.GetCurrentChain()==0
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and Duel.GetTurnPlayer()==tp
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    c:RemoveCounter(tp,0xc01,1,REASON_EFFECT)
	if c:GetCounter(0xc06)==0 then c:AddCounter(0xc06,3)
	elseif c:GetCounter(0xc06)==1 then c:AddCounter(0xc06,2)
	elseif c:GetCounter(0xc06)==2 then c:AddCounter(0xc06,1)
	else end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end