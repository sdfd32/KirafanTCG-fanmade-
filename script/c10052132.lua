local s,id=GetID()
function s.initial_effect(c)
	Kirafan2.CreamateCharacter(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetRange(LOCATION_REMOVED+LOCATION_GRAVE)
	e1:SetCode(EVENT_ADJUST)
	e1:SetOperation(Kirafan4.Alcheop)
	c:RegisterEffect(e1)
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_IGNITION)
	e5:SetRange(LOCATION_MZONE)
	e5:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e5:SetCost(Kirafan2.dottecost2)
	e5:SetOperation(s.op)
	c:RegisterEffect(e5)
    local e6=e5:Clone()
	e6:SetType(EFFECT_TYPE_QUICK_O)
	e6:SetCode(EVENT_FREE_CHAIN)
	e6:SetCondition(Kirafan6.spcreamatecon)
	c:RegisterEffect(e6)
end
function Kirafan4.Alcheop(e,tp,eg,ep,ev,re,r,rp,chk)
	Duel.SendtoDeck(e:GetHandler(),nil,-2,REASON_RULE)
end
function s.op(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tg=c:GetOverlayGroup()
	local dotte=Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)
	Duel.Remove(tg,POS_FACEUP,REASON_RULE)
	Duel.Remove(c,POS_FACEUP,REASON_RULE)
	local nadeshiko=Duel.CreateToken(tp,10062132)
	Duel.SpecialSummon(nadeshiko,0,tp,tp,false,false,POS_FACEUP_ATTACK)
end