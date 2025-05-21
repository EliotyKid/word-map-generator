/// @description Insert description here
// You can write your code in this editor
for(var xx=0; xx<N_CHUNCKS_W; xx++){
  for(var yy=0; yy<N_CHUNCKS_H; yy++){
    global.world[xx][yy].Draw()
  }
}

if keyboard_check_pressed(vk_space) room_restart()