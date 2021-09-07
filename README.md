# VISUAL3D2D
Небольшая библиотека графическая библиотека.
```lua

VISUAL3D2D:CreateFont( "ARIAL2" , 40 , 800 )

local vecto = Vector(-7541.427734375,-11936.412109375,-12958.987304688 + 40)
VISUAL3D2D:CreatePanel(1 )
VISUAL3D2D:SetGlobalPosVector(1 , vecto )
VISUAL3D2D:SetColor(1, Color(255 ,44,255 ) , Color(44,44,44,200) )
VISUAL3D2D:SetAngle(1 , 0,0,33)
VISUAL3D2D:SetCornerRadius(1,15)
VISUAL3D2D:SetSize(1, 255,200)
VISUAL3D2D:Click( 1 , function()
	chat.AddText(VISUAL3D2D:GetCornerRadius(1))
end)


VISUAL3D2D:CreateLabel( 2 )
VISUAL3D2D:SetText( 2 , "1sdkifnsdjnf!!" )
VISUAL3D2D:SetAngle(2 , 0,0,33)
VISUAL3D2D:SetGlobalPosVector(2 , vecto )
VISUAL3D2D:SetLocalPos(2,10,20)
VISUAL3D2D:SetTextColor( 2 , Color(255,255,255) ,Color(255,255,255) )
VISUAL3D2D:SetFont(2, "ARIAL2")
```
