pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init()
 t=0
end

function _update()
 t+=0.05
end

function _draw()
 cls(13)
 --draw spiral
 for i=0,20,0.001 do
 pset(64+5*i*sin(i-t),64+5*i*cos(i-t),2)
 end
 --draw lines
 for x=0,20,2 do
  line(x,0,x,127,14)
 end
 for x=107,127,2 do
  line(x,0,x,127,14)
 end
 for y=0,20,2 do
  line(0,y,127,y,14)
 end
 for y=107,127,2 do
  line(0,y,127,y,14)
 end
end
