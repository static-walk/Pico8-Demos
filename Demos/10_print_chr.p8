pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x=0
y=0

function _update()
 y=(y+8*flr(x/120))%128
 x=(x+8)%128
end

function _draw()
 spr(flr(rnd(2)),x,y)
end

__gfx__
ccddddddddddddcc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccddddddddddccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dcccddddddddcccd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddcccddddddcccdd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddcccddddcccddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddddcccddcccdddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddccccccddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddddddccccdddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
