
 

VISUAL3D2D:CreateFont( "ARIAL2" , 20 , 800 )
  
VISUAL3D2D.ISDRAW_information = true

local vecto = Vector(-7808.775879 ,13578.214844, -8191.718750 + 44)

local id = 1


VISUAL3D2D:CreateHtml( id)
//VISUAL3D2D:SetGlobalPosVector(id , vecto )
VISUAL3D2D:PatentTo(id,Entity(111))
--VISUAL3D2D:SetLocalPos(id , 700,0 )
VISUAL3D2D:SetSize(id,255,255)
VISUAL3D2D:SetImage(id , "https://files.facepunch.com/garry/822e60dc-c931-43e4-800f-cbe010b3d4cc.png" , 100, 100)
VISUAL3D2D:SetAngle(id , 0,0,33)
VISUAL3D2D:Click(id,function()
     
end)

id = 2
VISUAL3D2D:CreateHtml( id)
//VISUAL3D2D:SetGlobalPosVector(id , vecto )
VISUAL3D2D:PatentTo(id,Entity(243))
VISUAL3D2D:SetImage(id , "https://coubsecureassets-a.akamaihd.net/assets/default-avatars/285-79af2e23d85dc29ceb7e89d067d1fcbda70505aa0f065d301bfa587f1cf3486b.png" , 100, 100)
VISUAL3D2D:SetSize(id,800,600)
VISUAL3D2D:OpenURL(id, "")
VISUAL3D2D:SetAngle(id , 0,0,33)
VISUAL3D2D:Click(id,function()
     
end)
 
id = 3
VISUAL3D2D:CreateHtml( id)
VISUAL3D2D:PatentTo(id,Entity(258))
--VISUAL3D2D:OpenURL(id, "https://wiki.facepunch.com/gmod/string.Replace")
VISUAL3D2D:SetSize(id,800,600)
VISUAL3D2D:OpenURL(id, "")
VISUAL3D2D:SetAngle(id , 0,0,33)
VISUAL3D2D:Click(id,function()
     
end)

chat.AddText(VISUAL3D2D:GetCount())