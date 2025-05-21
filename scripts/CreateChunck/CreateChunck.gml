function CreateChunck(_x,_y) constructor{
  //setando a posição da chunck na room
  x = _x * 0.5 * (CHUNCK_WIDTH * SELL_SIZE) + _y * -0.5 * (CHUNCK_WIDTH * SELL_SIZE) 
  y = _x * 0.25 * (CHUNCK_HEIGHT * SELL_SIZE) + _y * 0.25 * (CHUNCK_HEIGHT * SELL_SIZE)
  //setando o tamho da surface
  width = CHUNCK_WIDTH * SELL_SIZE + 5
  height = CHUNCK_HEIGHT * SELL_SIZE
  surf = surface_create(width, height)
  //inicializando todas as posições da chunck
  blocks = array_create(CHUNCK_WIDTH)
  for(var i=0; i<CHUNCK_WIDTH; i++){
    blocks[i] = array_create(CHUNCK_HEIGHT)
    for(var j=0; j<CHUNCK_DEPTH; j++){
      blocks[i][j] = array_create(CHUNCK_DEPTH,-1)
    }
  }
  
  
  needsRedraw = true
  Redraw = function() {
    if  (needsRedraw)  { 
      var _c = blocks
      
      surface_set_target(surf)
      draw_clear_alpha(c_black,-1)
      
      for(var k=CHUNCK_DEPTH-1; k>=0; k--){
        for(var j=0; j<CHUNCK_HEIGHT; j++){
          for(var i=0; i<CHUNCK_WIDTH; i++){
            if  (_c[i][j][k] == -1) continue
              
            var _obj = _c[i][j][k]
            if  (_obj != -1)  {
              var pos = IndiceToPos(i,j)
              _obj.x = pos.x
              _obj.y = pos.y
              
              draw_sprite(_obj.sprite,0,width*.5+_obj.x,_obj.y)
            }
          }
        }
      }
      
      surface_reset_target()
      needsRedraw = false
    }
  }
  
  Draw = function(){
    draw_surface(surf,x,y)
  }
  
  function RecalculatePos(_x,_y)  {
    x = _x * 0.5 * (CHUNCK_WIDTH * SELL_SIZE) + _y * -0.5 * (CHUNCK_WIDTH * SELL_SIZE) 
    y = _x * 0.25 * (CHUNCK_HEIGHT * SELL_SIZE) + _y * 0.25 * (CHUNCK_HEIGHT * SELL_SIZE)
  }
  
  
  function Generate(_x,_y){
    for(var _xx=0; _xx<CHUNCK_WIDTH; _xx++){
     for(var _yy=0; _yy<CHUNCK_HEIGHT;_yy++){
        blocks[_xx][_yy][16] = new CreateWorldObject(_xx,_yy,16,spr_stone)
      } 
    }
  }
}