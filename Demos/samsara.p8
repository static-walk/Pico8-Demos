pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
w=3
cls()
function r_s()
 return flr(rnd(w))-flr(w/2)
end
for x=0,127 do
 for y=0,127 do
  pset(x,y,rnd(16))
 end
end
::✽::
  x=rnd(128)
  y=rnd(128)
  c=0
  p={}
  for i=1,4 do
   c+=pget(x+r_s(),y+r_s())+rnd(2)
  end
  c/=4
  pset(x,y,c)
goto ✽
