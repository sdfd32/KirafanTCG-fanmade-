local s,id=GetID()
function s.initial_effect(c)
	Kirafan4.HPDotteTrigger(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Kirafan6.spcreamatecon)
	e1:SetCost(s.cost)
	e1:SetTarget(Kirafan3.spdamtg)
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
	local tc=Duel.GetFirstTarget()
	tc:RemoveCounter(tp,0xb01,tc:GetCounter(0xb01),REASON_EFFECT)
	tc:RemoveCounter(tp,0xb02,tc:GetCounter(0xb02),REASON_EFFECT)
	tc:RemoveCounter(tp,0xb03,tc:GetCounter(0xb03),REASON_EFFECT)
	tc:RemoveCounter(tp,0xb04,tc:GetCounter(0xb04),REASON_EFFECT)
	tc:RemoveCounter(tp,0xb05,tc:GetCounter(0xb05),REASON_EFFECT)
	tc:RemoveCounter(tp,0xb06,tc:GetCounter(0xb06),REASON_EFFECT)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_PHASE+PHASE_BATTLE)
	e2:SetRange(LOCATION_SZONE)
	e2:SetCountLimit(1)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetReset(RESET_EVENT+RESETS_STANDARD)
	e2:SetOperation(s.alicetrigger)
	c:RegisterEffect(e2)
end
function s.alicetrigger(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Draw(tp,1,REASON_EFFECT)
	Duel.SendtoDeck(c,nil,-2,REASON_RULE)
	Duel.Hint(HINT_MESSAGE,tp,aux.Stringid(id,1))
	local alice=Duel.CreateToken(tp,10055112)
	Duel.MoveToField(alice,tp,tp,LOCATION_SZONE,POS_FACEUP,true)
end