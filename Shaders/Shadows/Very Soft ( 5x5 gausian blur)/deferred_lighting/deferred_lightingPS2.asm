//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferStencilTextureSampler;
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
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   gViewInverse                 c12      4
//   gDirectionalLight            c17      1
//   gDirectionalColour           c18      1
//   gLightAmbient0               c37      1
//   gLightAmbient1               c38      1
//   globalScalars                c39      1
//   gShadowParam18192021         c53      1
//   gFacetCentre                 c54      1
//   gShadowParam14151617         c56      1
//   gShadowParam0123             c57      1
//   gShadowParam4567             c58      1
//   gShadowParam891113           c59      1
//   gShadowMatrix                c60      4
//   gDeferredProjParams          c66      1
//   dReflectionParams            c72      1
//   GBufferTextureSampler0       s0       1
//   GBufferTextureSampler1       s1       1
//   GBufferTextureSampler2       s2       1
//   GBufferTextureSampler3       s4       1
//   GBufferStencilTextureSampler s5       1
//   ParabSampler                 s6       1
//   gShadowZSamplerDir           s15      1
//

    ps_3_0
    def c0, 0, 512, 4096, 0.00200000009
    def c1, 0.99609375, 7.96875, 63.75, 0.25
    def c2, 256, -127.999992, 0.000392156857, 4
    def c3, 2, 0.5, 1, 9.99999975e-006
    def c4, 1.33333337, 9.99999975e-005, 1, 0
    // def c5, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c5, 1.5, -0.326211989, -0.405809999, 1 					//  1/25 samples
    def c6, -0.791558981, -0.597710013, -0.5, 0.5
    def c7, 0.0199999996, 0.00999999978, 0.75, 0.25
    def c8, 5, 10, 0, 0
    def c9, 1, -1, 0, -0
    def c10, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c11, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c12, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c13, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c16, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
	
	
	
	//
	    // def c97,  0.1250, 0.5, 0.25, 1 // texture rescale multiplicator
		//        x   y  z  w
		def c97,  0.125, 0.5, 0.25, 1 // texture rescale multiplicator (the shader is made to work with a square texture, but provides a 4x larger in horizontal)
		def c96, -2, -1, 0, 1 	// old pixels offsets
		def c99, -2, -1, 2, 3 	// old pixels offsets
		def c98,  0,  1, 2, 3 	// old pixels offsets


		def c100, -4, -3, -2, -1 
		def c101, -4, -3,  0,  1 
		def c102, -4, -3,  2,  3 
		def c103, -4, -3,  4,  5 
		def c104, -2, -1,  0,  1 
		def c105, -2, -1,  2,  3 
		def c106, -2, -1,  4,  5 
		def c107,  0,  1,  2,  3 
		def c108,  0,  1,  4,  5 
		def c109,  2,  3,  4,  5 
		def c110, -1,  0,  1,  2  

		def c111, 0.003906,  0.015625,  0.023438,  0.015625
		def c112, 0.003906,  0.015625,  0.062500,  0.093750 
		def c113, 0.062500,  0.015625,  0.023438,  0.093750 
		def c114, 0.140625,  0.093750,  0.023438,  0.015625 
		def c115, 0.062500,  0.093750,  0.062500,  0.015625
		def c116, 0.003906,  0.015625,  0.023438,  0.015625 
		def c117, 0.003906, 0,0,0

    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    dcl_2d s15
    texld r0, v0, s4
    mad r0.x, r0.x, c66.z, -c66.w
    mul r0.x, r0.x, v1.w
    rcp r0.x, r0.x
    mad r0.yzw, v1.xxyz, -r0.x, c15.xxyz
    dp3 r1.x, c14, r0.yzww
    add r1.xyz, -r1.x, -c54
    cmp r1.yzw, r1.xxyz, c4.z, c4.w
    mov r1.x, c3.z
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
	// mov r1.y, c53.y
	
	// uv mapping
	mov r10.xy, r0.zw			// shadow uv
	mov r11.xy, c53.xy
	mul r11.xy, r11.xy, c97.ww	// Rescale? (if necessary).
	
	// shadow filtering	
	// invert to texture size (1/pixel size)
	rcp r7.x, r11.x
	rcp r7.y, r11.y
		 
	mul r7.xy, r10.xy, r7.xy		// uv * texture size(2048x512)
	frc r7.xy, r7.xy			// fractional part
	add r7.xy, c9.xx, -r7.xy	// 1 - fractional part


	// 16 shadow samples (r3 to r6, each is a row)
	// first row (r3 takes shadow samples, x = colum 1, y = colum 2, etc.)
	mad r2.xy, c100.zz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.x, r1.z, -r8.x;
	cmp r3.x, r3.x, c4.z, c4.w;

	mad r2.xy, c100.wz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.y, r1.z, -r8.x;
	cmp r3.y, r3.y, c4.z, c4.w;

	mad r2.xy, c104.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.z, r1.z, -r8.x;
	cmp r3.z, r3.z, c4.z, c4.w;

	mad r2.xy, c104.wx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.w, r1.z, -r8.x;
	cmp r3.w, r3.w, c4.z, c4.w;

	mad r2.xy, c105.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.x, r1.z, -r8.x;
	cmp r5.x, r5.x, c4.z, c4.w;

	mad r2.xy, c105.wx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.y, r1.z, -r8.x;
	cmp r5.y, r5.y, c4.z, c4.w
               
	mad r2.xy, c100.zw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.x, r1.z, -r8.x;
	cmp r4.x, r4.x, c4.z, c4.w;

	mad r2.xy, c100.ww, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.y, r1.z, -r8.x;
	cmp r4.y, r4.y, c4.z, c4.w;

	mad r2.xy, c104.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.z, r1.z, -r8.x;
	cmp r4.z, r4.z, c4.z, c4.w;

	mad r2.xy, c104.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.w, r1.z, -r8.x;
	cmp r4.w, r4.w, c4.z, c4.w;

	mad r2.xy, c105.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.z, r1.z, -r8.x;
	cmp r5.z, r5.z, c4.z, c4.w;

	mad r2.xy, c105.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.w, r1.z, -r8.x;
	cmp r5.w, r5.w, c4.z, c4.w
               
														mov r6.z, c9.z
														lrp r3,   r7.y, r3, r4
														lrp r8.xy,r7.y, r5.xy, r5.zw
														lrp r6.z, r7.x, r3.x, r3.y;
	mul r6.w, r6.z, c111.x;

														lrp r6.z, r7.x, r3.y, r3.z;
	mad r6.w, r6.z, c111.y, r6.w;

														lrp r6.z, r7.x, r3.z, r3.w;
	mad r6.w, r6.z, c111.z, r6.w;

														lrp r6.z, r7.x, r3.w, r8.x;
	mad r6.w, r6.z, c111.w, r6.w;

														lrp r6.z, r7.x, r8.x, r8.y;
	mad r6.w, r6.z, c112.x, r6.w
               
	mad r2.xy, c104.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.x, r1.z, -r8.x;
	cmp r3.x, r3.x, c4.z, c4.w;

	mad r2.xy, c104.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.y, r1.z, -r8.x;
	cmp r3.y, r3.y, c4.z, c4.w;

	mad r2.xy, c101.zz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.z, r1.z, -r8.x;
	cmp r3.z, r3.z, c4.z, c4.w;

	mad r2.xy, c101.wz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.w, r1.z, -r8.x;
	cmp r3.w, r3.w, c4.z, c4.w;

	mad r2.xy, c107.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.x, r1.z, -r8.x;
	cmp r5.x, r5.x, c4.z, c4.w;

	mad r2.xy, c107.wx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.y, r1.z, -r8.x;
	cmp r5.y, r5.y, c4.z, c4.w
               
														lrp r4,   r7.y, r4, r3
														lrp r8.xy,r7.y, r5.zw, r5.xy
														lrp r6.z, r7.x, r4.x, r4.y;
	mad r6.w, r6.z, c112.y, r6.w;

														lrp r6.z, r7.x, r4.y, r4.z;
	mad r6.w, r6.z, c112.z, r6.w;

														lrp r6.z, r7.x, r4.z, r4.w;
	mad r6.w, r6.z, c112.w, r6.w;

														lrp r6.z, r7.x, r4.w, r8.x;
	mad r6.w, r6.z, c113.x, r6.w;

														lrp r6.z, r7.x, r8.x, r8.y;
	mad r6.w, r6.z, c113.y, r6.w
               
	mad r2.xy, c104.xw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.x, r1.z, -r8.x;
	cmp r4.x, r4.x, c4.z, c4.w;

	mad r2.xy, c104.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.y, r1.z, -r8.x;
	cmp r4.y, r4.y, c4.z, c4.w;

	mad r2.xy, c101.zw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.z, r1.z, -r8.x;
	cmp r4.z, r4.z, c4.z, c4.w;

	mad r2.xy, c101.ww, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.w, r1.z, -r8.x;
	cmp r4.w, r4.w, c4.z, c4.w;

	mad r2.xy, c107.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.z, r1.z, -r8.x;
	cmp r5.z, r5.z, c4.z, c4.w;

	mad r2.xy, c107.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.w, r1.z, -r8.x;
	cmp r5.w, r5.w, c4.z, c4.w
               
														lrp r3,   r7.y, r3, r4
														lrp r8.xy,r7.y, r5.xy, r5.zw
														lrp r6.z, r7.x, r3.x, r3.y;
	mad r6.w, r6.z, c113.z, r6.w;

														lrp r6.z, r7.x, r3.y, r3.z;
	mad r6.w, r6.z, c113.w, r6.w;

														lrp r6.z, r7.x, r3.z, r3.w;
	mad r6.w, r6.z, c114.x, r6.w;

														lrp r6.z, r7.x, r3.w, r8.x;
	mad r6.w, r6.z, c114.y, r6.w;

														lrp r6.z, r7.x, r8.x, r8.y;
	mad r6.w, r6.z, c114.z, r6.w
               
	mad r2.xy, c105.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.x, r1.z, -r8.x;
	cmp r3.x, r3.x, c4.z, c4.w;

	mad r2.xy, c105.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.y, r1.z, -r8.x;
	cmp r3.y, r3.y, c4.z, c4.w;

	mad r2.xy, c107.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.z, r1.z, -r8.x;
	cmp r3.z, r3.z, c4.z, c4.w;

	mad r2.xy, c107.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r3.w, r1.z, -r8.x;
	cmp r3.w, r3.w, c4.z, c4.w;

	mad r2.xy, c102.zz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.x, r1.z, -r8.x;
	cmp r5.x, r5.x, c4.z, c4.w;

	mad r2.xy, c102.wz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.y, r1.z, -r8.x;
	cmp r5.y, r5.y, c4.z, c4.w
               
														lrp r4,   r7.y, r4, r3
														lrp r8.xy,r7.y, r5.zw, r5.xy
														lrp r6.z, r7.x, r4.x, r4.y;
	mad r6.w, r6.z, c114.w, r6.w;

														lrp r6.z, r7.x, r4.y, r4.z;
	mad r6.w, r6.z, c115.x, r6.w;

														lrp r6.z, r7.x, r4.z, r4.w;
	mad r6.w, r6.z, c115.y, r6.w;

														lrp r6.z, r7.x, r4.w, r8.x;
	mad r6.w, r6.z, c115.z, r6.w;

														lrp r6.z, r7.x, r8.x, r8.y;
	mad r6.w, r6.z, c115.w, r6.w
               
	mad r2.xy, c105.xw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.x, r1.z, -r8.x;
	cmp r4.x, r4.x, c4.z, c4.w;

	mad r2.xy, c105.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.y, r1.z, -r8.x;
	cmp r4.y, r4.y, c4.z, c4.w;

	mad r2.xy, c107.xw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.z, r1.z, -r8.x;
	cmp r4.z, r4.z, c4.z, c4.w;

	mad r2.xy, c107.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r4.w, r1.z, -r8.x;
	cmp r4.w, r4.w, c4.z, c4.w;

	mad r2.xy, c102.zw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.z, r1.z, -r8.x;
	cmp r5.z, r5.z, c4.z, c4.w;

	mad r2.xy, c102.ww, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r5.w, r1.z, -r8.x;
	cmp r5.w, r5.w, c4.z, c4.w

	lrp r3,   r7.y, r3, r4
	lrp r8.xy,r7.y, r5.xy, r5.zw
	lrp r6.z, r7.x, r3.x, r3.y;
	mad r6.w, r6.z, c116.x, r6.w;

	lrp r6.z, r7.x, r3.y, r3.z;
	mad r6.w, r6.z, c116.y, r6.w;

	lrp r6.z, r7.x, r3.z, r3.w;
	mad r6.w, r6.z, c116.z, r6.w;

	lrp r6.z, r7.x, r3.w, r8.x;
	mad r6.w, r6.z, c116.w, r6.w;

	lrp r6.z, r7.x, r8.x, r8.y;
	mad r0.z, r6.z, c117.x, r6.w


	// r0.z takes final shadows result
    rcp r0.w, c53.w
    mul r0.w, r0.y, r0.w
    add r0.y, r0.y, -c53.w
    cmp r1.xy, r0.y, c9, c9.zwzw
    mul r0.y, r0.w, r0.w
    mul r0.y, r0.y, c5.x
    mad r0.y, r0.z, c5.w, r0.y
    add r0.z, r1.y, r0.y
    cmp_sat r0.y, r0.z, r0.y, r1.x
    texld r1, v0, s1
    mul r2.xyz, r1.w, c1
    frc r2.xyz, r2
    add r3.xyz, r2, r2
    mad r3.xy, r2.yzzw, -c1.w, r3
    mad r1.xyz, r1, c2.x, r3
    add r1.xyz, r1, c2.y
    nrm r2.xyz, r1
    mad r1.xyz, v1, -r0.x, c3.w
    mul r0.xzw, r0.x, v1.xyyz
    nrm r3.xyz, r1
    dp3 r1.x, r3, r2
    add r1.y, r1.x, r1.x
    add r1.x, -r1_abs.x, c3.z
    mul r1.x, r1.x, r1.x
    mul r1.x, r1.x, r1.x
    mad r1.x, r1.x, c7.z, c7.w
    mad r1.yzw, r2.xxyz, -r1.y, r3.xxyz
    dp3_sat r2.w, -c17, r1.yzww
    add r2.w, r2.w, c4.y
    mul r3.w, r2.z, c2.w
    mov_sat r3.w, r3.w
    mul r3.w, r3.w, c72.y
    texld r4, v0, s5
    add r4.x, -r4.x, c2.z
    cmp r3.w, r4.x, r3.w, c0.x
    texld r4, v0, s2
    mul r4.y, r4.y, r4.y
    mul r5.xy, r4.y, c0.yzzw
    min r4.w, r5.y, c2.x
    mad r4.y, r4.y, -c0.y, r4.w
    mad r4.y, r3.w, r4.y, r5.x
    max r6.x, r5.x, r4.y
    add r4.y, r6.x, c4.y
    pow r5.x, r2.w, r4.y
    mul r5.yzw, c18.w, c18.xxyz
    mul r6.yzw, r5.x, r5
    mul r6.yzw, r0.y, r6
    dp3 r0.x, r3, -r0.xzww
    mul_sat r0.xz, r0.x, c7.xyyw
    add r0.z, -r0.z, c3.z
    mad r1.yzw, r3.xxyz, r0.x, r1
    add r1.yzw, r1, c3.w
    nrm r3.xyz, r1.yzww
    mul_sat r0.x, r3.z, c8.x
    mov_sat r0.w, r3.z
    add r0.w, r0.w, c3.z
    add r0.w, r0.w, r0.w
    rcp r0.w, r0.w
    mad r1.yz, r3.xxyw, r0.w, c3.y
    add r7.xy, -r1.yzzw, c3.z
    mul_sat r0.w, r6.x, c72.x
    mul r1.y, r6.x, c0.w
    min r2.w, r1.y, c1.w
    mad r1.y, r4.x, -c3.x, r2.w
    mad r7.w, r0.w, -c2.w, c2.w
    mov r7.z, c0.x
    texldl r7, r7, s6
    mul r3.xyz, r0.x, r7
    mul r0.xzw, r0.z, r3.xyyz
    mul r0.xzw, r4.z, r0
    mul r0.xzw, r0, c39.w
    mul r0.xzw, r1.x, r0
    mul r0.xzw, r0, c8.y
    add r1.x, c17.w, c17.w
    mad r0.xzw, r6.yyzw, r1.x, r0
    add r1.x, r4.x, r4.x
    mad r1.y, r3.w, r1.y, r1.x
    mad r1.z, r3.w, -c3.y, c3.z
    max r2.w, r1.x, r1.y
    mul r0.xzw, r0, r2.w
    dp3 r1.x, r2, -c17
    mad_sat r1.y, r2.z, c6.z, c6.w
    mov r2.xyz, c38
    mad r2.xyz, r2, r1.y, c37
    mul r2.xyz, r4.z, r2
    add r1.x, r1.x, -c1.w
    mul_sat r1.x, r1.x, c4.x
    mul r1.xyw, r5.yzzw, r1.x
    mad r1.xyw, r1, r0.y, r2.xyzz
    texld r2, v0, s0
    mul r2.xyz, r1.z, r2
    mad oC0.xyz, r2, r1.xyww, r0.xzww
    mov oC0.w, c3.z

// approximately 184 instruction slots used (19 texture, 165 arithmetic)
 