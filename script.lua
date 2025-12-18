local p=game.Players.LocalPlayer 
local sg=Instance.new("ScreenGui",p:WaitForChild("PlayerGui")) 
sg.ResetOnSpawn=false
sg.IgnoreGuiInset=true
sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

local function getLanguage()
    local locale=game:GetService("LocalizationService").RobloxLocaleId
    if locale:sub(1,2)=="tr" then return "tr" end
    return "en"
end

local lang=getLanguage()

local translations={
    en={
        keyTitle="LaxyHUB Key System",
        enterKey="Enter Key Here...",
        verifyKey="Verify Key",
        getKey="Get Key",
        pleaseEnter="Please Enter Key",
        correctKey="Please Enter Correct Key",
        keyVerified="Key Verified! Loading...",
        linkCopied="Link Copied!",
        loading="LaxyHUB Loading...",
        tapMin="▼ Tap to minimize",
        closeQ="Do you want to close\nLaxyHUB?",
        yes="Yes",
        no="No",
        universal="Universal",
        main="Main",
        mm2Warning="⚠️ If black screen after round, rejoin",
        mm2Info="📱 Yarhm = For Mobile | 💻 Vertex = For PC",
        mobile="(Mobile)",
        pc="(PC)"
    },
    tr={
        keyTitle="LaxyHUB Anahtar Sistemi",
        enterKey="Anahtarı Buraya Girin...",
        verifyKey="Anahtarı Doğrula",
        getKey="Anahtar Al",
        pleaseEnter="Lütfen Anahtar Girin",
        correctKey="Lütfen Doğru Anahtarı Girin",
        keyVerified="Anahtar Doğrulandı! Yükleniyor...",
        linkCopied="Link Kopyalandı!",
        loading="LaxyHUB Yükleniyor...",
        tapMin="▼ Küçültmek için dokun",
        closeQ="LaxyHUB'ı kapatmak\nistiyor musunuz?",
        yes="Evet",
        no="Hayır",
        universal="Evrensel",
        main="Ana",
        mm2Warning="⚠️ Round sonrası siyah ekran olursa çık gir yapın",
        mm2Info="📱 Yarhm = Telefon için | 💻 Vertex = Bilgisayar için",
        mobile="(Telefon)",
        pc="(Bilgisayar)"
    }
}

local t=translations[lang]

local keyFrame=Instance.new("Frame",sg)
keyFrame.Size=UDim2.new(0,400,0,250)
keyFrame.Position=UDim2.new(0.5,-200,0.5,-125)
keyFrame.BackgroundColor3=Color3.fromRGB(30,30,30)
keyFrame.BorderSizePixel=0

local keyCorner=Instance.new("UICorner",keyFrame)
keyCorner.CornerRadius=UDim.new(0,15)

local keyStroke=Instance.new("UIStroke",keyFrame)
keyStroke.Color=Color3.fromRGB(100,150,255)
keyStroke.Thickness=3

local keyTitle=Instance.new("TextLabel",keyFrame)
keyTitle.Size=UDim2.new(1,0,0,50)
keyTitle.BackgroundColor3=Color3.fromRGB(50,50,50)
keyTitle.Text="LaxyHUB Key System"
keyTitle.TextColor3=Color3.new(1,1,1)
keyTitle.TextSize=22
keyTitle.Font=Enum.Font.GothamBold
keyTitle.BorderSizePixel=0

local keyGradient=Instance.new("UIGradient",keyTitle)
keyGradient.Color=ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(100,150,255)),
    ColorSequenceKeypoint.new(0.5,Color3.fromRGB(150,100,255)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(100,150,255))
}
keyGradient.Rotation=45

spawn(function()
    while keyFrame and keyFrame.Parent do
        for i=0,360,3 do
            if keyGradient then keyGradient.Rotation=i end
            wait(0.03)
        end
    end
end)

local keyInput=Instance.new("TextBox",keyFrame)
keyInput.Size=UDim2.new(1,-40,0,45)
keyInput.Position=UDim2.new(0,20,0,80)
keyInput.BackgroundColor3=Color3.fromRGB(40,40,40)
keyInput.Text=""
keyInput.PlaceholderText="Enter Key Here..."
keyInput.TextColor3=Color3.new(1,1,1)
keyInput.PlaceholderColor3=Color3.fromRGB(150,150,150)
keyInput.TextSize=16
keyInput.Font=Enum.Font.Gotham
keyInput.BorderSizePixel=0

local keyInputCorner=Instance.new("UICorner",keyInput)
keyInputCorner.CornerRadius=UDim.new(0,10)

local verifyBtn=Instance.new("TextButton",keyFrame)
verifyBtn.Size=UDim2.new(0,170,0,45)
verifyBtn.Position=UDim2.new(0,20,0,145)
verifyBtn.BackgroundColor3=Color3.fromRGB(50,200,50)
verifyBtn.Text="Verify Key"
verifyBtn.TextColor3=Color3.new(1,1,1)
verifyBtn.TextSize=18
verifyBtn.Font=Enum.Font.GothamBold
verifyBtn.BorderSizePixel=0

local verifyCorner=Instance.new("UICorner",verifyBtn)
verifyCorner.CornerRadius=UDim.new(0,10)

local getKeyBtn=Instance.new("TextButton",keyFrame)
getKeyBtn.Size=UDim2.new(0,170,0,45)
getKeyBtn.Position=UDim2.new(1,-190,0,145)
getKeyBtn.BackgroundColor3=Color3.fromRGB(70,70,200)
getKeyBtn.Text="Get Key"
getKeyBtn.TextColor3=Color3.new(1,1,1)
getKeyBtn.TextSize=18
getKeyBtn.Font=Enum.Font.GothamBold
getKeyBtn.BorderSizePixel=0

local getKeyCorner=Instance.new("UICorner",getKeyBtn)
getKeyCorner.CornerRadius=UDim.new(0,10)

local statusText=Instance.new("TextLabel",keyFrame)
statusText.Size=UDim2.new(1,-40,0,30)
statusText.Position=UDim2.new(0,20,0,205)
statusText.BackgroundTransparency=1
statusText.Text=""
statusText.TextColor3=Color3.fromRGB(255,100,100)
statusText.TextSize=14
statusText.Font=Enum.Font.GothamBold

verifyBtn.MouseEnter:Connect(function() verifyBtn.BackgroundColor3=Color3.fromRGB(70,220,70) end)
verifyBtn.MouseLeave:Connect(function() verifyBtn.BackgroundColor3=Color3.fromRGB(50,200,50) end)
getKeyBtn.MouseEnter:Connect(function() getKeyBtn.BackgroundColor3=Color3.fromRGB(100,100,230) end)
getKeyBtn.MouseLeave:Connect(function() getKeyBtn.BackgroundColor3=Color3.fromRGB(70,70,200) end)

getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/We6zWm7t")
    getKeyBtn.Text="Link Copied!"
    wait(2)
    getKeyBtn.Text="Get Key"
end)

verifyBtn.MouseButton1Click:Connect(function()
    local key=keyInput.Text
    if key=="" then
        statusText.Text="Please Enter Key"
        statusText.TextColor3=Color3.fromRGB(255,100,100)
    elseif key=="LaxyHub2025" then
        statusText.Text="Key Verified! Loading..."
        statusText.TextColor3=Color3.fromRGB(100,255,100)
        wait(1)
        keyFrame:Destroy()
        
        local loadingFrame=Instance.new("Frame",sg)
        loadingFrame.Size=UDim2.new(1,0,1,0)
        loadingFrame.BackgroundColor3=Color3.fromRGB(20,20,20)
        loadingFrame.ZIndex=1000

        local loadingText=Instance.new("TextLabel",loadingFrame)
        loadingText.Size=UDim2.new(0,400,0,100)
        loadingText.Position=UDim2.new(0.5,-200,0.5,-50)
        loadingText.BackgroundTransparency=1
        loadingText.Text="LaxyHUB Loading..."
        loadingText.TextColor3=Color3.fromRGB(100,150,255)
        loadingText.TextSize=36
        loadingText.Font=Enum.Font.GothamBold
        loadingText.ZIndex=1001

        local loadGrad=Instance.new("UIGradient",loadingText)
        loadGrad.Color=ColorSequence.new{
            ColorSequenceKeypoint.new(0,Color3.fromRGB(100,150,255)),
            ColorSequenceKeypoint.new(0.5,Color3.fromRGB(150,100,255)),
            ColorSequenceKeypoint.new(1,Color3.fromRGB(100,150,255))
        }

        spawn(function()
            while loadingFrame.Parent do
                for i=0,360,5 do
                    if loadGrad then loadGrad.Rotation=i end
                    wait(0.02)
                end
            end
        end)

        spawn(function()
            for i=1,25 do
                wait(0.2)
                local dots=string.rep(".",i%4)
                if loadingText then loadingText.Text="LaxyHUB Loading"..dots end
            end
        end)

        wait(5)
        game:GetService("TweenService"):Create(loadingFrame,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
        game:GetService("TweenService"):Create(loadingText,TweenInfo.new(0.5),{TextTransparency=1}):Play()
        wait(0.5)
        loadingFrame:Destroy()
        
        local toggleBtn=Instance.new("TextButton",sg)
        toggleBtn.Size=UDim2.new(0,70,0,70)
        toggleBtn.Position=UDim2.new(0,150,0.5,-35)
        toggleBtn.BackgroundColor3=Color3.fromRGB(40,40,40)
        toggleBtn.Text="LH"
        toggleBtn.TextColor3=Color3.new(1,1,1)
        toggleBtn.TextSize=32
        toggleBtn.Font=Enum.Font.GothamBlack
        toggleBtn.ZIndex=100
        toggleBtn.Active=true

        local toggleCorner=Instance.new("UICorner",toggleBtn)
        toggleCorner.CornerRadius=UDim.new(0,15)

        local toggleStroke=Instance.new("UIStroke",toggleBtn)
        toggleStroke.Color=Color3.fromRGB(100,150,255)
        toggleStroke.Thickness=4
        toggleStroke.Transparency=0.2

        local dragging=false
        local dragInput,dragStart,startPos

        toggleBtn.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                dragging=true
                dragStart=input.Position
                startPos=toggleBtn.Position
                game:GetService("TweenService"):Create(toggleBtn,TweenInfo.new(0.2,Enum.EasingStyle.Back),{Size=UDim2.new(0,75,0,75)}):Play()
                input.Changed:Connect(function()
                    if input.UserInputState==Enum.UserInputState.End then
                        dragging=false
                        game:GetService("TweenService"):Create(toggleBtn,TweenInfo.new(0.2,Enum.EasingStyle.Back),{Size=UDim2.new(0,70,0,70)}):Play()
                    end
                end)
            end
        end)

        toggleBtn.InputChanged:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
                dragInput=input
            end
        end)

        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input==dragInput and dragging then
                local delta=input.Position-dragStart
                game:GetService("TweenService"):Create(toggleBtn,TweenInfo.new(0.1,Enum.EasingStyle.Linear),{
                    Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
                }):Play()
            end
        end)

        toggleBtn.MouseEnter:Connect(function()
            if not dragging then
                game:GetService("TweenService"):Create(toggleBtn,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,80,0,80)}):Play()
                toggleStroke.Transparency=0
            end
        end)

        toggleBtn.MouseLeave:Connect(function()
            if not dragging then
                game:GetService("TweenService"):Create(toggleBtn,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,70,0,70)}):Play()
                toggleStroke.Transparency=0.2
            end
        end)

        local f=Instance.new("Frame",sg)
        f.Size=UDim2.new(0,600,0,400)
        f.Position=UDim2.new(0.5,-300,0.5,-200)
        f.BackgroundColor3=Color3.fromRGB(30,30,30)
        f.ClipsDescendants=true
        f.Visible=false

        local corner=Instance.new("UICorner",f)
        corner.CornerRadius=UDim.new(0,15)

        local stroke=Instance.new("UIStroke",f)
        stroke.Color=Color3.fromRGB(100,150,255)
        stroke.Thickness=3
        stroke.Transparency=0.3

        local t=Instance.new("TextLabel",f)
        t.Size=UDim2.new(1,0,0,50)
        t.BackgroundColor3=Color3.fromRGB(50,50,50)
        t.Text="LaxyHUB"
        t.TextColor3=Color3.new(1,1,1)
        t.TextSize=24
        t.Font=Enum.Font.GothamBold

        local grad=Instance.new("UIGradient",t)
        grad.Color=ColorSequence.new{
            ColorSequenceKeypoint.new(0,Color3.fromRGB(100,150,255)),
            ColorSequenceKeypoint.new(0.5,Color3.fromRGB(150,100,255)),
            ColorSequenceKeypoint.new(1,Color3.fromRGB(100,150,255))
        }

        spawn(function()
            while wait() do
                for i=0,360,3 do
                    if grad then grad.Rotation=i end
                    wait(0.03)
                end
            end
        end)

        local c=Instance.new("TextLabel",f)
        c.Size=UDim2.new(1,0,0,20)
        c.Position=UDim2.new(0,0,0,50)
        c.BackgroundColor3=Color3.fromRGB(50,50,50)
        c.Text="By Wlasaa"
        c.TextColor3=Color3.fromRGB(100,150,255)
        c.TextSize=12
        c.Font=Enum.Font.Gotham

        local minimizeBtn=Instance.new("TextButton",f)
        minimizeBtn.Size=UDim2.new(1,0,0,30)
        minimizeBtn.Position=UDim2.new(0,0,0,70)
        minimizeBtn.BackgroundColor3=Color3.fromRGB(45,45,45)
        minimizeBtn.Text="▼ Tap to minimize"
        minimizeBtn.TextColor3=Color3.fromRGB(150,150,150)
        minimizeBtn.TextSize=14
        minimizeBtn.Font=Enum.Font.GothamBold

        minimizeBtn.MouseEnter:Connect(function()
            minimizeBtn.BackgroundColor3=Color3.fromRGB(60,60,60)
            minimizeBtn.TextColor3=Color3.fromRGB(100,150,255)
        end)
        minimizeBtn.MouseLeave:Connect(function()
            minimizeBtn.BackgroundColor3=Color3.fromRGB(45,45,45)
            minimizeBtn.TextColor3=Color3.fromRGB(150,150,150)
        end)

        local closeBtn=Instance.new("TextButton",f)
        closeBtn.Size=UDim2.new(0,35,0,35)
        closeBtn.Position=UDim2.new(1,-45,0,7.5)
        closeBtn.BackgroundColor3=Color3.fromRGB(200,50,50)
        closeBtn.Text="✖"
        closeBtn.TextColor3=Color3.new(1,1,1)
        closeBtn.TextSize=18
        closeBtn.Font=Enum.Font.GothamBold

        local closeCorn=Instance.new("UICorner",closeBtn)
        closeCorn.CornerRadius=UDim.new(0,8)

        closeBtn.MouseEnter:Connect(function()
            closeBtn:TweenSize(UDim2.new(0,40,0,40),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2,true)
            closeBtn.BackgroundColor3=Color3.fromRGB(220,70,70)
        end)
        closeBtn.MouseLeave:Connect(function()
            closeBtn:TweenSize(UDim2.new(0,35,0,35),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2,true)
            closeBtn.BackgroundColor3=Color3.fromRGB(200,50,50)
        end)

        local confirmFrame=Instance.new("Frame",sg)
        confirmFrame.Size=UDim2.new(0,300,0,150)
        confirmFrame.Position=UDim2.new(0.5,-150,0.5,-75)
        confirmFrame.BackgroundColor3=Color3.fromRGB(40,40,40)
        confirmFrame.Visible=false
        confirmFrame.ZIndex=10

        local confCorn=Instance.new("UICorner",confirmFrame)
        confCorn.CornerRadius=UDim.new(0,12)

        local confStroke=Instance.new("UIStroke",confirmFrame)
        confStroke.Color=Color3.fromRGB(100,150,255)
        confStroke.Thickness=2

        local confText=Instance.new("TextLabel",confirmFrame)
        confText.Size=UDim2.new(1,-20,0,60)
        confText.Position=UDim2.new(0,10,0,20)
        confText.BackgroundTransparency=1
        confText.Text="Do you want to close\nLaxyHUB?"
        confText.TextColor3=Color3.new(1,1,1)
        confText.TextSize=18
        confText.Font=Enum.Font.GothamBold
        confText.TextWrapped=true
        confText.ZIndex=11

        local yesBtn=Instance.new("TextButton",confirmFrame)
        yesBtn.Size=UDim2.new(0,120,0,45)
        yesBtn.Position=UDim2.new(0,20,1,-65)
        yesBtn.BackgroundColor3=Color3.fromRGB(50,200,50)
        yesBtn.Text="Yes"
        yesBtn.TextColor3=Color3.new(1,1,1)
        yesBtn.TextSize=18
        yesBtn.Font=Enum.Font.GothamBold
        yesBtn.ZIndex=11

        local yesCorn=Instance.new("UICorner",yesBtn)
        yesCorn.CornerRadius=UDim.new(0,8)

        local noBtn=Instance.new("TextButton",confirmFrame)
        noBtn.Size=UDim2.new(0,120,0,45)
        noBtn.Position=UDim2.new(1,-140,1,-65)
        noBtn.BackgroundColor3=Color3.fromRGB(200,50,50)
        noBtn.Text="No"
        noBtn.TextColor3=Color3.new(1,1,1)
        noBtn.TextSize=18
        noBtn.Font=Enum.Font.GothamBold
        noBtn.ZIndex=11

        local noCorn=Instance.new("UICorner",noBtn)
        noCorn.CornerRadius=UDim.new(0,8)

        yesBtn.MouseEnter:Connect(function() yesBtn.BackgroundColor3=Color3.fromRGB(70,220,70) end)
        yesBtn.MouseLeave:Connect(function() yesBtn.BackgroundColor3=Color3.fromRGB(50,200,50) end)
        noBtn.MouseEnter:Connect(function() noBtn.BackgroundColor3=Color3.fromRGB(220,70,70) end)
        noBtn.MouseLeave:Connect(function() noBtn.BackgroundColor3=Color3.fromRGB(200,50,50) end)

        closeBtn.MouseButton1Click:Connect(function()
            confirmFrame.Visible=true
            confirmFrame.Size=UDim2.new(0,0,0,0)
            confirmFrame:TweenSize(UDim2.new(0,300,0,150),Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.3,true)
        end)

        yesBtn.MouseButton1Click:Connect(function()
            confirmFrame:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.In,Enum.EasingStyle.Back,0.2,true)
            wait(0.2)
            f:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Back,0.3,true,function() sg:Destroy() end)
        end)

        noBtn.MouseButton1Click:Connect(function()
            confirmFrame:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.In,Enum.EasingStyle.Back,0.2,true)
            wait(0.2)
            confirmFrame.Visible=false
            confirmFrame.Size=UDim2.new(0,300,0,150)
        end)

        local leftPanel=Instance.new("ScrollingFrame",f)
        leftPanel.Size=UDim2.new(0,180,1,-100)
        leftPanel.Position=UDim2.new(0,0,0,100)
        leftPanel.BackgroundColor3=Color3.fromRGB(40,40,40)
        leftPanel.ScrollBarThickness=6
        leftPanel.CanvasSize=UDim2.new(0,0,0,0)
        leftPanel.AutomaticCanvasSize=Enum.AutomaticSize.Y

        local rightPanel=Instance.new("ScrollingFrame",f)
        rightPanel.Size=UDim2.new(1,-180,1,-100)
        rightPanel.Position=UDim2.new(0,180,0,100)
        rightPanel.BackgroundColor3=Color3.fromRGB(35,35,35)
        rightPanel.ScrollBarThickness=6
        rightPanel.CanvasSize=UDim2.new(0,0,0,0)

        local function categoryBtn(txt,y)
            local btn=Instance.new("TextButton",leftPanel)
            btn.Size=UDim2.new(1,-10,0,45)
            btn.Position=UDim2.new(0,5,0,y)
            btn.BackgroundColor3=Color3.fromRGB(60,60,60)
            btn.Text=txt
            btn.TextColor3=Color3.new(1,1,1)
            btn.TextSize=16
            btn.Font=Enum.Font.GothamBold
            btn.TextStrokeTransparency=0.5
            btn.AutoLocalize=false
            
            local btnCorn=Instance.new("UICorner",btn)
            btnCorn.CornerRadius=UDim.new(0,10)
            
            btn.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(btn,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundColor3=Color3.fromRGB(80,80,220)}):Play()
                btn:TweenSize(UDim2.new(1,-5,0,48),Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.2,true)
            end)
            
            btn.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(btn,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundColor3=Color3.fromRGB(60,60,60)}):Play()
                btn:TweenSize(UDim2.new(1,-10,0,45),Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.2,true)
            end)
            
            return btn
        end

        local function scriptBtn(txt,y,url)
            local btn=Instance.new("TextButton",rightPanel)
            btn.Size=UDim2.new(0,380,0,50)
            btn.Position=UDim2.new(0.5,-190,0,y)
            btn.BackgroundColor3=Color3.fromRGB(70,70,200)
            btn.Text=txt
            btn.TextColor3=Color3.new(1,1,1)
            btn.TextSize=18
            btn.Font=Enum.Font.GothamBold
            btn.TextStrokeTransparency=0.5
            btn.Visible=false
            btn.AutoLocalize=false
            
            local btnCorn=Instance.new("UICorner",btn)
            btnCorn.CornerRadius=UDim.new(0,10)
            
            local btnGrad=Instance.new("UIGradient",btn)
            btnGrad.Color=ColorSequence.new{
                ColorSequenceKeypoint.new(0,Color3.fromRGB(70,70,200)),
                ColorSequenceKeypoint.new(1,Color3.fromRGB(100,100,230))
            }
            btnGrad.Rotation=90
            
            btn.MouseEnter:Connect(function()
                btn:TweenSize(UDim2.new(0,390,0,55),Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.2,true)
                game:GetService("TweenService"):Create(btnGrad,TweenInfo.new(0.2),{
                    Color=ColorSequence.new{
                        ColorSequenceKeypoint.new(0,Color3.fromRGB(100,100,230)),
                        ColorSequenceKeypoint.new(1,Color3.fromRGB(130,130,255))
                    }
                }):Play()
            end)
            
            btn.MouseLeave:Connect(function()
                btn:TweenSize(UDim2.new(0,380,0,50),Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.2,true)
                game:GetService("TweenService"):Create(btnGrad,TweenInfo.new(0.2),{
                    Color=ColorSequence.new{
                        ColorSequenceKeypoint.new(0,Color3.fromRGB(70,70,200)),
                        ColorSequenceKeypoint.new(1,Color3.fromRGB(100,100,230))
                    }
                }):Play()
            end)
            
            btn.MouseButton1Click:Connect(function()
                spawn(function()
                    game:GetService("TweenService"):Create(btn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(150,150,255)}):Play()
                    wait(0.1)
                    game:GetService("TweenService"):Create(btn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(70,70,200)}):Play()
                    if url then loadstring(game:HttpGet(url))() end
                end)
            end)
            
            return btn
        end

        local universalBtn=categoryBtn("Universal",10)
        local mainBtn=categoryBtn("Main",65)

        local flyBtn=scriptBtn("Fly",10,"https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
        local noclipBtn=scriptBtn("No Clip",70)
        local iyBtn=scriptBtn("Infinite Yield",130,"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

        noclipBtn.MouseButton1Click:Connect(function()
            local Noclip,Clip=nil,nil
            function noclip()
                Clip=false
                local function Nocl()
                    if Clip==false and game.Players.LocalPlayer.Character then
                        for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if v:IsA('BasePart') and v.CanCollide and v.Name~=floatName then
                                v.CanCollide=false
                            end
                        end
                    end
                    wait(0.21)
                end
                Noclip=game:GetService('RunService').Stepped:Connect(Nocl)
            end
            noclip()
        end)

        local bloxBtn=scriptBtn("Blox Fruit",10,"https://rawscripts.net/raw/Universal-Script-NEW-UPDATE-BLOX-FRUIT-67405")
        local nightsBtn=scriptBtn("99 Nights in the Forest",70,"https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua")
        local arsenalBtn=scriptBtn("Arsenal",130)
        local rivalsBtn=scriptBtn("Rivals",190)
        local forgeBtn=scriptBtn("The Forge",250)
        local bladeballBtn=scriptBtn("Blade Ball",310)
        local mm2Btn=scriptBtn("Murder Mystery 2",370)
        
        local mm2YarhmBtn=scriptBtn("Yarhm\n(Mobile)",10,"https://raw.githubusercontent.com/A1ex-0n/MM2/main/yarhm.lua")
        local mm2VertexBtn=scriptBtn("Vertex\n(PC)",70,"https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring")

        arsenalBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://soluna-script.vercel.app/arsenal.lua",true))() end)
        rivalsBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/endoverdosing/Soluna-API/refs/heads/main/rivals-classic.lua",true))() end)
        forgeBtn.MouseButton1Click:Connect(function() repeat wait() until game:IsLoaded() loadstring(game:HttpGet("https://raw.githubusercontent.com/LioK251/RbScripts/refs/heads/main/lazyuhub_theforge.lua"))() end)
        bladeballBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AgentX771/ArgonHubX/main/Loader.lua"))() end)
        
        mm2Btn.MouseButton1Click:Connect(function()
            hideAll()
            mm2YarhmBtn.Visible=true
            mm2VertexBtn.Visible=true
            rightPanel.CanvasSize=UDim2.new(0,0,0,130)
        end)

        local function hideAll()
            for _,v in pairs(rightPanel:GetChildren()) do
                if v:IsA("TextButton") or (v:IsA("TextLabel") and v.Name~="UICorner") then
                    if v:IsA("TextButton") then v.Visible=false end
                    if v:IsA("TextLabel") and v.Name~="UICorner" then v:Destroy() end
                end
            end
            rightPanel.CanvasSize=UDim2.new(0,0,0,0)
        end

        universalBtn.MouseButton1Click:Connect(function()
            hideAll()
            flyBtn.Visible=true
            noclipBtn.Visible=true
            iyBtn.Visible=true
            rightPanel.CanvasSize=UDim2.new(0,0,0,190)
        end)

        mainBtn.MouseButton1Click:Connect(function()
            hideAll()
            bloxBtn.Visible=true
            nightsBtn.Visible=true
            arsenalBtn.Visible=true
            rivalsBtn.Visible=true
            forgeBtn.Visible=true
            bladeballBtn.Visible=true
            mm2Btn.Visible=true
            rightPanel.CanvasSize=UDim2.new(0,0,0,430)
        end)

        mm2Btn.MouseButton1Click:Connect(function()
            hideAll()
            
            local warningText=Instance.new("TextLabel",rightPanel)
            warningText.Size=UDim2.new(1,-20,0,60)
            warningText.Position=UDim2.new(0,10,0,10)
            warningText.BackgroundColor3=Color3.fromRGB(50,50,50)
            warningText.Text="⚠️ If black screen after round, rejoin"
            warningText.TextColor3=Color3.fromRGB(255,200,0)
            warningText.TextSize=14
            warningText.Font=Enum.Font.GothamBold
            warningText.TextWrapped=true
            
            local warnCorn=Instance.new("UICorner",warningText)
            warnCorn.CornerRadius=UDim.new(0,8)
            
            local infoText=Instance.new("TextLabel",rightPanel)
            infoText.Size=UDim2.new(1,-20,0,40)
            infoText.Position=UDim2.new(0,10,0,80)
            infoText.BackgroundColor3=Color3.fromRGB(45,45,45)
            infoText.Text="📱 Yarhm = For Mobile | 💻 Vertex = For PC"
            infoText.TextColor3=Color3.fromRGB(150,200,255)
            infoText.TextSize=13
            infoText.Font=Enum.Font.Gotham
            infoText.TextWrapped=true
            
            local infoCorn=Instance.new("UICorner",infoText)
            infoCorn.CornerRadius=UDim.new(0,8)
            
            mm2YarhmBtn.Position=UDim2.new(0.5,-190,0,130)
            mm2VertexBtn.Position=UDim2.new(0.5,-190,0,190)
            mm2YarhmBtn.Visible=true
            mm2VertexBtn.Visible=true
            rightPanel.CanvasSize=UDim2.new(0,0,0,250)
        end)

        local function toggleMenu()
            if f.Visible then
                f:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.In,Enum.EasingStyle.Back,0.3,true,function()
                    f.Visible=false
                    f.Size=UDim2.new(0,600,0,400)
                    toggleBtn.Visible=true
                end)
                game:GetService("TweenService"):Create(stroke,TweenInfo.new(0.3),{Transparency=1}):Play()
            else
                f.Visible=true
                toggleBtn.Visible=false
                f.Size=UDim2.new(0,0,0,0)
                f:TweenSize(UDim2.new(0,600,0,400),Enum.EasingDirection.Out,Enum.EasingStyle.Back,0.4,true)
                game:GetService("TweenService"):Create(stroke,TweenInfo.new(0.3),{Transparency=0.3}):Play()
            end
        end

        game:GetService("UserInputService").InputBegan:Connect(function(i,gpe)
            if gpe then return end
            if i.KeyCode==Enum.KeyCode.P then toggleMenu() end
        end)

        toggleBtn.MouseButton1Click:Connect(function() toggleMenu() end)
        minimizeBtn.MouseButton1Click:Connect(function() toggleMenu() end)

        local d,di,ds,sp
        t.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 then
                d=true
                ds=i.Position
                sp=f.Position
            end
        end)
        t.InputChanged:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseMovement then di=i end
        end)
        t.InputEnded:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 then d=false end
        end)
        game:GetService("RunService").RenderStepped:Connect(function()
            if d and di then
                local delta=di.Position-ds
                f.Position=UDim2.new(sp.X.Scale,sp.X.Offset+delta.X,sp.Y.Scale,sp.Y.Offset+delta.Y)
            end
        end)
        
        toggleMenu()
    else
        statusText.Text="Please Enter Correct Key"
        statusText.TextColor3=Color3.fromRGB(255,100,100)
    end
end)
