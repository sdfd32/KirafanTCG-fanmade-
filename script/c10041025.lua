local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
	local e7=Effect.CreateEffect(c)
	e7:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e7:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e7:SetCode(EVENT_CHAIN_END)
	e7:SetRange(LOCATION_MZONE)
	e7:SetCountLimit(1)
	e7:SetCondition(s.bossdamcon7)
	e7:SetTarget(s.damtg7)
	e7:SetOperation(s.damop7)
	c:RegisterEffect(e7)
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e6:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e6:SetCode(EVENT_CHAIN_END)
	e6:SetRange(LOCATION_MZONE)
	e6:SetCountLimit(1)
	e6:SetCondition(s.bossdamcon6)
	e6:SetTarget(s.damtg6)
	e6:SetOperation(s.damop6)
	c:RegisterEffect(e6)
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e5:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e5:SetCode(EVENT_CHAIN_END)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCountLimit(1)
	e5:SetCondition(s.bossdamcon5)
	e5:SetTarget(s.damtg5)
	e5:SetOperation(s.damop5)
	c:RegisterEffect(e5)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e4:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e4:SetCode(EVENT_CHAIN_END)
	e4:SetRange(LOCATION_MZONE)
	e4:SetCountLimit(1)
	e4:SetCondition(s.bossdamcon4)
	e4:SetTarget(s.damtg4)
	e4:SetOperation(s.damop4)
	c:RegisterEffect(e4)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e3:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e3:SetCode(EVENT_CHAIN_END)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCountLimit(1)
	e3:SetCondition(s.bossdamcon3)
	e3:SetTarget(s.damtg3)
	e3:SetOperation(s.damop3)
	c:RegisterEffect(e3)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e2:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e2:SetCode(EVENT_CHAIN_END)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1)
	e2:SetCondition(s.bossdamcon2)
	e2:SetTarget(s.damtg2)
	e2:SetOperation(s.damop2)
	c:RegisterEffect(e2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCode(EVENT_CHAIN_END)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.bossdamcon1)
	e1:SetTarget(s.damtg1)
	e1:SetOperation(s.damop1)
	c:RegisterEffect(e1)
end
function s.bossdamfilter(c)
	return c:IsAttackPos() and not c:IsLocation(LOCATION_EMZONE)
end
function s.bossdamcon1(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>1 
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<5
end
function s.damtg1(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	local knight=Duel.GetMatchingGroup(Kirafan8.knightfilter,tp,0,LOCATION_MZONE,nil)
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	if #knight>0 then
	local sg=knight:GetFirst()
	Duel.SetTargetCard(sg)
	else
	local sg2=enemy:RandomSelect(tp,1)
	Duel.SetTargetCard(sg2) end
	
	local extraatk=Duel.GetRandomNumber(1,10)
	if (main:IsSetCard(0xd04) and extraatk>=6) or (main:IsSetCard(0xd03) and extraatk>=8) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	else end
	
	Duel.SetChainLimit(Kirafan8.mychainlimit)
end
function s.damop1(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	local attack=c:GetAttack()
	local dam=attack
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
	if c:GetCounter(0xd21)==0 then c:AddCounter(0xd01,1) end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon2(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<5 and e:GetHandler():GetCounter(0xb08)==0
end
function s.damtg2(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	local sg2=enemy:RandomSelect(tp,1)
	Duel.SetTargetCard(sg2)
	
	local extraatk=Duel.GetRandomNumber(1,10)
	if (main:IsSetCard(0xd04) and extraatk>=6) or (main:IsSetCard(0xd03) and extraatk>=9) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(2)
	c:RegisterEffect(e1)
	elseif (main:IsSetCard(0xd04) and extraatk<=5) or (main:IsSetCard(0xd03) and extraatk<=6)
	or (main:IsSetCard(0xd02) and extraatk<=5) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	else end	
	
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,2))
end
function s.damop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	local attack=c:GetAttack()
	local dam=attack
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
	if tg:GetCounter(0xb08)==0 then tg:AddCounter(0xb08,2)
	elseif tg:GetCounter(0xb08)==1 then tg:AddCounter(0xb08,1) end
	if c:GetCounter(0xd21)==0 then c:AddCounter(0xd01,1) end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon3(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<5 and e:GetHandler():GetCounter(0xb08)==0
end
function s.damtg3(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	local sg2=enemy:RandomSelect(tp,1)
	Duel.SetTargetCard(sg2)
	
	local extraatk=Duel.GetRandomNumber(1,10)
	if (main:IsSetCard(0xd04) and extraatk>=6) or (main:IsSetCard(0xd03) and extraatk>=9) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(2)
	c:RegisterEffect(e1)
	elseif (main:IsSetCard(0xd04) and extraatk<=5) or (main:IsSetCard(0xd03) and extraatk<=6)
	or (main:IsSetCard(0xd02) and extraatk<=5) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	else end	
	
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,3))
end
function s.damop3(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	local attack=c:GetAttack()
	local dam=attack
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
	if tg:GetCounter(0xb06)==0 then tg:AddCounter(0xb06,2)
	elseif tg:GetCounter(0xb06)==1 then tg:AddCounter(0xb06,1) end
	if c:GetCounter(0xd21)==0 then c:AddCounter(0xd01,1) end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon4(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>1
	and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>4
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<5 and e:GetHandler():GetCounter(0xb08)==0
end
function s.damtg4(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	
	local extraatk=Duel.GetRandomNumber(1,10)
    if (main:IsSetCard(0xd04) and extraatk>=7) or (main:IsSetCard(0xd03) and extraatk>=9) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(3)
	c:RegisterEffect(e1)
	elseif (main:IsSetCard(0xd04) and extraatk>=5) or (main:IsSetCard(0xd03) and extraatk>=6)
	or (main:IsSetCard(0xd02) and extraatk>=7) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(2)
	c:RegisterEffect(e1)
	elseif (main:IsSetCard(0xd04) and extraatk<=3) or (main:IsSetCard(0xd03) and extraatk<=4)
	or (main:IsSetCard(0xd02) and extraatk<=5) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	else end

	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,4))
end
function s.damop4(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	local attack=c:GetAttack()
	local dam=attack
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local ag=enemy:GetFirst()
	for ag in aux.Next(enemy) do
	local g=ag:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=ag:GetOverlayGroup():RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end end
	c:AddCounter(0xb08,3)
	if c:GetCounter(0xd21)==0 then c:AddCounter(0xd01,1) end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon5(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xb08)>0 and e:GetHandler():GetCounter(0xd01)>3
end
function s.damtg5(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,5))
end
function s.damop5(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	c:RemoveCounter(tp,0xb08,c:GetCounter(0xb08),REASON_EFFECT)	
	local ag=enemy:GetFirst()
	for ag in aux.Next(enemy) do
	if ag:GetCounter(0xb01)==0 then ag:AddCounter(0xb01,2)
	elseif ag:GetCounter(0xb01)==1 then ag:AddCounter(0xb01,1)
	else end end
	if c:GetCounter(0xd21)==0 then c:AddCounter(0xd01,1) end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon6(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and #ally<2 and e:GetHandler():GetCounter(0xd01)>4 and e:GetHandler():GetCounter(0xb08)==0
end
function s.damtg6(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	local sg=enemy:RandomSelect(tp,1)
	Duel.SetTargetCard(sg)
	
	local extraatk=Duel.GetRandomNumber(1,10)
    if (main:IsSetCard(0xd04) and extraatk>=7) or (main:IsSetCard(0xd03) and extraatk>=9) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(3)
	c:RegisterEffect(e1)
	elseif (main:IsSetCard(0xd04) and extraatk>=5) or (main:IsSetCard(0xd03) and extraatk>=6)
	or (main:IsSetCard(0xd02) and extraatk>=7) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(2)
	c:RegisterEffect(e1)
	elseif (main:IsSetCard(0xd04) and extraatk<=3) or (main:IsSetCard(0xd03) and extraatk<=4)
	or (main:IsSetCard(0xd02) and extraatk<=5) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	else end
	
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,6))
end
function s.damop6(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	c:RemoveCounter(tp,0xd01,c:GetCounter(0xd01),REASON_EFFECT)
	c:AddCounter(0xd21,1)
	local attack=c:GetAttack()
	local dam=attack
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(2)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END,3)
	c:RegisterEffect(e1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon7(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and ((e:GetHandler():GetDefense()<=20 and (main:IsSetCard(0xd04) or main:IsSetCard(0xd03))) or (e:GetHandler():GetDefense()<=10 and (main:IsSetCard(0xd01) or main:IsSetCard(0xd02))))
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<5 and e:GetHandler():GetCounter(0xc06)<2 and e:GetHandler():GetCounter(0xb08)==0 and e:GetHandler():GetCounter(0xd15)==0
end
function s.damtg7(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,7))
end
function s.damop7(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local deckcount=Duel.GetMatchingGroupCount(nil,tp,LOCATION_DECK,0,nil)
	local refill=Duel.GetMatchingGroup(nil,tp,LOCATION_REMOVED,0,nil)
    if main:IsSetCard(0xd04) or main:IsSetCard(0xd03) then
	extrabosshp3=10
    else
    extrabosshp3=5 end
	if deckcount<extrabosshp3 then
	local bg1=Duel.GetDecktopGroup(tp,deckcount)
	Duel.Overlay(c,bg1)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	local bg2=Duel.GetDecktopGroup(tp,extrabosshp3-deckcount)
	Duel.Overlay(c,bg2)
	else
	local bg=Duel.GetDecktopGroup(tp,extrabosshp3)
	Duel.Overlay(c,bg) end
	if deckcount==1 then
	Duel.DiscardDeck(tp,1,REASON_EFFECT)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.DiscardDeck(tp,4,REASON_EFFECT)
	elseif deckcount==2 then
	Duel.DiscardDeck(tp,2,REASON_EFFECT)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.DiscardDeck(tp,3,REASON_EFFECT)
	elseif deckcount==3 then
	Duel.DiscardDeck(tp,3,REASON_EFFECT)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.DiscardDeck(tp,2,REASON_EFFECT)
	elseif deckcount==4 then
	Duel.DiscardDeck(tp,4,REASON_EFFECT)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.DiscardDeck(tp,1,REASON_EFFECT)
	else
	Duel.DiscardDeck(tp,5,REASON_EFFECT) end
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(1)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	c:RegisterEffect(e1)
	c:AddCounter(0xd15,1)
    if c:GetCounter(0xd21)==0 then c:AddCounter(0xd01,1) end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end