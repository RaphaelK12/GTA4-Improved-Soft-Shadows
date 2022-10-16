// Original pixelated shadow with 12 samples, poison disk horizontal size / 4
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D ParabSampler;
//   float4 dReflectionParams;
//   float4 gDeferredProjParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam18192021;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name                   Reg   Size
//   ---------------------- ----- ----
//   gViewInverse           c12      4
//   gDirectionalLight      c17      1
//   gDirectionalColour     c18      1
//   gLightAmbient0         c37      1
//   gLightAmbient1         c38      1
//   globalScalars          c39      1
//   gShadowParam18192021   c53      1
//   gFacetCentre           c54      1
//   gShadowParam14151617   c56      1
//   gShadowParam0123       c57      1
//   gShadowParam4567       c58      1
//   gShadowParam891113     c59      1
//   gShadowMatrix          c60      4
//   gDeferredProjParams    c66      1
//   dReflectionParams      c72      1
//   GBufferTextureSampler0 s0       1
//   GBufferTextureSampler1 s1       1
//   GBufferTextureSampler2 s2       1
//   GBufferTextureSampler3 s4       1
//   ParabSampler           s5       1
//   gShadowZSamplerDir     s15      1
//

    ps_3_0
    def c0, 512, 0.99609375, 7.96875, 63.75
    def c1, 0.25, 256, -127.999992, 9.99999975e-006
    def c2, 1.33333337, 9.99999975e-005, 512, 1
    def c3, 1, 0, 1.5, 0.0833333358
    def c4, -0.5, 0.5, 0.0199999996, 0.00999999978
    def c5, 4, 0.75, 0.25, 5
    def c6, 10, 0, 0, 0
    def c7, 1, -1, 0, -0
	
	// poison disk rescaled x/2 y*2
    def c8,  -0.1609700025, -1.865229964, -0.3957794905, -1.195420026
    def c9,   0.2537154855,  0.128849998,  0.4482100010,  0.824916006
    def c10,  0.2597280145,  1.534044028,  0.0927305000, -1.786247968
    def c11,  0.4811699985, -0.389966012,  0.2367170005, -0.960052014
    def c12, -0.3479569850,  0.914273978, -0.1016725005,  1.241431952
    def c13, -0.1631059945, -0.811619998, -0.4200719895, -0.147159994	
	
	// New poison Disk 32 samples (rescaled x/2, y*2)
	def c101, -0.110911, -1.869756, -0.434284, -0.894303
	def c102,  0.114300, -0.397551,  0.477832, -0.020267
	def c103,  0.000000, -0.000000,  0.112680, -1.905803
	def c104,  0.176439, -0.937107, -0.119455, -1.093741
	def c105, -0.285016,  1.631009, -0.019884,  0.610247
	def c106,  0.029443, -1.206732, -0.487589, -0.026372
	def c107,  0.118248,  1.899306, -0.025537,  1.228395
	def c108,  0.288091,  1.450871, -0.254463, -0.739711
	def c109, -0.424779,  0.870107,  0.442371,  0.915000
	def c100,  0.129306,  1.073520,  0.132192,  0.312626
	def c111, -0.100246,  1.847041,  0.435021, -0.941619
	def c112, -0.258144,  0.504888, -0.078488, -0.521451
	def c113,  0.265097,  0.683924,  0.294127,  0.077628
	def c114,  0.303712, -1.498346,  0.282790, -0.519666
	def c115, -0.176097,  1.024384, -0.153082,  0.054771
	def c116, -0.298179, -0.112237, -0.303327, -1.559484

	// added this
	def c96, -1, 0, 1, 2 	// pixels offsets
    def c97,  0.250, 1.0, 0.25, 1 // texture rescale multiplicator (the shader is made to work with a square texture, but provides a 4x larger in horizontal)

    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
    dcl_2d s15
    texld r0, v0, s4
    mad r0.x, r0.x, c66.z, -c66.w
    mul r0.x, r0.x, v1.w
    rcp r0.x, r0.x
    mad r0.yzw, v1.xxyz, -r0.x, c15.xxyz
    dp3 r1.x, c14, r0.yzww
    add r1.xyz, -r1.x, -c54
    cmp r1.yzw, r1.xxyz, c3.x, c3.y
    mov r1.x, c2.w
    dp4 r2.x, r1, c57
    dp4 r2.y, r1, c58
    dp4 r3.x, r1, c59
    dp4 r3.y, r1, c56
    mul r1.xyz, r0.z, c61.xyww
    mad r1.xyz, r0.y, c60.xyww, r1
    mad r1.xyz, r0.w, c62.xyww, r1
    add r0.yzw, -r0, c15.xxyz
    dp3 r0.y, r0.yzww, r0.yzww
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    add r1.xyz, r1, c63.xyww
    mad r0.zw, r1.xyxy, r2.xyxy, r3.xyxy
    mov r1.y, c53.y
	

    mad r2.xy, r1.y, c101.xy, r0.zw
    texld r2, r2, s15
    add r1.x, r1.z, -r2.x
    cmp r1.x, r1.x, c3.x, c3.y

    mad r2.xy, r1.y, c101.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c102.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c102.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c103.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c103.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c104.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c104.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c105.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c105.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c106.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c106.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c107.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c107.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c108.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c108.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c109.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c109.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c110.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c110.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c111.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c111.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c112.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c112.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c113.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c113.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c114.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c114.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c115.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c115.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c116.xy, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y
    add r1.x, r1.x, r1.w

    mad r2.xy, r1.y, c116.zw, r0.zw
    texld r2, r2, s15
    add r1.w, r1.z, -r2.x
    cmp r1.w, r1.w, c3.x, c3.y    
		
	add r0.z, r1.x, r1.w;	
	
    rcp r0.w, c53.w
    mul r0.w, r0.y, r0.w
    add r0.y, r0.y, -c53.w
    cmp r1.xy, r0.y, c7, c7.zwzw
    mul r0.y, r0.w, r0.w
    mul r0.y, r0.y, c3.z
    mad r0.y, r0.z, c3.w, r0.y
    add r0.z, r1.y, r0.y
    cmp_sat r0.y, r0.z, r0.y, r1.x
    texld r1, v0, s1
    mul r2.xyz, r1.w, c0.yzww
    frc r2.xyz, r2
    add r3.xyz, r2, r2
    mad r3.xy, r2.yzzw, -c1.x, r3
    mad r1.xyz, r1, c1.y, r3
    add r1.xyz, r1, c1.z
    nrm r2.xyz, r1
    mad r1.xyz, v1, -r0.x, c1.w
    mul r0.xzw, r0.x, v1.xyyz
    nrm r3.xyz, r1
    dp3 r1.x, r3, r2
    add r1.y, r1.x, r1.x
    add r1.x, -r1_abs.x, c2.w
    mul r1.x, r1.x, r1.x
    mul r1.x, r1.x, r1.x
    mad r1.x, r1.x, c5.y, c5.z
    mad r1.yzw, r2.xxyz, -r1.y, r3.xxyz
    dp3_sat r2.w, -c17, r1.yzww
    add r2.w, r2.w, c2.y
    texld r4, v0, s2
    mul r3.w, r4.y, r4.y
    mad r4.y, r3.w, c2.z, c2.y
    mul r3.w, r3.w, c0.x
    mul_sat r3.w, r3.w, c72.x
    mad r5.w, r3.w, -c5.x, c5.x
    pow r3.w, r2.w, r4.y
    mul r6.xyz, c18.w, c18
    mul r7.xyz, r3.w, r6
    mul r7.xyz, r0.y, r7
    dp3 r0.x, r3, -r0.xzww
    mul_sat r0.xz, r0.x, c4.zyww
    mad r1.yzw, r3.xxyz, r0.x, r1
    add r0.x, -r0.z, c2.w
    add r1.yzw, r1, c1.w
    nrm r3.xyz, r1.yzww
    mul_sat r0.z, r3.z, c5.w
    mov_sat r0.w, r3.z
    add r0.w, r0.w, c2.w
    add r0.w, r0.w, r0.w
    rcp r0.w, r0.w
    mad r1.yz, r3.xxyw, r0.w, c4.y
    add r5.xy, -r1.yzzw, c2.w
    mov r5.z, c3.y
    texldl r3, r5, s5
    mul r1.yzw, r0.z, r3.xxyz
    mul r0.xzw, r0.x, r1.yyzw
    mul r0.xzw, r4.z, r0
    mul r0.xzw, r0, c39.w
    mul r0.xzw, r1.x, r0
    mul r0.xzw, r0, c6.x
    add r1.x, c17.w, c17.w
    mad r0.xzw, r7.xyyz, r1.x, r0
    add r1.x, r4.x, r4.x
    mul r0.xzw, r0, r1.x
    dp3 r1.x, r2, -c17
    mad_sat r1.y, r2.z, c4.x, c4.y
    mov r2.xyz, c38
    mad r1.yzw, r2.xxyz, r1.y, c37.xxyz
    mul r1.yzw, r4.z, r1
    add r1.x, r1.x, -c1.x
    mul_sat r1.x, r1.x, c2.x
    mul r2.xyz, r6, r1.x
    mad r1.xyz, r2, r0.y, r1.yzww
    texld r2, v0, s0
    mad oC0.xyz, r2, r1, r0.xzww
    mov oC0.w, c2.w

// approximately 167 instruction slots used (18 texture, 149 arithmetic)
 