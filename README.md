## VISUAL3D2D 
Небольшая графическая библиотека для отображения текста,картинок или какой либо информации.
## Инструкция по установке 
Скопируйте файл [VISUAL3D2D.lua](../master/VISUAL3D2D.lua) в папку addons/VISUAL3D2D/lua/autorun/VISUAL3D2D.lua
и добавте в [AddCSLuaFile](https://wiki.facepunch.com/gmod/Global.AddCSLuaFile).
```lua
 
 
 VISUAL3D2D:CreateFont( "ARIAL2" , 20 , 800 )
  
 
 local vecto = Vector(5916.3012695313,-12863.064453125,-12791.987304688 + 40)
 VISUAL3D2D:CreatePanel(1 )
 VISUAL3D2D:SetGlobalPosVector(1 , vecto )
 VISUAL3D2D:SetColor(1, Color(255 ,255,200 ) , Color(200,200,200,200) )
 VISUAL3D2D:SetAngle(1 , 0,0,33)
 VISUAL3D2D:SetCornerRadius(1,15)
 VISUAL3D2D:SetSize(1, 255,200)
 VISUAL3D2D:Click(1,function()
	 RunConsoleCommand("say", "Click " .. 2)
 end)
 
 
 VISUAL3D2D:CreateLabel( 2 )
 VISUAL3D2D:SetText( 2 , "1sdkifnsdjnf!!" )
 VISUAL3D2D:SetAngle(2 , 0,0,33)
 VISUAL3D2D:SetGlobalPosVector(2 , vecto )
 VISUAL3D2D:SetLocalPos(2,10,20)
 VISUAL3D2D:SetTextColor( 2 , Color(33,33,33) ,Color(100,100,100) )
 VISUAL3D2D:SetFont(2, "ARIAL2")
 VISUAL3D2D:Click(2,function()
	 RunConsoleCommand("say", "Click " .. 2)
 end)
 
 VISUAL3D2D:CreateHtml( 3)
 VISUAL3D2D:SetGlobalPosVector(3 , vecto )
 VISUAL3D2D:SetLocalPos(3 , 700,0 )
 VISUAL3D2D:SetSize(3,30,90)
 VISUAL3D2D:SetHTMLcode(3,[[<img src="https://i.imgur.com/lUN832J.png" width="70" height="70"/>]])
 VISUAL3D2D:SetAngle(3 , 0,0,33)
 VISUAL3D2D:Click(3,function()
	 RunConsoleCommand("say", "Click " .. 3)
 end)
 
```
