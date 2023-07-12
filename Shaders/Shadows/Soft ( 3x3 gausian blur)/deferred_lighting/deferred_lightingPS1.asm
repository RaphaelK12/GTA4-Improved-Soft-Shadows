//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler0
//   sampler2D GBufferTextureSampler1
//   sampler2D GBufferTextureSampler2
//   sampler2D GBufferTextureSampler3
//   sampler2D ParabSampler
//   float4 dReflectionParams
//   float4 gDeferredProjParams
//   float4 gDirectionalColour
//   float4 gDirectionalLight
//   float4 gFacetCentre
//   float4 gLightAmbient0
//   float4 gLightAmbient1
//   row_major float4x4 gShadowMatrix
//   float4 gShadowParam0123
//   float4 gShadowParam14151617
//   float4 gShadowParam18192021
//   float4 gShadowParam4567
//   float4 gShadowParam891113
//   sampler2D gShadowZSamplerDir
//   row_major float4x4 gViewInverse
//   float4 globalScalars
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
	// def c3, 1, 0, 1.5, 0.0833333358		//  1/12  samples
    def c3, 1, 0, 1.5, 1 					//  1/9 samples
	def c4, -0.5, 0.5, 0.0199999996, 0.00999999978
	def c5, 4, 0.75, 0.25, 5
	def c6, 10, 0, 0, 0
	def c7, 1, -1, 0, -0
	
	// 12 samples poison disk 
	def c8, -0.321940005, -0.932614982, -0.791558981, -0.597710013
	def c9, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
	// def c10, 0.519456029, 0.767022014, 0.185461, -0.893123984
	// def c11, 0.962339997, -0.194983006, 0.473434001, -0.480026007
	// def c12, -0.69591397, 0.457136989, -0.203345001, 0.620715976
	def c13, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
	
	//
	    def c97,  0.1250, 0.5, 0.25, 1 // texture rescale multiplicator
		def c96, -1, 0, 1, 2 	// pixels offsets
	
		def c10,  0.066667, 0.133333, 0.066667, 0   // 3x3 gausian filter weights
		def c11,  0.133333, 0.200000, 0.133333, 0   // 3x3 gausian filter weights
		def c12,  0.066667, 0.133333, 0.066667, 0   // 3x3 gausian filter weights

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
	// mov r1.y, c53.y
	
	// uv mapping
	mov r10.xy, r0.zw			// shadow uv
	mov r11.xy, c53.xy			// c53.xy = shadows pixel size (1/shadow_res.xy)
	mul r11.xy, r11.xy, c97.ww	// Rescale? (if necessary).
	
	// shadow filtering	
	// c110 = offsets to sample (-1 pixel to +2 pixel)
	// 16 shadow samples (r3 to r6, each is a row)
	// first row (r3 takes shadow samples, x = colum 1, y = colum 2, etc.)
	mad r2.xy, c110.xx, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r3.x, r1.z, -r7.x;
	cmp r3.x, r3.x, c3.x, c3.y;

	mad r2.xy, c110.yx, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r3.y, r1.z, -r7.x;
	cmp r3.y, r3.y, c3.x, c3.y;

	mad r2.xy, c110.zx, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r3.z, r1.z, -r7.x;
	cmp r3.z, r3.z, c3.x, c3.y;

	mad r2.xy, c110.wx, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r3.w, r1.z, -r7.x;
	cmp r3.w, r3.w, c3.x, c3.y
	           		
	// 2 row   		
	mad r2.xy, c110.xy, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r4.x, r1.z, -r7.x;
	cmp r4.x, r4.x, c3.x, c3.y;

	mad r2.xy, c110.yy, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r4.y, r1.z, -r7.x;
	cmp r4.y, r4.y, c3.x, c3.y;

	mad r2.xy, c110.zy, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r4.z, r1.z, -r7.x;
	cmp r4.z, r4.z, c3.x, c3.y;

	mad r2.xy, c110.wy, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r4.w, r1.z, -r7.x;
	cmp r4.w, r4.w, c3.x, c3.y
	           		
	// 3 row   		
	mad r2.xy, c110.xz, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r5.x, r1.z, -r7.x;
	cmp r5.x, r5.x, c3.x, c3.y;

	mad r2.xy, c110.yz, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r5.y, r1.z, -r7.x;
	cmp r5.y, r5.y, c3.x, c3.y;

	mad r2.xy, c110.zz, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r5.z, r1.z, -r7.x;
	cmp r5.z, r5.z, c3.x, c3.y;

	mad r2.xy, c110.wz, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r5.w, r1.z, -r7.x;
	cmp r5.w, r5.w, c3.x, c3.y
	           		
	// 4 row   		
	mad r2.xy, c110.xw, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r6.x, r1.z, -r7.x;
	cmp r6.x, r6.x, c3.x, c3.y;

	mad r2.xy, c110.yw, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r6.y, r1.z, -r7.x;
	cmp r6.y, r6.y, c3.x, c3.y;

	mad r2.xy, c110.zw, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r6.z, r1.z, -r7.x;
	cmp r6.z, r6.z, c3.x, c3.y;

	mad r2.xy, c110.ww, r11.xy, r10.xy;
	texld r7, r2.xy, s15;
	add r6.w, r1.z, -r7.x;
	cmp r6.w, r6.w, c3.x, c3.y
	
	// invert to texture size (1/pixel size)	
	rcp r2.x, r11.x
	rcp r2.y, r11.y
	
	mul r2.xy, r10.xy, r2.xy	// uv * texture size(2048x512)
	frc r2.xy, r2.xy			// fractional part
	add r2.xy, c7.xx, -r2.xy	// 1 - fractional part
	// fractional part of pixel coord //lrp dst, src0, src1, src2 // dest = src0 * src1 + (1-src0) * src2
	
	//vertical lerp
	lrp r7, r2.y, r3, r4		// vertical linear interpolate betwin row 1 and row 2
	lrp r8, r2.y, r4, r5		// vertical linear interpolate betwin row 2 and row 3
	lrp r9, r2.y, r5, r6		// vertical linear interpolate betwin row 3 and row 4
	
	lrp r1.x, r2.x, r7.x, r7.y	// linear interpolate betwin colum 1 e 2
	lrp r1.y, r2.x, r7.y, r7.z	// linear interpolate betwin colum 2 e 3
	lrp r1.z, r2.x, r7.z, r7.w	// linear interpolate betwin colum 3 e 4
	mul r1.w, r1.x, c10.x
	mad r1.w, r1.y, c10.y, r1.w		// add result to r1.w (linear interpolated)
	mad r1.w, r1.z, c10.z, r1.w
	
	lrp r1.x, r2.x, r8.x, r8.y
	lrp r1.y, r2.x, r8.y, r8.z
	lrp r1.z, r2.x, r8.z, r8.w
	mad r1.w, r1.x, c11.x, r1.w
	mad r1.w, r1.y, c11.y, r1.w
	mad r1.w, r1.z, c11.z, r1.w
	
	lrp r1.x, r2.x, r9.x, r9.y
	lrp r1.y, r2.x, r9.y, r9.z
	lrp r1.z, r2.x, r9.z, r9.w
	mad r1.w, r1.x, c10.x, r1.w
	mad r1.w, r1.y, c10.y, r1.w
	mad r0.z, r1.z, c10.z, r1.w
		
	// r0.z takes final shadows result	
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

