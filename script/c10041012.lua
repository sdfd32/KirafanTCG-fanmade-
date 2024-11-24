local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
    local e11=Effect.CreateEffect(c)
	e11:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e11:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e11:SetCode(EVENT_CHAIN_END)
	e11:SetRange(LOCATION_MZONE)
	e11:SetCountLimit(1)
	e11:SetCondition(s.bossdamcon11)
	e11:SetTarget(s.damtg11)
	e11:SetOperation(s.damop11)
	c:RegisterEffect(e11)
    local e10=Effect.CreateEffect(c)
	e10:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e10:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e10:SetCode(EVENT_CHAIN_END)
	e10:SetRange(LOCATION_MZONE)
	e10:SetCountLimit(1)
	e10:SetCondition(s.bossdamcon10)
	e10:SetTarget(s.damtg10)
	e10:SetOperation(s.damop10)
	c:RegisterEffect(e10)
    local e9=Effect.CreateEffect(c)
	e9:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e9:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e9:SetCode(EVENT_CHAIN_END)
	e9:SetRange(LOCATION_MZONE)
	e9:SetCountLimit(1)
	e9:SetCondition(s.bossdamcon9)
	e9:SetTarget(s.damtg9)
	e9:SetOperation(s.damop9)
	c:RegisterEffect(e9)
    local e8=Effect.CreateEffect(c)
	e8:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e8:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e8:SetCode(EVENT_CHAIN_END)
	e8:SetRange(LOCATION_MZONE)
	e8:SetCountLimit(1)
	e8:SetCondition(s.bossdamcon8)
	e8:SetTarget(s.damtg8)
	e8:SetOperation(s.damop8)
	c:RegisterEffect(e8)
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
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6
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
	c:AddCounter(0xd01,1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon2(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
    and ((e:GetHandler():GetDefense()<=35 and (main:IsSetCard(0xd04) or main:IsSetCard(0xd03))) or (e:GetHandler():GetDefense()<=20 and (main:IsSetCard(0xd01) or main:IsSetCard(0xd02))))
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6 and main:GetCounter(0xd08)==0
end
function s.damtg2(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end

    main:RemoveCounter(tp,0xb01,main:GetCounter(0xd04),REASON_EFFECT)
    main:RemoveCounter(tp,0xb01,main:GetCounter(0xd05),REASON_EFFECT)
    main:RemoveCounter(tp,0xb01,main:GetCounter(0xd06),REASON_EFFECT)
    main:RemoveCounter(tp,0xb01,main:GetCounter(0xd07),REASON_EFFECT)

	while true do
	local extraatk=Duel.GetRandomNumber(1,12)
	if c:GetCounter(0xd09)==0 and extraatk<=3 then
    c:AddCounter(0xd09,1)
    main:AddCounter(0xd04,1)
    break
	elseif c:GetCounter(0xd10)==0 and extraatk<=6 then
    c:AddCounter(0xd10,1)
    main:AddCounter(0xd05,1)
    break
    elseif c:GetCounter(0xd11)==0 and extraatk<=9 then
    c:AddCounter(0xd11,1)
    main:AddCounter(0xd06,1)
    break
    elseif c:GetCounter(0xd12)==0 and extraatk<=12 then
    c:AddCounter(0xd12,1)
    main:AddCounter(0xd07,1)
    break
	else end end 

	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,2))
end
function s.damop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	c:AddCounter(0xd01,1)
    if main:IsSetCard(0xd04) or main:IsSetCard(0xd03) then
	local bhp=25
    else
    local bhp=15 end
	local bg=Duel.GetDecktopGroup(tp,bhp)
	Duel.Overlay(c,bg)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon3(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
    and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6
    and main:GetCounter(0xd04)==1
end
function s.damtg3(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,3))
end
function s.damop3(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
    Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
    local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(2)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END,3)
	c:RegisterEffect(e1)
    c:AddCounter(0xd01,1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon4(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
    and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6
    and main:GetCounter(0xd05)==1
end
function s.damtg4(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)

    local extraatk=Duel.GetRandomNumber(1,10)
    if (main:IsSetCard(0xd04) and extraatk>=7) or (main:IsSetCard(0xd03) and extraatk>=8) then
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
	c:AddCounter(0xd01,1)
    Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon6(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
    and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6
    and main:GetCounter(0xd06)==1
end
function s.damtg6(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,5))
end
function s.damop6(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
    Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
    Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
	local ag=enemy:GetFirst()
	for ag in aux.Next(enemy) do
	if ag:GetCounter(0xb06)==0 then ag:AddCounter(0xb06,2)
	elseif ag:GetCounter(0xb06)==1 then ag:AddCounter(0xb06,1)
	else end end
    c:AddCounter(0xd01,1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon7(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
    and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6
    and main:GetCounter(0xd07)==1
end
function s.damtg7(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)

    local extraatk=Duel.GetRandomNumber(1,10)
    if (main:IsSetCard(0xd04) and extraatk>=7) or (main:IsSetCard(0xd03) and extraatk>=8) then
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
function s.damop7(e,tp,eg,ep,ev,re,r,rp)
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
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
    c:AddCounter(0xd01,1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon8(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
    and ((e:GetHandler():GetDefense()<=35 and (main:IsSetCard(0xd04) or main:IsSetCard(0xd03))) or (e:GetHandler():GetDefense()<=20 and (main:IsSetCard(0xd01) or main:IsSetCard(0xd02))))
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6
    and main:GetCounter(0xd04)==0 and main:GetCounter(0xd05)==0
    and main:GetCounter(0xd06)==0 and main:GetCounter(0xd07)==0
    and e:GetHandler():GetCounter(0xd09)==1 and e:GetHandler():GetCounter(0xd10)==1
    and e:GetHandler():GetCounter(0xd11)==1 and e:GetHandler():GetCounter(0xd12)==1
end
function s.damtg8(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
    main:AddCounter(0xd08,1)
    c:AddCounter(0xd13,1)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,7))
end
function s.damop8(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
    local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_SINGLE)
    e1:SetCode(EFFECT_UPDATE_ATTACK)
    e1:SetValue(1)
    c:RegisterEffect(e1)
	c:AddCounter(0xd01,1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon9(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
    local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>3
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6 and main:GetCounter(0xd08)==1
end
function s.damtg9(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
    local sg=enemy:RandomSelect(tp,1)
	Duel.SetTargetCard(sg)
	
	local extraatk=Duel.GetRandomNumber(1,10)
    if (main:IsSetCard(0xd04) and extraatk>=8) or (main:IsSetCard(0xd03) and extraatk==10) then
    local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(3)
	c:RegisterEffect(e1)
    elseif (main:IsSetCard(0xd04) and extraatk>=5) or (main:IsSetCard(0xd03) and extraatk>=7) 
    or (main:IsSetCard(0xd02) and extraatk>=8) then
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
	
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,8))
end
function s.damop9(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	Kirafan6.consumedotte(e,tp,eg,ep,ev,re,r,rp)
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
    if tg:GetCounter(0xb04)==0 then tg:AddCounter(0xb04,3)
	elseif tg:GetCounter(0xb04)==1 then tg:AddCounter(0xb04,2)
	elseif tg:GetCounter(0xb04)==2 then tg:AddCounter(0xb04,1)
	else end
	c:AddCounter(0xd01,1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon10(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>1
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,1-tp,0,LOCATION_MZONE,nil)==1
	and Duel.GetMatchingGroupCount(Card.IsAbleToRemoveAsCost,tp,LOCATION_GRAVE,0,nil)>2
	and #ally<2 and e:GetHandler():GetCounter(0xd01)<6
end
function s.damtg10(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)

    local extraatk=Duel.GetRandomNumber(1,10)
	if (main:IsSetCard(0xd04) and extraatk>=6) or (main:IsSetCard(0xd03) and extraatk>=8) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CHAIN)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	else end	

	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,9))
end
function s.damop10(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
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
	c:AddCounter(0xd01,1)
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end

function s.bossdamcon11(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(s.bossdamfilter,tp,LOCATION_MZONE,0,nil)
	return Duel.IsBattlePhase() and Duel.GetTurnPlayer()==tp and Duel.GetCurrentChain()==0
	and Duel.GetMatchingGroupCount(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)>0
	and #ally<2 and e:GetHandler():GetCounter(0xd01)>5
end
function s.damtg11(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local main=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) end
	if chk==0 then return Duel.IsExistingTarget(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetChainLimit(Kirafan8.mychainlimit)
	
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
	
	Duel.Hint(HINT_MESSAGE,1-tp,aux.Stringid(id,10))
end
function s.damop11(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local enemy=Duel.GetMatchingGroup(Kirafan6.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil)
	c:RemoveCounter(tp,0xd01,c:GetCounter(0xd01),REASON_EFFECT)
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
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end