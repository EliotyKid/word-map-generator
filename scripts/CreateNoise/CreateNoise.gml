function CreateNoise(_w,_h,_rW=512,_rH=512){
  var noiseW = _w
  var noiseH = _h
  var Res = shader_get_uniform(sh_perlin_noise,"iResolution"); 
  var iSeed = shader_get_uniform(sh_perlin_noise,"iSeed")
  
  
  var noise = surface_create(noiseW,noiseH)
  surface_set_target(noise)
  draw_clear_alpha(c_black,1)
  
  shader_set(sh_perlin_noise) 
  shader_set_uniform_f(Res,_rW,_rH,0); 
  shader_set_uniform_f(iSeed,random_get_seed())
  draw_rectangle(0,0,noiseW,noiseH,false)
  shader_reset(); 
  
  surface_reset_target()
  
  return noise
}