local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
    local e1=Effect.CreateEffect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_ATKCHANGE)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.atkcon)
	e1:SetOperation(s.atkop)
	c:RegisterEffect(e1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCost(s.dottecost2)
	e1:SetTarget(Kirafan6.damtg)
	e1:SetOperation(s.damop)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetCondition(Kirafan6.spcreamatecon)
	c:RegisterEffect(e2)
end
function s.atkcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bc=Duel.GetAttackTarget()
	return bc and bc:IsFaceup() and bc:GetCounter(0xb06)>0
	and e:GetHandler():GetCounter(0xb08)==0
end
function s.atkop(e,tp,eg,ep,ev,re,r,rp)
	if e:GetHandler():IsFaceup() and e:GetHandler():IsRelateToBattle() then
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT|RESETS_STANDARD|RESET_PHASE|PHASE_DAMAGE)
	e1:SetValue(2)
	e:GetHandler():RegisterEffect(e1) end
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local dam=1
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
    if tg:GetCounter(0xb06)==0 then tg:AddCounter(0xb06,1) end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end
function s.dottecost2(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return c:GetCounter(0xb03)==0 and not c:IsDefensePos() and
	Duel.IsExistingMatchingCard(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,2,nil,tp) end
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
    Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
end