
VISUAL3D2D=VISUAL3D2Dor{}
VISUAL3D2D.UIelement={}
VISUAL3D2D.ISDRAW=true
VISUAL3D2D.ISDRAW_information=false
VISUAL3D2D.TYPES={
	"LABEL",
	"PANEL",
	"HTML",
}
VISUAL3D2D.DRAWINF={}
VISUAL3D2D.MOUSE={}

functionVISUAL3D2D:CreateFont(name,si,we)
	we=weor600
	si=sior17
	surface.CreateFont(name,{
		font="Arial",
		extended=false,
		size=si,
		weight=we,
		
	})
end

VISUAL3D2D:CreateFont("ARIAL")
VISUAL3D2D:CreateFont("informa",17,500)

functionVISUAL3D2D:Debug(string,is_err)
	is_err=is_errorfalse
	localcolor=is_errandColor(255,0,0)orColor(70,255,255)
	
	chat.AddText(color,"[VISUAL3D2D]",Color(70,255,255),string)
end
functionVISUAL3D2D:GetCount()
	returntable.Count(self.UIelement)
end
functionVISUAL3D2D:GetType(ID)
	if(notVISUAL3D2D:IsValid(ID))then	return"nil"end	
	returnself.UIelement[ID].TYPE
end
functionVISUAL3D2D:IsValid(ID)
	if(self.UIelement[ID]==nil)thenreturnfalseend

	returnself.UIelement[ID].ISVALID
end
functionVISUAL3D2D:IsType(ID,IDTYPE)
	if(notVISUAL3D2D:IsValid(ID))thenreturnfalseend
	returnself.UIelement[ID].TYPE==self.TYPES[IDTYPE]
end
functionVISUAL3D2D:CreateLabel(ID)
	
	self.UIelement[ID]={
		ISVALID=true,
		TYPE=self.TYPES[1],

		LOCAL_POSITION={0,0},
		GLOABAL_POSITION=LocalPlayer():GetEyeTrace().HitPos+Vector(0,0,25),
		ANG=Angle(0,0,0),
		

		TEXT="<nil>",
		FONT="ARIAL",
		COLOR_TEXT=Color(255,255,255),
		COLOR_TEXT_HOVER=Color(255,255,255),
		Click=nil,
	}
end
functionVISUAL3D2D:CreatePanel(ID)
	
	self.UIelement[ID]={
		ISVALID=true,
		TYPE=self.TYPES[2],

		LOCAL_POSITION={0,0},
		GLOABAL_POSITION=LocalPlayer():GetEyeTrace().HitPos+Vector(0,0,25),
		ANG=Angle(0,0,0),
		SIZE={100,25},

		COLOR=Color(255,255,255),
		COLOR_HOVER=Color(255,255,255),
		Click=nil,
		cornerRadius=0,
	}
end
functionVISUAL3D2D:CreateHtml(ID)
	
	self.UIelement[ID]={
		ISVALID=true,
		TYPE=self.TYPES[3],

		LOCAL_POSITION={0,0},
		GLOABAL_POSITION=LocalPlayer():GetEyeTrace().HitPos+Vector(0,0,25),
		ANG=Angle(0,0,0),
		SIZE={100,25},

		COLOR=Color(255,255,255),
		COLOR_HOVER=Color(255,255,255),	
		BROWSER=nil,
	}
	if(notIsValid(self.UIelement[ID].BROWSER))then

		self.UIelement[ID].BROWSER=vgui.Create("DHTML")
		self.UIelement[ID].BROWSER:SetSize(ScrW(),ScrH())
		self.UIelement[ID].BROWSER:SetMouseInputEnabled(false)
		self.UIelement[ID].BROWSER:SetPaintedManually(true)
		
	end

end
functionVISUAL3D2D:SetText(ID,string)
	if(notVISUAL3D2D:IsValid(ID))then	returnfalseend	
	
	if(notVISUAL3D2D:IsType(ID,1))then	
		VISUAL3D2D:Debug("Нетоттип!",true)	
		return
	end
	self.UIelement[ID].TEXT=string
end
functionVISUAL3D2D:SetLocalPos(ID,x,y)
	if(notVISUAL3D2D:IsValid(ID))then	returnend

	if(VISUAL3D2D:IsType(ID,3))then
		self.UIelement[ID].BROWSER:SetPos(x,y)
		self.UIelement[ID].LOCAL_POSITION={x,y}
		return
	end
	self.UIelement[ID].LOCAL_POSITION={x,y}
end
functionVISUAL3D2D:GetLocalPos(ID)
	if(notVISUAL3D2D:IsValid(ID))then	return{0,0}end
	
	
	
	returnself.UIelement[ID].LOCAL_POSITION
end
functionVISUAL3D2D:SetAngle(ID,x,y,z)
	if(notVISUAL3D2D:IsValid(ID))then	returnfalseend	

	x,y,z=xor0,yor0,zor0
	self.UIelement[ID].ANG=Angle(x,y,z)
end
functionVISUAL3D2D:TraceLineHit()
	localtr=util.TraceLine({
		start=LocalPlayer():EyePos(),
		endpos=LocalPlayer():EyePos()+EyeAngles():Forward()*10000,
		filter=function(ent)
			returntrue
		end
	})	
	iftr.Hitthen
		returntrue
	else
		returnfalse
	end
end
functionVISUAL3D2D:SetCornerRadius(ID,Radius)
	if(notVISUAL3D2D:IsValid(ID))then	returnend		
	if(notVISUAL3D2D:IsType(ID,2))then		
		return
	end
	
	Radius=Radiusor0
	VISUAL3D2D.UIelement[ID].cornerRadius=Radius
end
functionVISUAL3D2D:GetCornerRadius(ID)
	if(notself:IsValid(ID))then	return0end		
	if(notself:IsType(ID,2))then	
	
		return0
	end
	
	returnself.UIelement[ID].cornerRadius
end
functionVISUAL3D2D:GetTextSize(ID,font)
	if(notVISUAL3D2D:IsValid(ID))then	return{0,0}end		
	if(notVISUAL3D2D:IsType(ID,1))then		
		return{0,0}
	end

	surface.SetFont(font)

	localw,h=surface.GetTextSize(VISUAL3D2D:GetText(ID))
	return{w,h}
end
functionVISUAL3D2D:GetSize(ID)
	if(VISUAL3D2D:IsValid(ID))then	

		if(VISUAL3D2D:IsType(ID,1))then	
			
			returnVISUAL3D2D:GetTextSize(ID,VISUAL3D2D:GetFont(ID))

		elseif(VISUAL3D2D:IsType(ID,2))then
		
			returnself.UIelement[ID].SIZE
		elseif(VISUAL3D2D:IsType(ID,3))then
		
			returnself.UIelement[ID].SIZE
		end
	else
		
		return{0,0}
	end	

end
functionVISUAL3D2D:SetSize(ID,w,h)
	if(VISUAL3D2D:IsValid(ID))then	

		if(VISUAL3D2D:IsType(ID,2))then
			
			self.UIelement[ID].SIZE={w,h}
		elseif(VISUAL3D2D:IsType(ID,3))then
			if(self.UIelement[ID].BROWSER==nil)thenreturnend
			self.UIelement[ID].BROWSER:SetSize(w,h)
			self.UIelement[ID].SIZE={w,h}
		end
	end	

end
functionVISUAL3D2D:SetTextColor(ID,color,color_hover)
	if(notVISUAL3D2D:IsValid(ID))then	returnfalseend	

	color=colororColor(255,255,255)
	self.UIelement[ID].COLOR_TEXT=color

	color_hover=color_hoverorColor(255,255,255)
	self.UIelement[ID].COLOR_TEXT_HOVER=color_hover
end
functionVISUAL3D2D:GetTextColor(ID)
	if(notVISUAL3D2D:IsValid(ID))then	returnColor(255,255,255)end	

	return{
		self.UIelement[ID].COLOR_TEXT,
		self.UIelement[ID].COLOR_TEXT_HOVER
	}
end
functionVISUAL3D2D:SetColor(ID,color,color_hover)
	if(notVISUAL3D2D:IsValid(ID))then	returnfalseend	

	color=colororColor(255,255,255)
	self.UIelement[ID].COLOR=color

	color_hover=color_hoverorColor(255,255,255)
	self.UIelement[ID].COLOR_HOVER=color_hover
end
functionVISUAL3D2D:GetColor(ID)
	if(notVISUAL3D2D:IsValid(ID))then	returnColor(255,255,255)end	

	return{
		self.UIelement[ID].COLOR,
		self.UIelement[ID].COLOR_HOVER
	}
end
functionVISUAL3D2D:GetAngle(ID)
	if(notVISUAL3D2D:IsValid(ID))then	returnAngle(0,0,0)end	
	returnself.UIelement[ID].ANG
end
functionVISUAL3D2D:SetGlobalPos(ID,x,y,z)
	if(notVISUAL3D2D:IsValid(ID))then	returnfalseend	
	
	x,y,z=xor0,yor0,zor0
	self.UIelement[ID].GLOABAL_POSITION=Vector(x,y,z)
end
functionVISUAL3D2D:SetGlobalPosVector(ID,vec)
	if(notVISUAL3D2D:IsValid(ID))then	returnfalseend	
	
	vec=vecorVector(0,0,0)
	self.UIelement[ID].GLOABAL_POSITION=vec
end
functionVISUAL3D2D:Click(ID,func)
	if(notVISUAL3D2D:IsValid(ID))then	returnfalseend	
	
	self.UIelement[ID].Click=func
end
functionVISUAL3D2D:GetGlobalPos(ID)
	if(notVISUAL3D2D:IsValid(ID))then	returnVector(0,0,0)end	
	returnself.UIelement[ID].GLOABAL_POSITION
end
functionVISUAL3D2D:GetText(ID)

	if(notVISUAL3D2D:IsValid(ID))then	return"<nil>"end		
	if(notVISUAL3D2D:IsType(ID,1))then		
		return"<nil>"
	end

	returnself.UIelement[ID].TEXTor"<nil>"
end
functionVISUAL3D2D:SetFont(ID,name_font)

	if(notVISUAL3D2D:IsValid(ID))then	returnend		
	if(notVISUAL3D2D:IsType(ID,1))then		
		return
	end
	self.UIelement[ID].FONT=name_font
	
end
functionVISUAL3D2D:GetFont(ID,name_font)

	if(notVISUAL3D2D:IsValid(ID))then	return"ARIAL"end		
	if(notVISUAL3D2D:IsType(ID,1))then		
		return"ARIAL"
	end
	returnself.UIelement[ID].FONT
end
functionVISUAL3D2D:IsHovering(cur_pos,x,y,w,h)
	localc_x,c_y=cur_pos.x,cur_pos.y
	returnc_xandc_yandc_x>=xandc_x<=(x+w)andc_y>=yandc_y<=(y+h)
end
functionVISUAL3D2D:GetCursorPosition(pos,angles,scale)
	localCURPOS={
		x=-1,
		y=-1
	}
	ifnotvgui.CursorVisible()orvgui.IsHoveringWorld()then
		localtr=LocalPlayer():GetEyeTrace()
		localeyepos=tr.StartPos
		localeyenormal

		ifvgui.CursorVisible()andvgui.IsHoveringWorld()then
			eyenormal=gui.ScreenToVector(gui.MousePos())
		else
			eyenormal=tr.Normal
		end

		localplaneNormal=angles:Up()

		localhitPos=util.IntersectRayWithPlane(eyepos,eyenormal,pos,planeNormal)
		ifhitPosthen
			
				localdiff=pos-hitPos

			
				localx=diff:Dot(-angles:Forward())/scale
				localy=diff:Dot(-angles:Right())/scale

				CURPOS.x=x
				CURPOS.y=y
			
		else
			CURPOS.x=-1
			CURPOS.y=-1

			
		end
	else
		CURPOS.x=-1
		CURPOS.y=-1

		
	end

	returnCURPOS
end
functionVISUAL3D2D:SetHTMLcode(ID,code)
	if(notVISUAL3D2D:IsValid(ID))then	returnend		
	if(VISUAL3D2D:IsType(ID,3))then	
		localhtml_=[[<styletype="text/css">body{overflow-y:hidden;overflow-x:hidden;}</style>]]
		self.UIelement[ID].BROWSER:SetHTML(html_..code)		
	end
end
functionVISUAL3D2D:DrawHTMLManual(ID)
	if(notVISUAL3D2D:IsValid(ID))then	returnend		
	if(VISUAL3D2D:IsType(ID,3))then	
		
		self.UIelement[ID].BROWSER:PaintManual()	
	end
end

hook.Add("HUDPaint","VISUAL3D2DHUDPaint",function()
	if(VISUAL3D2D.ISDRAW_information)then
		localcount_=0
		for_,kinpairs(VISUAL3D2D.DRAWINF)do
			localstring=""
			localcount_line=0
			fori,dinpairs(k)do
				
				string=string..d.."\n"
				count_line=count_line+1
			end
			draw.DrawText(string,"informa",10,(count_line*16+10)*_-50,color_white)
		end
		
	end	
end)

hook.Add("Think","VISUAL3D2DKeyRelease",function(ply,key)
localpres=VISUAL3D2D.MOUSE.pressing
	VISUAL3D2D.MOUSE.pressing=(KEY_Eandinput.IsKeyDown(KEY_E))or(MOUSE_LEFTandinput.IsMouseDown(MOUSE_LEFT))
	VISUAL3D2D.MOUSE.pressed=notpresandVISUAL3D2D.MOUSE.pressing	
end)

hook.Remove("PostDrawOpaqueRenderables","VISUAL3D2DPostDraw")
hook.Add("PostDrawOpaqueRenderables","VISUAL3D2DPostDraw",function()
	if(notVISUAL3D2D.ISDRAW)thenreturnend

	

	localscale=0.1
	forID=1,VISUAL3D2D:GetCount()do
		localgp=VISUAL3D2D:GetGlobalPos(ID)
		localag=VISUAL3D2D:GetAngle(ID)
		cam.Start3D2D(gp,ag,scale)

			localcur_pos=VISUAL3D2D:GetCursorPosition(gp,ag,scale)
			localtype_=VISUAL3D2D:GetType(ID)
			localcolor_

			localpos_
			localishovered=false
			localsize_={0,0}
			if(cur_pos.x!=0andcur_pos.y!=0&&VISUAL3D2D.ISDRAW_information)then
				localsize=24
				draw.RoundedBox(0,cur_pos.x-size/2,cur_pos.y,size,1,Color(55,255,255,255))	
				draw.RoundedBox(0,cur_pos.x,cur_pos.y-size/2,1,size,Color(55,255,255,255))	
				
				draw.DrawText("X:"..cur_pos.x.."\nY:"..cur_pos.y,"informa",cur_pos.x+10,cur_pos.y+10,color_white)
			end
			
			

			if(type_==VISUAL3D2D.TYPES[1])then
				color_=VISUAL3D2D:GetTextColor(ID)
				pos_=VISUAL3D2D:GetLocalPos(ID)
				size_=VISUAL3D2D:GetTextSize(ID,VISUAL3D2D:GetFont(ID))

				
				ishovered=VISUAL3D2D:IsHovering(cur_pos,pos_[1],pos_[2],size_[1],size_[2])
				if(ishovered)then
					draw.SimpleText(VISUAL3D2D:GetText(ID),VISUAL3D2D:GetFont(ID),pos_[1],pos_[2],color_[2])
					if(VISUAL3D2D.MOUSE.pressed&&VISUAL3D2D.UIelement[ID].Click!=nil)then

						VISUAL3D2D.UIelement[ID].Click()
						VISUAL3D2D.MOUSE.pressed=false
					end
				else
					draw.SimpleText(VISUAL3D2D:GetText(ID),VISUAL3D2D:GetFont(ID),pos_[1],pos_[2],color_[1])
				end

			elseif(type_==VISUAL3D2D.TYPES[2])then

				color_=VISUAL3D2D:GetColor(ID)
				pos_=VISUAL3D2D:GetLocalPos(ID)
				size_=VISUAL3D2D:GetSize(ID)
				ishovered=VISUAL3D2D:IsHovering(cur_pos,pos_[1],pos_[2],size_[1],size_[2])


				if(ishovered)then
					draw.RoundedBox(VISUAL3D2D:GetCornerRadius(ID),pos_[1],pos_[2],size_[1],size_[2],color_[2])
					if(VISUAL3D2D.MOUSE.pressed&&VISUAL3D2D.UIelement[ID].Click!=nil)then
						VISUAL3D2D.UIelement[ID].Click()
						
						VISUAL3D2D.MOUSE.pressed=false		
							
					end
				else

					draw.RoundedBox(VISUAL3D2D:GetCornerRadius(ID),pos_[1],pos_[2],size_[1],size_[2],color_[1])		
							
				end
			elseif(type_==VISUAL3D2D.TYPES[3])then
				
				VISUAL3D2D:DrawHTMLManual(ID)


				pos_=VISUAL3D2D:GetLocalPos(ID)
				size_=VISUAL3D2D:GetSize(ID)

				ishovered=VISUAL3D2D:IsHovering(cur_pos,pos_[1],pos_[2],size_[1],size_[2])
				if(ishovered)then
					
					if(VISUAL3D2D.MOUSE.pressed&&VISUAL3D2D.UIelement[ID].Click!=nil)then

						VISUAL3D2D.UIelement[ID].Click()
						VISUAL3D2D.MOUSE.pressed=false
					end
				
				end
			end
			
			VISUAL3D2D.DRAWINF[ID]={
				"Panel["..ID.."]".."Type:"..type_,
				"PosPanel:"..pos_[1]..""..pos_[2],
				"Size:["..size_[1]..","..size_[2].."]".."Ang:["..ag[1]..","..ag[2]..","..ag[3].."]",
				"IsHover:"..tostring(ishovered)
			}
			
		cam.End3D2D()
	end	
end)