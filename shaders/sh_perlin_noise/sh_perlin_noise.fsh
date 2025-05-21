uniform float iSeed;
uniform vec3 iResolution; 
varying vec2 fragCoord; 
float N21(vec2 p) {
    return fract(sin(p.x*100.+p.y*6574.+iSeed)*5647.);
}

float SmoothNoise(vec2 uv) {
    vec2 lv = fract(uv);
    vec2 id = floor(uv);
    
    lv = lv*lv*(3.-2.*lv);
    
    float bl = N21(id);
    float br = N21(id+vec2(1,0));
    float b = mix(bl, br, lv.x);
    
    float tl = N21(id+vec2(0,1));
    float tr = N21(id+vec2(1,1));
    float t = mix(tl, tr, lv.x);
    
    return mix(b, t, lv.y);
}

float SmoothNoise2(vec2 uv) {
    float c = SmoothNoise(uv*4.);
    
    // don't make octaves exactly twice as small
    // this way the pattern will look more random and repeat less
    c += SmoothNoise(uv*8.2)*.5;
    c += SmoothNoise(uv*16.7)*.25;
    c += SmoothNoise(uv*32.4)*.125;
    c += SmoothNoise(uv*64.5)*.0625;
    
    c /= 2.;
    
    return c;
}

void main( void )
{
    vec2 uv = fragCoord/iResolution.xy;

    
    float c = SmoothNoise2(uv);
    
    vec3 col = vec3(c);
    
    gl_FragColor = vec4(col,1.0);
}