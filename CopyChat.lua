-- Copy chat text: WoW chat frames can't be selected, so this shows a chat window's history in an edit box
-- where it can be selected and copied with Ctrl+C. Open it with the button in the top-right corner of a chat
-- window, or /copychat [window number].

local frame

local function StripFormatting(text)
    text = text:gsub("|T.-|t", "")                  -- textures (raid icons, guide icons)
    text = text:gsub("|A.-|a", "")                  -- atlas textures
    text = text:gsub("|K.-|k", "")                  -- protected Battle.net names
    text = text:gsub("|H.-|h(.-)|h", "%1")          -- hyperlinks keep their visible text
    text = text:gsub("|c%x%x%x%x%x%x%x%x", "")      -- colours
    text = text:gsub("|r", "")
    return text
end

local function GetChatText(chatFrame)
    local lines = {}
    for i = 1, chatFrame:GetNumMessages() do
        local text = chatFrame:GetMessageInfo(i)
        if text then
            lines[#lines + 1] = StripFormatting(text)
        end
    end
    return table.concat(lines, "\n")
end

local function CreateCopyFrame()
    local f = CreateFrame("Frame", "RXPGuidesDungeonsCopyChatFrame", UIParent, "BasicFrameTemplateWithInset")
    f:SetSize(600, 400)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:Hide()
    tinsert(UISpecialFrames, f:GetName()) -- close with Escape

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    f.title:SetPoint("TOP", 0, -5)
    f.title:SetText("Copy Chat - Ctrl+C to copy")

    local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 12, -32)
    scroll:SetPoint("BOTTOMRIGHT", -32, 12)

    local editBox = CreateFrame("EditBox", nil, scroll)
    editBox:SetMultiLine(true)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject(ChatFontNormal)
    editBox:SetWidth(scroll:GetWidth())
    editBox:SetScript("OnEscapePressed", function() f:Hide() end)
    -- Read-only: put the chat text back if the user types into it
    editBox:SetScript("OnTextChanged", function(self, userInput)
        if userInput then
            self:SetText(f.text)
            self:HighlightText()
        end
    end)
    scroll:SetScrollChild(editBox)
    scroll:SetScript("OnSizeChanged", function(self, width) editBox:SetWidth(width) end)

    f.scroll = scroll
    f.editBox = editBox
    return f
end

local function ShowCopyFrame(chatFrame)
    frame = frame or CreateCopyFrame()
    frame.text = GetChatText(chatFrame)
    frame:Show()
    frame.editBox:SetText(frame.text)
    frame.editBox:SetFocus()
    frame.editBox:HighlightText()
    -- Start at the newest messages once the edit box has laid out its text
    C_Timer.After(0, function()
        frame.scroll:SetVerticalScroll(frame.scroll:GetVerticalScrollRange())
    end)
end

local function AddCopyButton(chatFrame)
    local button = CreateFrame("Button", nil, chatFrame)
    button:SetSize(20, 20)
    button:SetPoint("TOPRIGHT", chatFrame, "TOPRIGHT", 0, 0)
    button:SetFrameLevel(chatFrame:GetFrameLevel() + 5)
    button:SetNormalTexture("Interface\\Buttons\\UI-GuildButton-PublicNote-Up")
    button:SetHighlightTexture("Interface\\Buttons\\UI-GuildButton-PublicNote-Up", "ADD")
    button:SetAlpha(0) -- shown while the chat window is moused over, see the fade hooks below
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("Copy chat text")
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    button:SetScript("OnClick", function() ShowCopyFrame(chatFrame) end)
    chatFrame.rxpCopyButton = button
end

-- Fade the button in and out with the chat window's tab, buttons and scroll bar
hooksecurefunc("FCF_FadeInChatFrame", function(chatFrame)
    local button = chatFrame.rxpCopyButton
    if button then
        UIFrameFadeIn(button, CHAT_FRAME_FADE_TIME, button:GetAlpha(), 1)
    end
end)
hooksecurefunc("FCF_FadeOutChatFrame", function(chatFrame)
    local button = chatFrame.rxpCopyButton
    if button then
        UIFrameFadeOut(button, CHAT_FRAME_FADE_OUT_TIME, button:GetAlpha(), 0)
    end
end)

for i = 1, NUM_CHAT_WINDOWS do
    AddCopyButton(_G["ChatFrame" .. i])
end

SLASH_RXPDUNGEONSCOPYCHAT1 = "/copychat"
SlashCmdList.RXPDUNGEONSCOPYCHAT = function(msg)
    local chatFrame = _G["ChatFrame" .. (tonumber(msg) or "")] or SELECTED_CHAT_FRAME or DEFAULT_CHAT_FRAME
    ShowCopyFrame(chatFrame)
end
