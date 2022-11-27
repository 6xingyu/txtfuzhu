

function Main0()
SN = gg.choice({
	 " 喜羊羊新版本：点我防闪",
}, nil, "点击防闪自动开启")
if SN==1 then
	 HS2()
end
FX=0
end
function HS2()
	 gg.clearResults()
	 gg.setRanges(262207)
	 gg.searchNumber("842084353", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 jg=gg.getResults(100)
	 sl=gg.getResultCount()
	 if sl>100 then sl=100 end
	 for i = 1, sl do
	 	 dzy=jg[i].address
	 	 gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = 999999999}})
	 end
	 gg.toast("开启成功")
	 gg.clearResults()
end

Main0()


gg.alert("欢迎使用")

j={}
xgz={}
ZY='Main'
gg.toast('❤️欢迎使用喜羊羊刷号❤️')
gg.clearResults()  sj={}  xgz={} gg.toast("欢迎进入")  function search(ss,lx,nc,dz1,dz2)  if ss~=nil then if lx~=nil then  if nc==nil then nc=32 end  gg.setRanges(nc)  if dz1==nil then dz1="-1" end  if dz2==nil then dz1="0" end  gg.searchNumber(ss,lx,false,gg.SIGN_EQUAL,dz1,dz2)  sl=gg.getResultCount()  if sl~=0 then  sj=gg.getResults(sl)  gg.toast("🌨️搜索到 "..sl.." 个结果🌨️")  gg.clearResults()  else  gg.toast("🌩未搜索到结果🌩")  end  else  gg.toast("☁无搜索值类型☁")  end  else  gg.toast("🌜无需搜索值🌛")  end  end  function py1(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value==value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("👻共偏移 "..#sj.." 个数据👻")  else  gg.toast("👀没有搜索数据👀")  end  end  function py2(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value~=value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("🪐️共偏移 "..#sj.." 个数据🪐️")  else  gg.toast("🌞没有搜索数据🌞")  end  end  function xg1(value,lx,py,dj)  if #sj~=nil then  z={}  for i=1,#sj do  z[i]={}  z[i].address=sj[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("👁️共修改 "..#z.." 个数据👁️")  else  gg.toast("🐲没有搜索数据🐲")  end  end  function xg2(bz,value,lx,py,dj)  if #bz~=nil then  z={}  for i=1,#bz do  z[i]={}  z[i].address=bz[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("🌪共修改 "..#z.." 个数据🌪")  else  gg.toast("🌥️没有搜索数据🌥️")  end  end  function bc(bz)  if sj~=nil then  _ENV[bz]=sj  else  gg.toast("☔无数据☔")  end  end 

function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList('^/data/*.so*$')
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == 'w' then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub('^.*/', '')
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
					t = {}
					for _ in pairs(S) do
						if not ti.x64 then
							S[_].value = S[_].value & 0xFFFFFFFF
						end
						t[#t + 1] = {}
						t[#t].address = S[_].value + Offset[i]
						t[#t].flags = _t
					end
				end
			end
			_S = t[#t].address
		end
		return _S
	end
	local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
	return _A
end


function editData(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."开启失败")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."开启成功")else gg.toast(qmnbn.."开启失败")end end end

D=gg.TYPE_DWORD  E=gg.TYPE_DOUBLE  F=gg.TYPE_FLOAT W=gg.TYPE_WORD B=gg.TYPE_BYTE X=gg.TYPE_XOR Q=gg.TYPE_QWORD

function readValue(address, flags) return gg.getValues({{address = address, flags = flags}})[1]["value"]end
function search(ss,lx,nc,dz1,dz2) if ss~=nil then if lx~=nil then  if nc==nil then nc=32 end  gg.setRanges(nc)  if dz1==nil then dz1="-1" end  if dz2==nil then dz1="0" end  gg.searchNumber(ss,lx,false,gg.SIGN_EQUAL,dz1,dz2)  sl=gg.getResultCount()  if sl~=0 then  sj=gg.getResults(sl)  gg.toast("搜索到 "..sl.." 个结果")  gg.clearResults()  else  gg.toast("未搜索到结果")  end  else  gg.toast("无搜索值类型")  end  else  gg.toast("无需搜索值")  end  end  function py1(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value==value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function py2(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value~=value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end
function xg1(value,lx,py,dj) if #sj~=nil then z={} for i=1,#sj do z[i]={} z[i].address=sj[i].address+py z[i].flags=lx if value == nil then value = readValue(z[i].address, lx) end z[i].value= value z[i].freeze = dj and true or false end if dj == true or dj == false then gg.addListItems(z) else gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end
function xg2(bz,value,lx,py,dj)  if #bz~=nil then  z={}  for i=1,#bz do  z[i]={}  z[i].address=bz[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("共修改 "..#z.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function bc(bz)  if sj~=nil then  _ENV[bz]=sj  else  gg.toast("无数据")  end  end  

function split(szFullString, szSeparator)   local nFindStartIndex = 1   local nSplitIndex = 1   local nSplitArray = {}   while true do   local nFindLastIndex = string.find  (szFullString, szSeparator, nFindStartIndex)   if not nFindLastIndex then   nSplitArray[nSplitIndex] =   string.sub(szFullString, nFindStartIndex, string.len  (szFullString))   break end   nSplitArray[nSplitIndex] = string.sub  (szFullString, nFindStartIndex, nFindLastIndex - 1)   nFindStartIndex = nFindLastIndex + string.len  (szSeparator)   nSplitIndex = nSplitIndex + 1 end return   nSplitArray end   function xgxc(szpy, qmxg)   for x = 1, #(qmxg) do   xgpy = szpy + qmxg[x]["offset"]   xglx = qmxg[x]["type"]   xgsz = qmxg[x]["value"]   xgdj = qmxg[x]["freeze"]   if xgdj == nil or xgdj == "" then   gg.setValues({[1]   = {address = xgpy, flags = xglx, value = xgsz}})   else   gg.addListItems({[1]   = {address = xgpy, flags = xglx,   freeze = xgdj, value = xgsz}}) end   xgsl = xgsl + 1 xgjg = true end end   function xqmnb(qmnb)   gg.clearResults()   gg.setRanges(qmnb[1]["memory"])   gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])  gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else           sl = gg.getResults(999999)   sz = gg.getResultCount()           xgsl = 0 if sz > 999999 then   sz = 999999 end for i = 1, sz do   pdsz = true for v = 4, #(qmnb) do if   pdsz == true then   pysz = {} pysz[1]   = {} pysz[1].address   = sl[i].address + qmnb[v]["offset"] pysz[1].flags   = qmnb[v]["type"]   szpy = gg.getValues(pysz)   pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd   = split(pdpd, ";") tzszpd   = szpd[1] pyszpd = szpd[2]   if tzszpd == pyszpd then   pdjg = true pdsz = true else   pdjg = false pdsz = false end end end if   pdjg == true then szpy   = sl[i].address xgxc(szpy, qmxg) end end   if xgjg == true then   gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据")   else   gg.toast(qmnb[2]["name"] .. "开启失败")   end   end   end   end 

function Fs3Fs4(Fs1, Fs2, Fs3, Fs4, Fs5) gg.clearResults() gg.setRanges(Fs2) gg.setVisible(false) gg.searchNumber(Fs3[1][1], Fs3[1][3]) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Fs3[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Fs3 do local tmp = {} local offset = Fs3[k][2] - base local num = Fs3[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = Fs3[k][3] end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast(Fs1..'\n搜索到{'..#data..'}条数据') local t = {} local base = Fs3[1][2] if Fs5 == '' and Fs5 > 0 and Fs5 < #data then Fs5 = Fs5 else Fs5 = #data end for i=1, Fs5 do for k, w in ipairs(Fs4) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = w[3] t[#t].value = w[1] if (w[4] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast(Fs1..'️\n已修改{'..#t..'}条数据') else gg.toast(Fs1..'\n数据搜索失败', false) return false end else gg.toast(Fs1..'\n数据修改失败', false) return false end end
function search(ss,lx,nc,dz1,dz2) if ss~=nil then if lx~=nil then if nc==nil then nc=32 end gg.setRanges(nc) if dz1==nil then dz1="-1" end if dz2==nil then dz1="0" end gg.searchNumber(ss,lx,false,536870912,dz1,dz2) sl=gg.getResultCount() if sl~=0 then sj=gg.getResults(sl) gg.toast("搜索到 "..sl.." 个结果") gg.clearResults() else gg.toast("未搜索到结果") end else gg.toast("无搜索值类型") end else gg.toast("无需搜索值") end end function py1(value,lx,py) if #sj~=nil then z1={} z2={} for i=1,#sj do z1[i]={} z1[i].address=sj[i].address+py z1[i].flags=lx end z1=gg.getValues(z1) for i=1,#sj do if z1[i].value==value then z2[#z2+1]={} z2[#z2]=sj[i] end end sj=z2 z1={} z2={} gg.toast("共偏移 "..#sj.." 个数据") else gg.toast("没有搜索数据") end end function py2(value,lx,py) if #sj~=nil then z1={} z2={} for i=1,#sj do z1[i]={} z1[i].address=sj[i].address+py z1[i].flags=lx end z1=gg.getValues(z1) for i=1,#sj do if z1[i].value~=value then z2[#z2+1]={} z2[#z2]=sj[i] end end sj=z2 z1={} z2={} gg.toast("共偏移 "..#sj.." 个数据") else gg.toast("没有搜索数据") end end 
function xg1(value,lx,py,dj) if #sj~=nil then z={} for i=1,#sj do z[i]={} z[i].address=sj[i].address+py z[i].flags=lx z[i].value=value if dj==true then z[i].freeze=true end end if dj==true then gg.addListItems(z) else gg.clearList() gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end 
function xg2(bz,value,lx,py,dj) if #bz~=nil then z={} for i=1,#bz do z[i]={} z[i].address=bz[i].address+py z[i].flags=lx z[i].value=value if dj==true then z[i].freeze=true end end if dj==true then gg.addListItems(z) else gg.clearList() gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end function bc(bz) if sj~=nil then _ENV[bz]=sj else gg.toast("无数据") end end function BaAdd(add) t=gg.getValues({[1]={address=add,flags=4}}) return t[1].value&0xFFFFFFFF end function set(dz,xg,lx,dj) if dj=="true" then gg.addListItems({{address=dz,flags=lx,value=xg,freeze=true}}) else gg.setValues({{address=dz,flags=lx,value=xg}}) end gg.toast("修改成功") end
--!!!以上为偏移配置 不懂勿动!!!

--林哥
function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList("^/data/*.so*$")
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == "w" then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub("^.*/", "")
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
					t = {}
					for _ in pairs(S) do
						if not ti.x64 then
							S[_].value = S[_].value & 0xFFFFFFFF
						end
						t[#t + 1] = {}
						t[#t].address = S[_].value + Offset[i]
						t[#t].flags = _t
					end
				end
			end
			_S = t[#t].address
		end
		return _S
	end
	local _A = string.format("0x%X", Get_Address(t_So, t_Offset, _bit))
	return _A
end
function search(ss,lx,nc,dz1,dz2) if ss~=nil then if lx~=nil then if nc==nil then nc=32 end gg.setRanges(nc) if dz1==nil then dz1="-1" end if dz2==nil then dz1="0" end gg.searchNumber(ss,lx,false,536870912,dz1,dz2) sl=gg.getResultCount() if sl~=0 then sj=gg.getResults(sl) gg.toast("搜索到 "..sl.." 个结果") gg.clearResults() else gg.toast("未搜索到结果") end else gg.toast("无搜索值类型") end else gg.toast("无需搜索值") end end function py1(value,lx,py) if #sj~=nil then z1={} z2={} for i=1,#sj do z1[i]={} z1[i].address=sj[i].address+py z1[i].flags=lx end z1=gg.getValues(z1) for i=1,#sj do if z1[i].value==value then z2[#z2+1]={} z2[#z2]=sj[i] end end sj=z2 z1={} z2={} gg.toast("共偏移 "..#sj.." 个数据") else gg.toast("没有搜索数据") end end function py2(value,lx,py) if #sj~=nil then z1={} z2={} for i=1,#sj do z1[i]={} z1[i].address=sj[i].address+py z1[i].flags=lx end z1=gg.getValues(z1) for i=1,#sj do if z1[i].value~=value then z2[#z2+1]={} z2[#z2]=sj[i] end end sj=z2 z1={} z2={} gg.toast("共偏移 "..#sj.." 个数据") else gg.toast("没有搜索数据") end end 
function xg1(value,lx,py,dj) if #sj~=nil then z={} for i=1,#sj do z[i]={} z[i].address=sj[i].address+py z[i].flags=lx z[i].value=value if dj==true then z[i].freeze=true end end if dj==true then gg.addListItems(z) else gg.clearList() gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end 
function xg2(bz,value,lx,py,dj) if #bz~=nil then z={} for i=1,#bz do z[i]={} z[i].address=bz[i].address+py z[i].flags=lx z[i].value=value if dj==true then z[i].freeze=true end end if dj==true then gg.addListItems(z) else gg.clearList() gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end function bc(bz) if sj~=nil then _ENV[bz]=sj else gg.toast("无数据") end end function BaAdd(add) t=gg.getValues({[1]={address=add,flags=4}}) return t[1].value&0xFFFFFFFF end function set(dz,xg,lx,dj) if dj=="true" then gg.addListItems({{address=dz,flags=lx,value=xg,freeze=true}}) else gg.setValues({{address=dz,flags=lx,value=xg}}) end gg.toast("修改成功") end






function Main()
sk=gg.prompt(

{
"金币（❤️新版本修复❤️）"
,"钥匙（❤️修复❤️）"
,"等级(❤️已修复❤️)"
,"付费皮肤（❤️已修复❤️）"
,"人物显示666金币（❤️修复版本❤️）"
,"背饰显示0金币(❤️无修复❤️)"
,"滑板显示1金币(❤️修复❤️)"
,"炫跑卡等级(❤️已修复❤️)"
,"头像框（❤️已修复❤️）"
,"双倍金币(❤️已修复❤️)"
,"旧头像框一键解锁(❤️已修复❤️)"
,"滑板一键全拥有(❤️修复❤️)"
,"人物一键全拥有(❤️不能保存只能自慰❤️)"
,"宝物钥匙一万(❤️已修复❤️)"
,"抽宝物替换\n宝物代码:\n1.面具\n2.骷髅耳环\n3.花球\n4.发条\n5.纹章\n6.星星项链\n7.机器手表\n8.金色耳环\n9.黄冠\n10.头盔\n11.狼牙项链\n12.纯金手表\n13.金箍\n14.乾坤圈\n15.水手瞄\n16.积木\n17.灵符\n18.铠甲\n19.令牌\n20.龙蛋\n21.南瓜\n22.月兔\n23.武狮头\n24.手链\n25.圣诞帽\n26.夹克\n27.红色战衣\n28.灯笼\n29.折扇\n30.卫衣\n31.校服\n32.相机\n33.耳机\n34.眼镜"
,"宝物商城替换物品序号\n1钥匙 2滑板数量 3-4得分喷射\n9头像框 10人物 12滑板 21宝物"
,"宝物商城替换物品代码"
,"购买方式改负数"
,"自定倍速代刷效率[改1恢复]建议改到20以下，不然游戏崩溃"
,"结束脚本"
},

{},




{
[1]="number",
[2]="number",
[3]="number",
[4]="checkbox",
[5]="checkbox",
[6]="checkbox",
[7]="checkbox",
[8]="number",
[9]="number",
[10]="checkbox",
[11]="checkbox",
[12]="checkbox",
[13]="checkbox",
[14]="checkbox",
[15]="number",
[16]="number",
[17]="number",
[18]="checkbox",
[19]="number",
[20]="checkbox",
}



)

if sk==nil then Main() end
if sk[1]~="" then a1()  else end
if sk[2]~="" then a2() else end
if sk[3]~="" then a3() else end
if sk[4]==true then a4() else end
if sk[5]==true then a5() else end
if sk[6]==true then a6() else end
if sk[7]==true then a7() else end
if sk[8]~="" then a8() else end
if sk[9]~="" then a9() else end
if sk[10]==true then a10() else end
if sk[11]==true then a11() else end
if sk[12]==true then a12() else end
if sk[13]==true then a13() else end
if sk[14]==true then a14() else end
if sk[15]~="" then a15() else end
if sk[16]~="" then a16()  else end
if sk[17]~="" then a17()  else end
if sk[18]==true then a18() else end
if sk[19]~="" then a19()  else end
if sk[20]== true then 
os.exit(print("林哥QQ3221404926")) end
end







function a1()
time=os.clock()
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x520, 0x13C, 0x40, 0x54}
local ttt = S_Pointer(t, tt)
gg.setValues({{address = ttt+0x14, flags = 4, value = 0}})
gg.setValues({{address = ttt+0x8, flags = 4, value = 0}})
gg.setValues({{address = ttt+0x4, flags = 4, value = sk[1]}})
local time=string.sub(os.clock()-time,0,5)
gg.toast("金币开启成功本次耗时"..time.."秒")
end



function a2()
search(2344,4,32)
py1(1,4,-0x4)
py1(1,4,0x4)
xg1(0,4,-0x7D0)
xg1(0,4,-0x7dc)
xg1(sk[2],4,-0x7E0)
end






function a3()
search(2344,4,32)
py1(1,4,-0x4)
py1(1,4,0x4)
xg1(sk[3],4,-0x6FC)
end

function a4()
search(2852,4,32)
py1(1,4,-0x38)
py1(1,4,-0x30)
xg1(2,4,-0x18)
search(3184,4,32)
py1(1,4,-0x30)
py1(1,4,-0x38)
xg1(2,4,-0x18)
search(3238,4,32)
py1(1,4,-0x30)
py1(1,4,-0x38)
xg1(2,4,-0x18)
search(2542,4,32)
py1(1,4,-0x2C)
py1(1,4,-0x34)
xg1(2,4,-0x14)
end




function a5()
time=os.clock()
local skk = {"libil2cpp.so:bss", "Cb"}
local skkk1 ={0x2c24,0x5C,0x1a0,0xb4,0x44}
local rwdz1 = S_Pointer(skk, skkk1)
time=os.clock()
for i = 1 , 200 do 
gg.setValues({{address = rwdz1+0x98+i*0xA0, flags = 4, value = 0}})
gg.setValues({{address = rwdz1+0x8c+i*0xA0, flags = 4, value = 0}})
gg.setValues({{address = rwdz1+0x88+i*0xA0, flags = 4, value = 666}})
gg.setValues({{address = rwdz1+0+i*0xA0, flags = 4, value = 2}})
gg.setValues({{address = rwdz1+0xb8+i*0xA0, flags = 4, value = 0}})
gg.setValues({{address = rwdz1+0x98, flags = 4, value = 0}})
gg.setValues({{address = rwdz1+0x8c, flags = 4, value = 0}})
gg.setValues({{address = rwdz1+0x88, flags = 4, value = 100}})
gg.setValues({{address = rwdz1+0xA0, flags = 4, value = 3}})
gg.setValues({{address = rwdz1+0xb8, flags = 4, value = 0}})
end
local time=string.sub(os.clock()-time,0,5)
gg.toast("全人物显示金币开启成功本次耗时"..time.."秒")
end


function a6()
time=os.clock()
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0xDED0, 0x8C, 0x100, 0xB4, 0x20}
local ttt = S_Pointer(t, tt)
gg.setValues({{address = ttt+0x114, flags = 4,value=0}})
gg.setValues({{address = ttt+0x154, flags = 4,value=0}})
gg.setValues({{address = ttt+0x1D4, flags = 4,value=0}})
gg.setValues({{address = ttt+0x294, flags = 4,value=0}})
gg.setValues({{address = ttt+0x2D4, flags = 4,value=0}})
gg.setValues({{address = ttt+0x314, flags = 4,value=0}})
gg.setValues({{address = ttt+0x354, flags = 4,value=0}})
gg.setValues({{address = ttt+0x394, flags = 4,value=0}})
gg.setValues({{address = ttt+0x3D4, flags = 4,value=0}})
gg.setValues({{address = ttt+0x8, flags = 4,value=0}})
gg.setValues({{address = ttt+0x48, flags = 4,value=0}})
gg.setValues({{address = ttt+0x88, flags = 4,value=0}})
gg.setValues({{address = ttt+0xC8, flags = 4,value=0}})
gg.setValues({{address = ttt+0x108, flags = 4,value=0}})
gg.setValues({{address = ttt+0x148, flags = 4,value=0}})
gg.setValues({{address = ttt+0x188, flags = 4,value=0}})
gg.setValues({{address = ttt+0x1C8, flags = 4,value=0}})
gg.setValues({{address = ttt+0x208, flags = 4,value=0}})
gg.setValues({{address = ttt+0x248, flags = 4,value=0}})
gg.setValues({{address = ttt+0x288, flags = 4,value=0}})
gg.setValues({{address = ttt+0x2C8, flags = 4,value=0}})
gg.setValues({{address = ttt+0x308, flags = 4,value=0}})
gg.setValues({{address = ttt+0x348, flags = 4,value=0}})
gg.setValues({{address = ttt+0x388, flags = 4,value=0}})
gg.setValues({{address = ttt+0x3C8, flags = 4,value=0}})
gg.setValues({{address = ttt+0xC, flags = 4,value=1}})
gg.setValues({{address = ttt+0x4C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x8C, flags = 4,value=1}})
gg.setValues({{address = ttt+0xCC, flags = 4,value=1}})
gg.setValues({{address = ttt+0x10C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x14C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x18C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x1CC, flags = 4,value=1}})
gg.setValues({{address = ttt+0x20C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x24C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x28C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x2CC, flags = 4,value=1}})
gg.setValues({{address = ttt+0x30C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x34C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x38C, flags = 4,value=1}})
gg.setValues({{address = ttt+0x3CC, flags = 4,value=1}})
local time=string.sub(os.clock()-time,0,5)
gg.toast("全背饰显示金币开启成功本次耗时"..time.."秒")
end



function a7()
local skk = {"libil2cpp.so:bss", "Cb"}
local skkk1 ={0x2C38,0x5C,0x58,0xC,0x50}
local hbdz1 = S_Pointer(skk, skkk1)
time=os.clock()
for i = 1 , 200 do 
gg.setValues({{address = hbdz1+0x70+i*0x88, flags = 4, value = 0}})
gg.setValues({{address = hbdz1+0x64+i*0x88, flags = 4, value = 0}})
gg.setValues({{address = hbdz1+0x60+i*0x88, flags = 4, value = 1}})
gg.setValues({{address = hbdz1+0+i*0x88, flags = 4, value = 2}})
gg.setValues({{address = hbdz1+0x9c+i*0x88, flags = 4, value = 0}})
end
local time=string.sub(os.clock()-time,0,5)
gg.toast("全滑板显示金币开启成功本次耗时"..time.."秒")
end


function a8()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(0,4,0x5C)
xg1(0,4,0x50)
xg1(sk[8],4,0x4C)
end


function a9()
time=os.clock()
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0xD064, 0x624, 0x70, 0x6BC}
local ttt = S_Pointer(t, tt)
gg.setValues({{address = ttt, flags = 4, value =sk[9]}})
local time=string.sub(os.clock()-time,0,5)
gg.toast("头像框开启成功本次耗时"..time.."秒")
end


function a10()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(65537,4,-0x414)
end


function a11()
search(2344,4,32)
py1(1,4,-0x4)
py1(1,4,0x4)
xg1(-1,4,-0x198)
xg1(-1,4,-0x19C)
xg1(-1,4,-0x1A0)
xg1(-1,4,-0x1A4)
end

function a12()
local skk = {"libil2cpp.so:bss", "Cb"}
local skkk1 ={0x2C38,0x5C,0x58,0xC,0x50}
local hbdz1 = S_Pointer(skk, skkk1)
time=os.clock()
for i = 1 , 200 do 
gg.setValues({{address = hbdz1+0+i*0x88, flags = 4, value = 0}})
end
local time=string.sub(os.clock()-time,0,5)
gg.toast("全滑板拥有开启成功本次耗时"..time.."秒")
end

function a13()
local skk = {"libil2cpp.so:bss", "Cb"}
local skkk1 ={0x2c24,0x5C,0x1a0,0xb4,0x44}
local rwdz1 = S_Pointer(skk, skkk1)
time=os.clock()
for i = 1 , 200 do 
gg.setValues({{address = rwdz1+0+i*0xA0, flags = 4, value = 0}})
end
local time=string.sub(os.clock()-time,0,5)
gg.toast("全滑人物拥有开启成功本次耗时"..time.."秒")
end

function a14()
search(2344,4,32)
py1(1,4,-0x4)
py1(1,4,0x4)
xg1(0,4,0xc4)
xg1(0,4,0xb8)
xg1(10000,4,0xb4)
end



function a15()
search(21,4,32)
py1(1,4,0x4)
py1(1,4,-0x4)
py1(1,4,0x24)
py1(1,4,0x2C)
py1(1,4,0x44)
py1(1,4,0x3C)
py1(1,4,0x54)
py1(1,4,0x5C)
xg1(0,4,0x18)
xg1(0,4,0xC)
xg1(0,4,0x70)
xg1(0,4,0x64)
xg1(1000,4,0x8)
xg1(sk[15],4,0x60)
end


function a16()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(0,4,-0x10)
xg1(0,4,-0x1c)
xg1(sk[16],4,-0x20)
end

function a17()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(0,4,0x5c)
xg1(0,4,0x50)
xg1(sk[17],4,0x4c)
xg1(0,4,0x4)
xg1(0,4,-0x8)
xg1(sk[17],4,-0xc)
xg1(0,4,0x30)
xg1(0,4,0x24)
xg1(sk[17],4,0x20)
xg1(0,4,0x18)
xg1(0,4,0xc)
xg1(sk[17],4,0x8)
end

function a18()
search(120,4,32)
py1(1,4,0x24)
py1(1,4,0x2C)
xg1(0,4,0x2C)
xg1(0,4,0x20)
xg1(-1,4,0x1C)
end

function a19()
local t = {"libunity.so:bss", "Cb"}
local tt = {0x3CA8C,0xEC}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt, flags = 16, value = sk[19], freeze = true}})
end

while(true) do
if gg.isVisible(true) then
gg.setVisible(false)
Main()
end end