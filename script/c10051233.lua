local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_LEAVE_FIELD)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetCondition(s.spcon)
	e1:SetOperation(s.spop)
	c:RegisterEffect(e1)
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10050111,5))
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(Kirafan6.damcon)
	e5:SetCost(s.cost)
	e5:SetTarget(Kirafan6.damtg)
	e5:SetOperation(s.damop)
	c:RegisterEffect(e5)
	Kirafan6.NoDottecardEffcon1(c)
end
function s.spcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp and e:GetHandler():GetCounter(0xb08)==0
end
function s.spop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Draw(tp,1,REASON_EFFECT)
end
function s.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
    local hand=Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)
	if chk==0 then return hand>0 end
	Duel.ChangePosition(c,POS_FACEUP_DEFENSE)
    Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10050111,9))
    local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
    local tg=g:GetFirst()
    Duel.Remove(tg,POS_FACEUP,REASON_EFFECT)
end
function s.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=Duel.GetFirstTarget()
	local dam=2
    local hand=Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)
	if hand==0 then
	elseif hand>0 and Duel.SelectYesNo(tp,aux.Stringid(10050111,10)) then
    Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10050111,9))
    local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
    local tg=g:GetFirst()
    Duel.Remove(tg,POS_FACEUP,REASON_EFFECT)
	dam=4
	if hand>0 and Duel.SelectYesNo(tp,aux.Stringid(10050111,10)) then
    Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10050111,9))
    local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
    local tg=g:GetFirst()
    Duel.Remove(tg,POS_FACEUP,REASON_EFFECT)
	dam=7 end end
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local g=tg:GetOverlayGroup()
	if #g<=dam then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
	tc=g:RandomSelect(1-tp,dam)
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
	Kirafan6.hungerop(e,tp,eg,ep,ev,re,r,rp)
end