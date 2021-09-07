
VISUAL3D2D = VISUAL3D2D or {}
VISUAL3D2D.UIelement =  {}
VISUAL3D2D.ISDRAW = true
VISUAL3D2D.TYPES = {
	"LABEL",
	"PANEL",
}
VISUAL3D2D.DRAWINF = {}
VISUAL3D2D.MOUSE = 
{


}

function VISUAL3D2D:CreateFont( name , si , we)
	we = we or 600
	si = si or 17
	surface.CreateFont( name , {
		font = "Arial", 
		extended = false,
		size = si,
		weight = we,
		
	} )
end
VISUAL3D2D:CreateFont( "ARIAL" )





function VISUAL3D2D:Debug( string , is_err )
	is_err = is_err or false
	local color = is_err and Color(255,0,0) or Color(70,255,255)
	 
	chat.AddText( color,  "[VISUAL3D2D] " , Color(70,255,255) , string )
end

function VISUAL3D2D:GetCount()
	return table.Count(self.UIelement)
end

function VISUAL3D2D:GetType(ID)
	if( not VISUAL3D2D:IsValid( ID ) ) then	return "nil" end 	 
	return self.UIelement[ID].TYPE
end

function VISUAL3D2D:IsValid( ID )
 
	--if(  self:GetCount() > ID or  self:GetCount() < 0) then return false end 
	if( self.UIelement[ID] == nil ) then return false end 

	return self.UIelement[ID].ISVALID
end

function VISUAL3D2D:IsType(ID , IDTYPE)
	if( not VISUAL3D2D:IsValid( ID ) ) then  return false end 
	return self.UIelement[ID].TYPE == self.TYPES[IDTYPE] 
end
--------------------------------
--------------------------------Label
--------------------------------
function VISUAL3D2D:CreateLabel( ID) 
	 
	self.UIelement[ID] = {
		ISVALID = true,
		TYPE = self.TYPES[1],

		LOCAL_POSITION = {0,0},
		GLOABAL_POSITION = LocalPlayer():GetEyeTrace().HitPos + Vector(0, 0, 25),
		ANG = Angle(0,0,0),
		

		TEXT = "<nil>",
		FONT = "ARIAL",
		COLOR_TEXT = Color(255,255,255),
		COLOR_TEXT_HOVER = Color(255,255,255),
		Click = nil,
	}
end

function VISUAL3D2D:CreatePanel( ID) 
	 
	self.UIelement[ID] = {
		ISVALID = true,
		TYPE = self.TYPES[2],

		LOCAL_POSITION = {0,0},
		GLOABAL_POSITION = LocalPlayer():GetEyeTrace().HitPos + Vector(0, 0, 25),
		ANG = Angle(0,0,0),
		SIZE = {100,25},

		COLOR = Color(255,255,255),
		COLOR_HOVER = Color(255,255,255),
		Click = nil,
		cornerRadius = 0,
	}
end




function VISUAL3D2D:SetText( ID , string )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	 
	 
	if( not VISUAL3D2D:IsType(ID , 1) ) then 	
		VISUAL3D2D:Debug( "Не тот тип!" , true )	
		return  
	end 
	self.UIelement[ID].TEXT = string
end 
----LOCAL---
function VISUAL3D2D:SetLocalPos( ID , x , y )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	 
	 
	self.UIelement[ID].LOCAL_POSITION = {x,y}
end

function VISUAL3D2D:GetLocalPos( ID )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return {0,0} end 	 
	return self.UIelement[ID].LOCAL_POSITION  
end

----angle
function VISUAL3D2D:SetAngle( ID , x , y , z )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	

	x , y , z = x or 0 , y or 0 , z or 0
	self.UIelement[ID].ANG = Angle(x , y , z)
end

function VISUAL3D2D:TraceLineHit()
	local tr = util.TraceLine( {
		start = LocalPlayer():EyePos(),
		endpos = LocalPlayer():EyePos() + EyeAngles():Forward() * 10000,
		filter = function( ent ) 
			return true 
		end
	} )	 
	if tr.Hit then
		return true
	else
		return false
	end
end
function VISUAL3D2D:SetCornerRadius( ID , Radius )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return  end 	 	
	if( not VISUAL3D2D:IsType(ID , 2) ) then 		
		return 
	end 
	 
	Radius = Radius or 0
	VISUAL3D2D.UIelement[ID].cornerRadius = Radius
end
function VISUAL3D2D:GetCornerRadius( ID )
	if( not self:IsValid( ID ) ) then	return 0 end 	 	
	if( not self:IsType(ID , 2) ) then 	
	 
		return 0
	end 
	 
	return self.UIelement[ID].cornerRadius 
end

function VISUAL3D2D:GetTextSize( ID , font )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return {0,0} end 	 	
	if( not VISUAL3D2D:IsType(ID , 1) ) then 		
		return {0,0}
	end 

	surface.SetFont(font)

	local w,h = surface.GetTextSize(VISUAL3D2D:GetText(ID))



	return {w,h}
end
function VISUAL3D2D:GetSize(ID)
	if( VISUAL3D2D:IsValid( ID ) ) then	

		if( VISUAL3D2D:IsType(ID , 1) ) then 	
			
			return VISUAL3D2D:GetTextSize( ID , VISUAL3D2D:GetFont(ID) )

		elseif( VISUAL3D2D:IsType(ID , 2) ) then 
		 
			return self.UIelement[ID].SIZE
		end 
	else
		
		return {0,0} 
	end 	

end


function VISUAL3D2D:SetSize(ID , w , h )
	if( VISUAL3D2D:IsValid( ID ) ) then	

		if( VISUAL3D2D:IsType(ID , 2) ) then 
			
			self.UIelement[ID].SIZE = {w,h}
		end 
	else
		
		 
	end 	

end


function VISUAL3D2D:SetTextColor( ID , color , color_hover )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	

	color = color or Color(255,255,255)
	self.UIelement[ID].COLOR_TEXT = color

	color_hover = color_hover or Color(255,255,255)
	self.UIelement[ID].COLOR_TEXT_HOVER = color_hover
end

function VISUAL3D2D:GetTextColor( ID )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return Color(255,255,255) end 	 

	return {
		self.UIelement[ID].COLOR_TEXT,
		self.UIelement[ID].COLOR_TEXT_HOVER
	}
end
 

function VISUAL3D2D:SetColor( ID , color , color_hover )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	

	color = color or Color(255,255,255)
	self.UIelement[ID].COLOR = color

	color_hover = color_hover or Color(255,255,255)
	self.UIelement[ID].COLOR_HOVER = color_hover
end

function VISUAL3D2D:GetColor( ID )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return Color(255,255,255) end 	 

	return {
		self.UIelement[ID].COLOR,
		self.UIelement[ID].COLOR_HOVER
	}
end


function VISUAL3D2D:GetAngle( ID )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return Angle(0,0,0) end 	 
	return self.UIelement[ID].ANG  
end


----GLOBAL---
function VISUAL3D2D:SetGlobalPos( ID , x , y , z )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	 
	
	x , y , z = x or 0 , y or 0 , z or 0
	self.UIelement[ID].GLOABAL_POSITION = Vector(x , y , z)
end
function VISUAL3D2D:SetGlobalPosVector( ID , vec )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	 
	
	vec = vec or Vector(0, 0, 0)
	self.UIelement[ID].GLOABAL_POSITION = vec
end


function VISUAL3D2D:Click( ID , func)
	if( not VISUAL3D2D:IsValid( ID ) ) then	return false end 	 
	
	self.UIelement[ID].Click = func
end

function VISUAL3D2D:GetGlobalPos( ID )
	if( not VISUAL3D2D:IsValid( ID ) ) then	return Vector(0, 0, 0) end 	 
	return self.UIelement[ID].GLOABAL_POSITION  
end


function VISUAL3D2D:GetText( ID  )

	if( not VISUAL3D2D:IsValid( ID ) ) then	return "<nil>" end 	 	
	if( not VISUAL3D2D:IsType(ID , 1) ) then 		
		return "<nil>" 
	end 

	return self.UIelement[ID].TEXT or "<nil>" 
end

function VISUAL3D2D:SetFont( ID , name_font )

	if( not VISUAL3D2D:IsValid( ID ) ) then	return end 	 	
	if( not VISUAL3D2D:IsType(ID , 1) ) then 		
		return 
	end 
	self.UIelement[ID].FONT = name_font
	 
end

function VISUAL3D2D:GetFont( ID , name_font )

	if( not VISUAL3D2D:IsValid( ID ) ) then	return "ARIAL" end 	 	
	if( not VISUAL3D2D:IsType(ID , 1) ) then 		
		return "ARIAL"
	end 
	return self.UIelement[ID].FONT   
end
 
function VISUAL3D2D:IsHovering(cur_pos, x, y, w, h)
	local c_x, c_y = cur_pos.x,cur_pos.y
	return c_x and c_y and c_x >= x and c_x <= (x + w) and c_y >= y and c_y <= (y + h)
end

function VISUAL3D2D:GetCursorPosition(pos , angles , scale)
	local CURPOS = {
		x = -1,
		y = -1
	}
	if not vgui.CursorVisible() or vgui.IsHoveringWorld() then
		local tr = LocalPlayer():GetEyeTrace()
		local eyepos = tr.StartPos
		local eyenormal

		if vgui.CursorVisible() and vgui.IsHoveringWorld() then
			eyenormal = gui.ScreenToVector(gui.MousePos())
		else
			eyenormal = tr.Normal
		end

		local planeNormal = angles:Up()

		local hitPos = util.IntersectRayWithPlane(eyepos, eyenormal, pos, planeNormal)
		if hitPos then
			 
				local diff = pos - hitPos

			 
				local x = diff:Dot(-angles:Forward()) / scale
				local y = diff:Dot(-angles:Right()) / scale

				CURPOS.x = x
				CURPOS.y = y
			 
		else
			CURPOS.x = -1
			CURPOS.y = -1

			 
		end
	else
		CURPOS.x = -1
		CURPOS.y = -1

		 
	end

	return CURPOS
end

hook.Add( "HUDPaint", "DrawInf", function()
	local count_ = 0
	for _,k in pairs(VISUAL3D2D.DRAWINF) do 
		local string = ""
		local count_line = 0
		for i,d in pairs(k) do 		
			string = string .. d .."\n"
			count_line = count_line + 1
		end
		draw.DrawText( string, "informa", 10,(count_line * 16 + 10) * _ - 50, color_white )
	end
	local pres = VISUAL3D2D.MOUSE.pressing
	VISUAL3D2D.MOUSE.pressing = (KEY_E and input.IsKeyDown(KEY_E)) or (MOUSE_LEFT and input.IsMouseDown(MOUSE_LEFT))  
	VISUAL3D2D.MOUSE.pressed = not pres and VISUAL3D2D.MOUSE.pressing			
end )
 
hook.Remove("PostDrawOpaqueRenderables", "example")
hook.Add("PostDrawOpaqueRenderables", "example", function()
	if( not VISUAL3D2D.ISDRAW ) then return end 
	local scale = 0.1
	for ID=1,VISUAL3D2D:GetCount() do
		local gp =  VISUAL3D2D:GetGlobalPos(ID)
		local ag =  VISUAL3D2D:GetAngle( ID )
		cam.Start3D2D(gp , ag, scale )

			local cur_pos = VISUAL3D2D:GetCursorPosition(gp , ag , scale)
			local type_ = VISUAL3D2D:GetType(ID)
			local color_

			local pos_
			local ishovered = false
			local size_text = {0,0}
			if( cur_pos.x !=0 and cur_pos.y != 0) then 
				local size = 24
				draw.RoundedBox( 0, cur_pos.x - size/2, cur_pos.y , size,1, Color(55, 255, 255, 255) )	
				draw.RoundedBox( 0, cur_pos.x , cur_pos.y - size / 2, 1,size, Color(55, 255, 255, 255) )			 
			end
			if( type_ == VISUAL3D2D.TYPES[1] ) then 
				color_ = VISUAL3D2D:GetTextColor( ID )
				pos_ = VISUAL3D2D:GetLocalPos(ID)
				size_text = VISUAL3D2D:GetTextSize( ID , VISUAL3D2D:GetFont(ID) )

				
				ishovered = VISUAL3D2D:IsHovering(cur_pos, pos_[1], pos_[2], size_text[1] , size_text[2])
				if( ishovered ) then 
					draw.SimpleText( VISUAL3D2D:GetText(ID), VISUAL3D2D:GetFont(ID), pos_[1], pos_[2], color_[2] )
					if( VISUAL3D2D.MOUSE.pressed && VISUAL3D2D.UIelement[ID].Click !=nil ) then 

						VISUAL3D2D.UIelement[ID].Click()
						VISUAL3D2D.MOUSE.pressed = false
					end
				else
					draw.SimpleText( VISUAL3D2D:GetText(ID), VISUAL3D2D:GetFont(ID), pos_[1], pos_[2], color_[1] )
				end

			elseif( type_ == VISUAL3D2D.TYPES[2] ) then

				color_ = VISUAL3D2D:GetColor( ID )
				pos_ = VISUAL3D2D:GetLocalPos(ID)
				local size_ = VISUAL3D2D:GetSize(ID)
				ishovered = VISUAL3D2D:IsHovering(cur_pos, pos_[1], pos_[2], size_[1] , size_[2])
				if( ishovered ) then 
					draw.RoundedBox( VISUAL3D2D:GetCornerRadius(ID), pos_[1], pos_[2], size_[1] , size_[2], color_[2] )
					if( VISUAL3D2D.MOUSE.pressed  && VISUAL3D2D.UIelement[ID].Click !=nil ) then 
						VISUAL3D2D.UIelement[ID].Click()
						 
						VISUAL3D2D.MOUSE.pressed = false		
							
					end
				else

					draw.RoundedBox( VISUAL3D2D:GetCornerRadius(ID), pos_[1], pos_[2], size_[1] , size_[2], color_[1] )		
							 
				end
	
			end
			
			VISUAL3D2D.DRAWINF[ID] = {
				"Panel[" .. ID.. "]" .. " Type: " .. type_,
				"CurPos: " .. cur_pos.x .. " " .. cur_pos.y ,
				"Size: [" .. size_text[1].. "," .. size_text[2] .. "]" .. "  Ang: [" .. ag[1].. "," .. ag[2] .. "," .. ag[3] .. "]",
				"IsHover: " .. tostring(ishovered)
			} 
			
		cam.End3D2D()
	end
 
end )