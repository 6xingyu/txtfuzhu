j={}
xgz={}
ZY='Main'
gg.toast('๐ๅ็พ็พ่พๅฉ๐')
gg.clearResults()  sj={}  xgz={} gg.toast("๐ๆฌข่ฟ่ฟๅฅ๐")  function search(ss,lx,nc,dz1,dz2)  if ss~=nil then if lx~=nil then  if nc==nil then nc=32 end  gg.setRanges(nc)  if dz1==nil then dz1="-1" end  if dz2==nil then dz1="0" end  gg.searchNumber(ss,lx,false,gg.SIGN_EQUAL,dz1,dz2)  sl=gg.getResultCount()  if sl~=0 then  sj=gg.getResults(sl)  gg.toast("๐ๆ็ดขๅฐ "..sl.." ไธช็ปๆ๐")  gg.clearResults()  else  gg.toast("๐ๆชๆ็ดขๅฐ็ปๆ๐")  end  else  gg.toast("๐ๆ ๆ็ดขๅผ็ฑปๅ๐")  end  else  gg.toast("๐ๆ ้ๆ็ดขๅผ๐")  end  end  function py1(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value==value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("๐ๅฑๅ็งป "..#sj.." ไธชๆฐๆฎ๐")  else  gg.toast("๐ๆฒกๆๆ็ดขๆฐๆฎ๐")  end  end  function py2(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value~=value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("๐ๅฑๅ็งป "..#sj.." ไธชๆฐๆฎ๐")  else  gg.toast("๐ๆฒกๆๆ็ดขๆฐๆฎ๐")  end  end  function xg1(value,lx,py,dj)  if #sj~=nil then  z={}  for i=1,#sj do  z[i]={}  z[i].address=sj[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("๐ๅฑไฟฎๆน "..#z.." ไธชๆฐๆฎ๐")  else  gg.toast("๐ๆฒกๆๆ็ดขๆฐๆฎ๐")  end  end  function xg2(bz,value,lx,py,dj)  if #bz~=nil then  z={}  for i=1,#bz do  z[i]={}  z[i].address=bz[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("๐ๅฑไฟฎๆน "..#z.." ไธชๆฐๆฎ๐")  else  gg.toast("๐ๆฒกๆๆ็ดขๆฐๆฎ๐")  end  end  function bc(bz)  if sj~=nil then  _ENV[bz]=sj  else  gg.toast("๐ๆ ๆฐๆฎ๐")  end  end 


function Fs3Fs4(Fs1, Fs2, Fs3, Fs4, Fs5) gg.clearResults() gg.setRanges(Fs2) gg.setVisible(false) gg.searchNumber(Fs3[1][1], Fs3[1][3]) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Fs3[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Fs3 do local tmp = {} local offset = Fs3[k][2] - base local num = Fs3[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = Fs3[k][3] end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast(Fs1..'\nๆ็ดขๅฐ{'..#data..'}ๆกๆฐๆฎ') local t = {} local base = Fs3[1][2] if Fs5 == '' and Fs5 > 0 and Fs5 < #data then Fs5 = Fs5 else Fs5 = #data end for i=1, Fs5 do for k, w in ipairs(Fs4) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = w[3] t[#t].value = w[1] if (w[4] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast(Fs1..'๏ธ\nๅทฒไฟฎๆน{'..#t..'}ๆกๆฐๆฎ') else gg.toast(Fs1..'\nๆฐๆฎๆ็ดขๅคฑ่ดฅ', false) return false end else gg.toast(Fs1..'\nๆฐๆฎไฟฎๆนๅคฑ่ดฅ', false) return false end end


function Main()
if jishuqi==0 then
zyxfs()
else
ZY='Main'
NB = gg.choice({
  "๐ๅๅผ้ฒ้ช๐",
  "๐่ดง็ฉๅบ๐",
  "๐ๅจๅทๅบ๐",
  "๐ๅฎ็ฉๅทๅ๐",
  "๐็ญ็บง่ทๅก๐",
  "๐ๅ่ฝๅบ๐",
  "๐้ๅบ่ๆฌ๐๏ธ",
 }, nil,os.date "๐ๅฐๅผๆๅค็ปฟ่ฒๆธธๆ๐\n๐ๆ่ฐขไฝ ไปฌๅฏนๅ็พ็พ็ๅๆฌข๐\n๐ๅๅผ้ฒ้ชๅๅผๅ่ฝ๐\n๐ๅ็พ็พๅฎๆน็พค711643748๐\n๐ๆ็ปไบๆนๅๅ๐")
if NB == 1 then a() end
if NB == 2 then hb() end
if NB == 3 then pf() end
if NB == 4 then bw() end
if NB == 5 then pk() end
if NB == 6 then sbxzs() end
if NB == 7 then tc() end
end
end

function sbxzs()
FsZY4 = gg.choice({
'๐ๅข็ๆ ้ๆถ้ด๐',
'๐้ฃ่กๆ ้ๆถ้ด๐',
'๐่ฝ้ๆปๆฟ๐',
'๐ๆ ๅฐฝ็ๅ๐',
'๐่ฟๅไธป้กต๐',
}, nil, 'ๅฏไธๆฆ,ๆณจๆ:ๅฏ่ฝไผๅ ๆๆบๆง่ฝ้ฎ้ข่ๅก้กฟ!')
if FsZY4==1 then FsBuff() end
if FsZY4==2 then FsWxfly() end
if FsZY4==3 then yll() end
if FsZY4==4 then baofenmain() end
if FsZY4==5 then FsRmZY() end
XGCK = -1 end

function FsBuff()
local Fs1 = '[ๅข็]ๆ ้ๆถ้ฟ'
local Fs2 = 32
local Fs3 = {{7, 0, 4},{10.0, 4, 16},{11.5, 8, 16},{19.0, 20, 16},{24.0, 24, 16},}
local Fs4 = {{100000000, 28, 16, false},}
Fs3Fs4(Fs1, Fs2, Fs3, Fs4, Fs5)
end

function FsWxfly()
local Fs1 = '[้ฃ่ก]ๆ ้ๆถ้ฟ'
local Fs2 = 32
local Fs3 = {{7, 0, 4},{8.0, 4, 16},{9.0, 8, 16},{10.5, 12, 16},{12.5, 16, 16},{15.0, 20, 16},{19.0, 24, 16},}
local Fs4 = {{198, 28, 16, false},}
Fs3Fs4(Fs1, Fs2, Fs3, Fs4, Fs5)
end

function yll()
search(1300,16)
py1(1000,16,24)  
py1(300,16,72)
xg1(1.27786509e-39,16,56,true)
xg1(1023202.6875,16,60,true)
xg1(1000000,16,72,true)
gg.toast('ๅผๅฏๆๅไบๅ')
end

function FsRmZY()
Main()
end
function baofenmain()
local a=gg.choice({'ๅผๅฏๅ่ฝ(ๅฑๅๅผๅฏ๏ผ','ๅณ้ญๅ่ฝ(็ป็ฎๅไฝฟ็จ)'},nil,os.date'ๆณ่ฆไฟๅญๅๆฐ๏ผ่ฆๅณ้ญไนๅๅ็ป็ฎ๏ผ๏ผ๏ผ')
if a ==2 then 
baofenexit()
end
if a ==1 then 
baofen()
end
end

function zyxfs()
jishuqi=2
gg.clearResults()
gg.setRanges(16)
gg.searchNumber('1094268983',4)
local k=gg.getResults(1)
gg.addListItems({{address=k[1].address-0x8,flags=4,value=-1,freeze=true}})
Main()
end

function baofen()
gg.ss=gg.searchNumber
gg.clearResults()
gg.clearList()
gg.setRanges(4)
gg.ss('0.01999999955F;50.0F;0.99999988079F;1.0F;0.33333334327F;0.02999999933F',16)
gg.ss('1.0',16)
local B=gg.getResults(1)
gg.addListItems({{address=B[1].address,flags=16,value=-9999,freeze=true}})
end

function baofenexit()
local B=gg.getResults(1)
gg.addListItems({{address=B[1].address,flags=16,value=1,freeze=false}})
gg.clearResults()
gg.clearList()
end

function a()
	 gg.clearResults()
	 gg.setRanges(16)
	 gg.searchNumber("842084353", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("842084353", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 jg=gg.getResults(100)
	 sl=gg.getResultCount()
	 for i = 1, sl do
	 	 dzy=jg[i].address
	 	 gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = -1}})
	 end
	 gg.toast("้พๅ้ฒ้ชๆๅ")
	 gg.clearResults()
end

function tc()
print(os.date"๐้ๅบๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ๅ็พ็พ่พๅฉ๐")
os.exit()
end

function hb()
ZY='hb'
  QW = gg.choice({
  "๐้ๅธไฟฎๆน๐",
  "๐้ฅๅไฟฎๆน๐",
  "๐ๅฎ็ฉ้ฅๅ๐",
  "๐่ฟๅไธ้กต๐",
 }, nil,os.date "๐ๅไบฌๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ๅ็พ็พ่พๅฉ๐")
 if QW == 1 then jb() end
 if QW == 2 then yc() end
 if QW == 3 then fc() end
 if QW == 4 then hb1() end
end

function jb()
search(65536,4,32)
py1(1,4,0xC)
py1(1,4,0x20)
xg1(0,4,0x14,true)
xg1(0,4,0x8,true)
xg1(gg.prompt({'๐ๆจ่3ๅไธ๐'}, {[1] = '30000000'}, {[1] = 'number'})[1],4,0x4,true)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ่ฏทๆๆธธๆๅๅฐๅๆ๐')
end
function yc()
search(65536,4,32)
py1(1,4,0x20)
py1(1,4,0x34)
xg1(0,4,0x28,true)
xg1(0,4,0x1C,true)
xg1(gg.prompt({'๐้ฅๅ๐็ฐๅจๅฎนๆๅฐๅท๐\n๐ๆนๅฎ่ฏท็ดๆฅๅๆๅๅฐ๐'}, {[1] = '10000'}, {[1] = 'number'})[1],4,0x18,true)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ่ฏทๆๆธธๆๅๅฐๅๆ๐')
end

function fc()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(0,4,0x1BC,true)
xg1(0,4,0x1C8,true)
xg1(gg.prompt({'๐ๆจ่1000้ฅๅ๐๐'}, {[1] = '1000'}, {[1] = 'number'})[1],4,0x1B8,true)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ๐')
end

function hb1()
Main()
end

function pf()
ZY='pf'
  PF = gg.choice({
  "๐ไบบ็ฉไธ้ฎ๐",
  "๐ๆปๆฟไธ้ฎ๐",
  "๐่้ฅฐไธ้ฎ๐",
  "๐ไป่ดน็ฎ่ค๐",
  "๐่ฟๅไธ้กต๐",
 }, nil,os.date "๐ๅไบฌๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ๅ็พ็พ๐")

if PF == 1 then rw() end
if PF == 2 then hua() end
if PF == 3 then bs() end
if PF == 4 then fp() end
if PF == 5 then pf1() end
end

function rw()
search(1188,4,32)
py1(366,4,0x68)
py1(200,4,-0x20)
xg1(0,4,0x4)
xg1(0,4,0x784)
xg1(0,4,0x964)
xg1(0,4,0xA04)
xg1(0,4,0xAA4)
xg1(0,4,0xB44)
xg1(0,4,0xBE4)
xg1(0,4,0xC84)
xg1(0,4,0xD24)
xg1(0,4,0xDC4)
xg1(0,4,0xE64)
xg1(0,4,0xF04)
xg1(0,4,0xFA4)
xg1(0,4,0x1044)
xg1(0,4,0x1184)
xg1(0,4,0x1224)
xg1(0,4,0x12C4)
xg1(0,4,0x1364)
xg1(0,4,0x1404)
xg1(0,4,0x14A4)
xg1(0,4,0x1544)
xg1(0,4,0x15E4)
xg1(0,4,0x1684)
xg1(0,4,0x1724)
xg1(0,4,0x17C4)
xg1(0,4,0x1864)
xg1(0,4,0x1904)
xg1(0,4,0x19A4)
xg1(0,4,0x1A44)
xg1(0,4,0x1AE4)
xg1(0,4,0x1B84)
xg1(0,4,0x1C24)
xg1(0,4,0x1D64)
xg1(0,4,0x1E04)
xg1(0,4,0x1EA4)
xg1(0,4,0x1F44)
xg1(0,4,0x1FE4)
xg1(0,4,0x2084)
xg1(0,4,0x2124)
xg1(0,4,0x21C4)
xg1(0,4,0x2264)
xg1(0,4,0x2304)
xg1(0,4,0x23A4)
xg1(0,4,0x2444)
xg1(0,4,0x24E4)
xg1(0,4,0x2584)
xg1(0,4,0x2624)
xg1(0,4,0x26C4)
xg1(0,4,0x2764)
xg1(0,4,0x2804)
xg1(0,4,0x4B04)
xg1(0,4,0x4BA4)
xg1(0,4,0x4C44)
xg1(0,4,0x4CE4)
xg1(0,4,0x4D84)
xg1(0,4,0x4E24)
xg1(0,4,0x4EC4)
xg1(0,4,0x4F64)
xg1(0,4,0x5004)
xg1(0,4,0x6684)
xg1(0,4,0x6724)--ๅตๅ้ๆพ็คบ
search(2522,4,32)
py1(95000,4,0x18)
py1(2523,4,0x38)
xg1(0,4,0x3C)
xg1(0,4,0xDC)
xg1(0,4,0x17C)
xg1(0,4,0x21C)
xg1(0,4,0x2BC)
xg1(0,4,0x35C)
xg1(0,4,0x3FC)
xg1(0,4,0x49C)
xg1(0,4,0x53C)
xg1(0,4,0x5DC)
xg1(0,4,0x67C)
xg1(0,4,0x71C)
xg1(0,4,0x7BC)
xg1(0,4,0x85C)
xg1(0,4,0x8FC)
xg1(0,4,0x99C)
xg1(0,4,0xA3C)
xg1(0,4,0xADC)
xg1(0,4,0xB7C)
xg1(0,4,0xC1C)
xg1(0,4,0xD5C)
xg1(0,4,0xDFC)
xg1(0,4,0xE9C)
xg1(0,4,0xF3C)
xg1(0,4,0xFDC)
xg1(0,4,0x111C)
xg1(0,4,0x11BC)
xg1(0,4,0x125C)
xg1(0,4,0x12FC)
xg1(0,4,0x139C)
xg1(0,4,0x143C)
xg1(0,4,0x14DC)
xg1(0,4,0x161C)
xg1(0,4,0x16BC)
xg1(0,4,0x175C)
xg1(0,4,0x189C)
xg1(0,4,0x193C)
xg1(0,4,0x19DC)
xg1(0,4,0x1A7C)
xg1(0,4,0x1B1C)
xg1(0,4,0x1BBC)
xg1(0,4,0x1C5C)
xg1(0,4,0x1CFC)
xg1(0,4,0x1D9C)
xg1(0,4,0x1E3C)
xg1(0,4,0x1EDC)
xg1(0,4,0x201C)
xg1(0,4,0x20BC)
xg1(0,4,0x215C)
xg1(0,4,0x21FC)
search(3293,4,32)
py1(95000,4,0x18)
py1(3294,4,0x38)
xg1(0,4,0x3C)
xg1(0,4,0xDC)
xg1(0,4,0x17C)
xg1(0,4,0x21C)
xg1(0,4,0x2BC)
xg1(0,4,0x35C)
xg1(0,4,0x3FC)
xg1(0,4,0x49C)
xg1(0,4,0x53C)
xg1(0,4,0x5DC)
xg1(0,4,0x67C)
xg1(0,4,0x71C)
xg1(0,4,0x7BC)
xg1(0,4,0x85C)
xg1(0,4,0x8FC)
xg1(0,4,0x99C)
xg1(0,4,0xA3C)
xg1(0,4,0xADC)
xg1(0,4,0xB7C)
xg1(0,4,0xC1C)
xg1(0,4,0xCBC)
xg1(0,4,0xD5C)
xg1(0,4,0xDFC)
xg1(0,4,0xE9C)
xg1(0,4,0xF3C)
xg1(0,4,0xFDC)
xg1(0,4,0x107C)
xg1(0,4,0x111C)
xg1(0,4,0x11BC)
xg1(0,4,0x125C)
xg1(0,4,0x12FC)
xg1(0,4,0x139C)
xg1(0,4,0x143C)
xg1(0,4,0x14DC)
xg1(0,4,0x157C)
xg1(0,4,0x161C)
xg1(0,4,0x16BC)
xg1(0,4,0x175C)
xg1(0,4,0x17FC)
xg1(0,4,0x189C)
xg1(0,4,0x193C)
xg1(0,4,0x19DC)
xg1(0,4,0x1A7C)
xg1(0,4,0x1C5C)--็ช่ฏไปๆพ็คบ
gg.toast('๐ๆญฃๅจๅผๅฏ้ๅธ่ดญไนฐ๐')

search(95000,4,32)
py1(107,4,0x78)
py1(107,4,0x80)
xg1(2,4,0xAC)
xg1(2,4,-0x94)
xg1(2,4,0x244C)

search(160000,4,32)
py1(41,4,-0x20)
py1(41,4,-0x28)
xg1(2,4,-0x1674)
xg1(2,4,-0x1714)
xg1(2,4,-0x17B4)
xg1(2,4,-0x1854)

search(95000,4,32)
py1(95,4,-0x28)
py1(95,4,-0x20)
xg1(2,4,0xC)

search(160000,4,32)
py1(41,4,-0x28)
py1(41,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(116,4,-0x28)
py1(116,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(140,4,-0x28)
py1(140,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(132,4,-0x28)
py1(132,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(128,4,-0x28)
py1(128,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(122,4,-0x28)
py1(122,4,-0x20)
xg1(2,4,0xC)

search(2347,4,32)
py1(63,4,-0x8)
py1(63,4,-0x10)
xg1(2,4,0x24)

search(2846,4,32)
py1(85,4,-0x8)
py1(85,4,-0x10)
xg1(2,4,0x24)

search(95000,4,32)
py1(102,4,-0x28)
py1(102,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(92,4,-0x28)
py1(92,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(81,4,-0x28)
py1(81,4,-0x20)
xg1(2,4,0xC)

search(1188,4,32)
py1(35,4,-0x40)
py1(35,4,-0x48)
xg1(3,4,-0x14)

search(12000,4,32)
py1(10,4,-0x28)
py1(10,4,-0x20)
xg1(2,4,0xC)

search(2604,4,32)
py1(73,4,-0x8)
py1(73,4,-0x10)
xg1(2,4,0x24)

search(95000,4,32)
py1(56,4,-0x28)
py1(56,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(134,4,-0x28)
py1(134,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(83,4,-0x20)
py1(83,4,-0x28)
xg1(2,4,0xC)

search(95000,4,32)
py1(71,4,-0x20)
py1(71,4,-0x28)
xg1(2,4,0xC)

search(95000,4,32)
py1(122,4,-0x20)
py1(122,4,-0x28)
xg1(2,4,0xC)

search(95000,4,32)--ๅตๅ้้ๅธ่ดญไนฐ
py1(166,4,-0x28)
py1(166,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)--ๅนป่ง้ๅธ่ดญไนฐ
py1(167,4,-0x1C)
xg1(0,4,0x24)--ๅนป่งๆพ็คบ
xg1(2,4,0xC)
gg.toast('ๅผๅฏๅฎๆ')
end

function hua()
----
search(50000,4,32)
py1(320,4,-0x14)
py1(321,4,0x2C)
xg1(0,4,0x30)
xg1(0,4,0x140)
xg1(0,4,0x250)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x4F8)
xg1(0,4,0x580)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x828)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBF0)
xg1(0,4,0xC68)
xg1(0,4,0xD78)
xg1(0,4,0xE88)
xg1(0,4,0xF10)
xg1(0,4,0xF98)
xg1(0,4,0x1020)
xg1(0,4,0x10A8)
xg1(0,4,0x1130)
xg1(0,4,0x11B8)
xg1(0,4,0x1240)
xg1(0,4,0x12C8)
xg1(0,4,0x1350)
xg1(0,4,0x1460)
xg1(0,4,0x14E8)
xg1(0,4,0x1570)
xg1(0,4,0x15F8)
xg1(0,4,0x1680)
xg1(0,4,0x1708)
search(50000,4,32)
py1(2123,4,0x2C)
py1(2122,4,-0x14)
xg1(0,4,0x30)
xg1(0,4,0xB8)
xg1(0,4,0x140)
xg1(0,4,0x1C8)
xg1(0,4,0x250)
xg1(0,4,0x2D8)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x4F8)
xg1(0,4,0x580)
xg1(0,4,0x608)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x828)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBE0)
xg1(0,4,0xC68)
xg1(0,4,0xCF0)
xg1(0,4,0xD78)
xg1(0,4,0xE00)
xg1(0,4,0xE88)
xg1(0,4,0xF10)
xg1(0,4,0xF98)
xg1(0,4,0x1020)
xg1(0,4,0x10A8)
xg1(0,4,0x11B8)
xg1(0,4,0x1240)
xg1(0,4,0x12C8)
xg1(0,4,0x13D8)
xg1(0,4,0x1460)
search(50000,4,32)
py1(2870,4,0x2C)
py1(2867,4,-0x14)
xg1(0,4,0x30)
xg1(0,4,0x138)
xg1(0,4,0x140)
xg1(0,4,0x1C8)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x470)
xg1(0,4,0x4F8)
xg1(0,4,0x580)
xg1(0,4,0x608)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBE0)
xg1(0,4,0xC68)
xg1(0,4,0xCF0)
xg1(0,4,0xD78)
xg1(0,4,0xE00)
xg1(0,4,0xE88)
xg1(0,4,0xF10)
xg1(0,4,0xF98)
xg1(0,4,0x1020)
xg1(0,4,0x10A8)
xg1(0,4,0x1130)
xg1(0,4,0x11B8)
xg1(0,4,0x1240)
xg1(0,4,0x12C8)
xg1(0,4,0x1350)
xg1(0,4,0x13D8)
xg1(0,4,0x1460)
search(50000,4,32)
py1(3350,4,0x2C)
py1(3349,4,-0x14)
xg1(0,4,0x30)
xg1(0,4,0x138)
xg1(0,4,0x140)
xg1(0,4,0x1C8)
xg1(0,4,0x250)
xg1(0,4,0x2D8)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x470)
xg1(0,4,0x4F8)
xg1(0,4,0x608)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x828)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBE0)
xg1(0,4,0xC68)
xg1(0,4,0xCF0)
xg1(0,4,0xD78)
search(50000,4,32)
py1(832,4,0x2C)
py1(841,4,-0x14)
xg1(0,4,0x30)
search(50000,4,32)
py1(3301,4,0x2C)
py1(3300,4,-0x14)
xg1(0,4,0x30)
search(50000,4,32)
py1(142,4,-0x24)
py1(142,4,-0x1C)
xg1(0,4,0x30)
search(50000,4,32)--ๅๅญ็ฆ
py1(3399,4,0x2C)
py1(3398,4,-0x14)
xg1(0,4,0x30)
search(50000,4,32)
py1(157,4,-0x24)
py1(157,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(100,4,-0x24)
py1(100,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(103,4,-0x24)
py1(103,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(137,4,-0x24)
py1(137,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(136,4,-0x24)
py1(136,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(64,4,-0x24)
py1(64,4,-0x1C)
xg1(2,4,0x1C)
search(3171,4,32)
py1(115,4,-0x8)
py1(115,4,-0x10)
xg1(2,4,0x30)
search(2856,4,32)
py1(89,4,-0x8)
py1(89,4,-0x10)
xg1(2,4,0x30)
search(50000,4,32)
py1(121,4,-0x24)
py1(121,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(116,4,-0x24)
py1(116,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(113,4,-0x24)
py1(113,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(96,4,-0x24)
py1(96,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(98,4,-0x24)
py1(98,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(108,4,-0x24)
py1(108,4,-0x1C)
xg1(2,4,0x1C)
search(3001,4,32)
py1(105,4,-0x10)
py1(105,4,-0x8)
xg1(2,4,0x30)
search(5000,4,32)
py1(66,4,-0x24)
py1(66,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(33,4,-0x24)
py1(33,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(6,4,-0x24)
py1(6,4,-0x1C)
xg1(2,4,0x1C)
search(85000,4,32)
py1(11,4,-0x24)
py1(11,4,-0x1C)
xg1(2,4,0x1C)
search(1869,4,32)
py1(45,4,-0x8)
py1(45,4,-0x10)
xg1(2,4,0x30)
search(2868,4,32)
py1(94,4,-0x8)
py1(94,4,-0x10)
xg1(2,4,0x30)
search(2318,4,32)
py1(62,4,-0x8)
py1(62,4,-0x10)
xg1(2,4,0x30)
search(50000,4,32)
py1(134,4,-0x24)
py1(134,4,-0x1C)
xg1(2,4,0x1C)
search(2856,4,32)
py1(1,4,16)
py1(80,4,20)
py1(1,4,24)
xg1(2,4,48)
search(2588,4,32)
py1(1,4,16)
py1(50000,4,20)
py1(1,4,24)
xg1(2,4,48)
search(50000,4,32)
py1(85,4,-0x24)
py1(85,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(75,4,-0x24)
py1(75,1,-0x1C)
xg1(2,1,0x1C)
search(50000,4,32)--่ๅฆน้ฃ่ฝฆ
py1(3428,4,0x2C)
py1(3427,4,-0x14)
xg1(2,4,0x1C)
search(50000,4,32)
py1(160,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(137,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(45,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(53,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(6,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(80,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(94,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(132,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(133,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(164,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(135,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(136,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(138,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(139,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(141,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(159,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ๐')
end

function bs()
search(3223,4,32)
py1(3229,4,0x40)
py1(3239,4,0x80)
xg1(0,4,0x114)--้ฃ่ฝฆ
xg1(0,4,0x154)--ๆฐ็
xg1(0,4,0x1D4)--่ฑ็ฏ
xg1(0,4,0x254)
xg1(0,4,0x294)
xg1(0,4,0x2D4)
xg1(0,4,0x314)
xg1(0,4,0x354)
xg1(0,4,0x394)
xg1(0,4,0x3D4)
gg.toast('๐ๆญฃๅจๅผๅฏ่้ฅฐ้ๅธ่ดญไนฐ๐')
search(3223,4,32)
py1(3229,4,0x40)
py1(3239,4,0x80)
xg1(1,4,0xC)
xg1(0,4,0x8)
xg1(1,4,0x4c)
xg1(0,4,0x48)
xg1(1,4,0x8C)
xg1(0,4,0x88)
xg1(1,4,0xCC)
xg1(0,4,0xC8)
xg1(1,4,0x10C)
xg1(0,4,0x108)
xg1(1,4,0x14C)
xg1(0,4,0x148)
xg1(1,4,0x18C)
xg1(0,4,0x188)
xg1(1,4,0x1CC)
xg1(0,4,0x1C8)
xg1(1,4,0x20C)
xg1(0,4,0x208)
xg1(1,4,0x24C)
xg1(0,4,0x248)
xg1(1,4,0x28C)
xg1(0,4,0x288)
xg1(1,4,0x2CC)
xg1(0,4,0x2C8)
xg1(1,4,0x30C)
xg1(0,4,0x308)
xg1(1,4,0x34C)
xg1(0,4,0x348)
xg1(1,4,0x38C)
xg1(0,4,0x388)
xg1(1,4,0x3CC)
xg1(0,4,0x3C8)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ๐')
end

function fp()
search(2852,4,32)---่ฒ่
py1(1,4,-0x38)
py1(1,4,-0x30)
xg1(2,4,-0x18)
search(3184,4,32)----็ณๅฟ
py1(1,4,-0x30)
py1(1,4,-0x38)
xg1(2,4,-0x18)
search(3238,4,32)---้ผ ๅฐๆ
py1(1,4,-0x30)
py1(1,4,-0x38)
xg1(2,4,-0x18)
search(2542,4,32)--ๅๅธ
py1(1,4,-0x2C)
py1(1,4,-0x34)
xg1(2,4,-0x14)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ๐')
end

function pf1()
Main()
end

function bw()
if jsq1==0 then bw1() end
jsq1=10086
ZY='bw'
SB = gg.choice({
   -- "๐ๅฟ้กปๅผๆ๐",
   "๐่ชๅฎไนๅฎ็ฉ๐",
   "๐่ชๅฎไนไบบ็ฉ๐",
   "๐่ชๅฎไนๆปๆฟ๐",
   "๐ๆปๆฟๆฐ้๐",
   "๐ๅๅขๆฐ้๐",
   "๐ๅทๅฐๆฐ้๐",
   "๐่ฟๅไธ้กต๐",
},nil,os.date "๐่ชๅฎไน่พๅฅๅฎไนๅ๏ผๅปๅๆฐ่ตๅฎ็ณๅๅ็็๐\n๐ๅไบฌๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ๅ็พ็พ่พๅฉ๐")
-- if SB == 1 then bw1() end
if SB == 1 then bw2() end
if SB == 2 then bw3() end
if SB == 3 then bw4() end
if SB == 4 then bw5() end
if SB == 5 then bw6() end
if SB == 6 then bw7() end
if SB == 7 then bw8() end
end

function bw1()
search(120,4,32)
py1(1,4,0x24)
py1(1,4,0x2C)
xg1(0,4,0x2C,true)
xg1(0,4,0x20,true)
xg1(-10000,4,0x1C,true)
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
xg1(0,4,-0x10,true)
xg1(0,4,-0x1C,true)
xg1(0,4,0xC,true)
xg1(0,4,0x18,true)
xg1(0,4,0x24,true)
xg1(0,4,0x30,true)
xg1(0,4,0x3C,true)
xg1(0,4,0x48,true)
xg1(0,4,0x50,true)
xg1(0,4,0x5C,true)
gg.toast('๐ไฟฎๆนๅฎๆ๐')
end

function bw2()
search(3000,4,32)
py1(1,4,0x90)
py1(1,4,0x88)
py1(7,4,0x8C)
xg1(21,4,-0x20)
xg1(gg.prompt({'๐ๅฎ็ฉไปฃ็ ๆฏ1~34๐'}, {[1] = ''}, {[1] = 'number'})[1],4,0x4C,true)
gg.toast('๐ไฟฎๆนๅฎๆ๐')
end

function bw3()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(10,4,-0x20)
xg1(gg.prompt({'๐ไบบ็ฉไปฃ็ ๐\n๐1~165๐'}, {[1] = ''}, {[1] = 'number'})[1],4,0x8)
gg.alert('๐ๅผๅฏๅฎๆ๐')
end

function bw4()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(12,4,-0x20)
xg1(gg.prompt({'๐้่4ไธชๆปๆฟไปฃ็ ๐\n๐45๐\n๐60๐\n๐62๐\n๐94๐'}, {[1] = '45'}, {[1] = 'number'})[1],4,0x20,true)
gg.alert('๐ๅผๅฏๅฎๆ๐')
end

function bw5()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(2,4,-0x20)
gg.toast("๐ๅผๅฏๅฎๆ๐")
end

function bw6()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(3,4,-0x20)
gg.toast("๐ๅผๅฏๅฎๆ๐")
end

function bw7()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(4,4,-0x20)
gg.toast("๐ๅผๅฏๅฎๆ๐")
end

function bw8()
Main()
end

function pk()
ZY='pk'
  SN = gg.choice({
  "๐็ซ่ทๅก๐",
  "๐้่็็ซ่ทๅก๐",
  "๐ๅๅ้ๅธ๐",
  "๐่ชๅฎไน็ญ็บง๐",
  --"๐้จๅๅคดๅๆก๐",
 -- "๐่ชๅฎไนๅคดๅๆก๐",
  "๐่ฟๅไธ้กต๐",
 }, nil,os.date "๐ๅไบฌๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ๅ็พ็พ่พๅฉ๐")
if SN == 1 then xp() end
if SN == 2 then ycxp() end
if SN == 3 then sbjb() end
if SN == 4 then zddj() end
--if SN == 5 then txk() end
--if SN == 6 then zdtxk() end
if SN == 5 then pk1() end
end

function xp()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(0,4,0x5C)
xg1(0,4,0x50)
xg1(gg.prompt({'๐็ญ็บง1~6๐'}, {[1] = '6'}, {[1] = 'number'})[1],4,0x4C)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ๐')
end

function ycxp()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(0,4,0x5C)
xg1(0,4,0x50)
xg1(999,4,0x4C)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ๐')
end


function sbjb()
search(2334,4,32)
py1(1,4,0x14)
py1(1,4,0x1C)
xg1(65537,4,0x188)
gg.alert(os.date'๐ไฟฎๆนๆถ้ด๐\n๐%Yๅนด%mๆ%dๆฅ%Hๆถ%Mๅ๐\n๐ไฟฎๆนๆๅ๐')
end

function zddj()
search(2334,4,32)
py1(1,4,-0x124)
py1(1,4,-0x11C)
xg1(gg.prompt({'๐ไธ่ฆๆนๅคชๅคง\nๅฆๅ่ฟไธๅปๆธธๆ๐'}, {[1] = ''}, {[1] = 'number'})[1],4,-0x5C)
gg.alert('๐ไฟฎๆนๆๅ๐')
end

function txk()
search(2308,4,32)
py1(2310,4,0x10)
py1(2283,4,0x1C)
xg1(-1,4,-0x78)
xg1(-1,4,-0x7C)
xg1(-1,4,-0x80)
xg1(-1,4,-0x84)
gg.toast('๐ๅผๅฏๅฎๆ๐')
end

function zdtxk()
search(2308,4,32)
py1(2310,4,0x10)
py1(2283,4,0x1c)
xg1(gg.prompt({'๐ๅคดๅๆก1๏ฝ51๐'}, {[1] = ''}, {[1] = 'number'})[1],4,-0x70)
gg.alert('ไฟฎๆนๆๅ')
end

function pk1()
Main()
end


while(true) do
if gg.isVisible(true) then
gg.setVisible(false)
_ENV[ZY]()
end
end
