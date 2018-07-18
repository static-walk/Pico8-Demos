pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function conc_circ(x,y)
 for r=1,127*sqrt(2),3 do
  circ(x,y,r,7)
 end
end

function _init()
 x1=64
 y1=64
 u1=rnd(3)
 v1=rnd(3)
 x2=64
 y2=64
 u2=rnd(3)
 v2=rnd(3)
end

function _update()
 x1+=u1
 y1+=v1
 x2+=u2
 y2+=v2
 if x1<=0 or x1>=127 then u1*=-1 end
 if y1<=0 or y1>=127 then v1*=-1 end
 if x2<=0 or x2>=127 then u2*=-1 end
 if y2<=0 or y2>=127 then v2*=-1 end
end

function _draw()
 cls()
 rectfill(0,0,127,127,7)
 circfill(64,64,64,0)
 conc_circ(x1,y1)
 conc_circ(x2,y2)
end
__map__
0000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
