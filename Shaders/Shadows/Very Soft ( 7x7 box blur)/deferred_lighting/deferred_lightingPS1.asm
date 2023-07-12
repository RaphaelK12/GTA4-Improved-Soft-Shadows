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
    def c3, 1, 0, 1.5, 0.0204081632653 		//  1/49 samples
	def c4, -0.5, 0.5, 0.0199999996, 0.00999999978
	def c5, 4, 0.75, 0.25, 5
	def c6, 10, 0, 0, 0
	def c7, 1, -1, 0, -0
	
	// 12 samples poison disk 
	def c8, -0.321940005, -0.932614982, -0.791558981, -0.597710013
	def c9, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
	def c10, 0.519456029, 0.767022014, 0.185461, -0.893123984
	def c11, 0.962339997, -0.194983006, 0.473434001, -0.480026007
	def c12, -0.69591397, 0.457136989, -0.203345001, 0.620715976
	def c13, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
	
	//
	    def c97,  0.1250, 0.5, 0.25, 1 // texture rescale multiplicator



	
	// 7x7
	// def c101, -3, -2,-1, 0 	// pixels offsets
	// def c102, -3, -2, 1, 2 	// pixels offsets
	// def c103, -3, -2, 3, 4 	// pixels offsets
	// def c104, -1,  0, 1, 2 	// pixels offsets
	// def c105, -1,  0, 3, 4 	// pixels offsets
	// def c106,  1,  2, 3, 4 	// pixels offsets

	// added this
	// constantes 9x9
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
	//
	// posi��o das amostras  9x9	
    // 0   c100.xx  c100.yx  c100.zx  c100.wx  c101.zx  c101.wx  c102.zx  c102.wx  c103.zx  c103.wx  
    // 1   c100.xy  c100.yy  c100.zy  c100.wy  c101.zy  c101.wy  c102.zy  c102.wy  c103.zy  c103.wy  
    // 2   c100.xz  c100.yz  c100.zz  c100.wz  c104.zx  c104.wx  c105.zx  c105.wx  c106.zx  c106.wx  
    // 3   c100.xw  c100.yw  c100.zw  c100.ww  c104.zy  c104.wy  c105.zy  c105.wy  c106.zy  c106.wy  
    // 4   c101.xz  c101.yz  c104.xz  c104.yz  c101.zz  c101.wz  c107.zx  c107.wx  c108.zx  c108.wx  
    // 5   c101.xw  c101.yw  c104.xw  c104.yw  c101.zw  c101.ww  c107.zy  c107.wy  c108.zy  c108.wy  
    // 6   c102.xz  c102.yz  c105.xz  c105.yz  c107.xz  c107.yz  c102.zz  c102.wz  c109.zx  c109.wx  
    // 7   c102.xw  c102.yw  c105.xw  c105.yw  c107.xw  c107.yw  c102.zw  c102.ww  c109.zy  c109.wy  
    // 8   c103.xz  c103.yz  c106.xz  c106.yz  c108.xz  c108.yz  c109.xz  c109.yz  c103.zz  c103.wz  
    // 9   c103.xw  c103.yw  c106.xw  c106.yw  c108.xw  c108.yw  c109.xw  c109.yw  c103.zw  c103.ww  

	//  7x7    x   y  z  w
	//      -3       -2        -1       0        1        2        3        4      
	// -3   c100.yy  c100.zy  c100.wy  c101.zy  c101.wy  c102.zy  c102.wy  c103.zy 
	// -2   c100.yz  c100.zz  c100.wz  c104.zx  c104.wx  c105.zx  c105.wx  c106.zx 
	// -1   c100.yw  c100.zw  c100.ww  c104.zy  c104.wy  c105.zy  c105.wy  c106.zy 
	//  0   c101.yz  c104.xz  c104.yz  c101.zz  c101.wz  c107.zx  c107.wx  c108.zx 
	//  1   c101.yw  c104.xw  c104.yw  c101.zw  c101.ww  c107.zy  c107.wy  c108.zy 
	//  2   c102.yz  c105.xz  c105.yz  c107.xz  c107.yz  c102.zz  c102.wz  c109.zx 
	//  3   c102.yw  c105.xw  c105.yw  c107.xw  c107.yw  c102.zw  c102.ww  c109.zy 
	//  4   c103.yz  c106.xz  c106.yz  c108.xz  c108.yz  c109.xz  c109.yz  c103.zz 
	
	//  5x5
	//       -2       -1       0        1        2        3 
	//   -2  c100.zz  c100.wz  c104.zx  c104.wx  c105.zx  c105.wx
	//   -1  c100.zw  c100.ww  c104.zy  c104.wy  c105.zy  c105.wy
	//    0  c104.xz  c104.yz  c101.zz  c101.wz  c107.zx  c107.wx
	//    1  c104.xw  c104.yw  c101.zw  c101.ww  c107.zy  c107.wy
	//    2  c105.xz  c105.yz  c107.xz  c107.yz  c102.zz  c102.wz
	//    3  c105.xw  c105.yw  c107.xw  c107.yw  c102.zw  c102.ww

	// 3x3
	//       -1       0        1        2        
	//   -1  c110.xx  c110.yx  c110.zx  c110.wx  
	//    0  c110.xy  c110.yy  c110.zy  c110.wy  
	//    1  c110.xz  c110.yz  c110.zz  c110.wz  
	//    2  c110.xw  c110.yw  c110.zw  c110.ww  
	
	
    // def c10,  0.066667, 0.133333, 0.066667, 0   // 3x3 gausian filter weights
    // def c11,  0.133333, 0.200000, 0.133333, 0   // 3x3 gausian filter weights
    // def c12,  0.066667, 0.133333, 0.066667, 0   // 3x3 gausian filter weights

	// 5x5 gausian filter weights
	// def c100, 0.003906,  0.015625,  0.023438,  0.015625
	// def c101, 0.003906,  0.015625,  0.062500,  0.093750 
	// def c102, 0.062500,  0.015625,  0.023438,  0.093750 
	// def c103, 0.140625,  0.093750,  0.023438,  0.015625 
	// def c104, 0.062500,  0.093750,  0.062500,  0.015625
	// def c105, 0.003906,  0.015625,  0.023438,  0.015625 
	// def c106, 0.003906, 0,0,0
	// def c101, -3, -2,-1, 0 	// pixels offsets
	// def c102, -3, -2, 1, 2 	// pixels offsets
	// def c103, -3, -2, 3, 4 	// pixels offsets
	// def c104, -1,  0, 1, 2 	// pixels offsets
	// def c105, -1,  0, 3, 4 	// pixels offsets
	// def c106,  1,  2, 3, 4 	// pixels offsets


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




	// invert to texture size (1/pixel size)
	rcp r7.x, r11.x
	rcp r7.y, r11.y
		 
	mul r7.xy, r10.xy, r7.xy		// uv * texture size(2048x512)
	frc r7.xy, r7.xy			// fractional part
	add r7.xy, c7.xx, -r7.xy	// 1 - fractional part


	// 64 shadow samples (r20 to r23, each is a row)
	// first row (r20 r21 takes shadow samples, x = colum 1, y = colum 2, etc.)
	mad r2.xy, c100.yy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.x, r1.z, -r8.x;
	cmp r20.x, r20.x, c3.x, c3.y;

	mad r2.xy, c100.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.y, r1.z, -r8.x;
	cmp r20.y, r20.y, c3.x, c3.y;

	mad r2.xy, c100.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.z, r1.z, -r8.x;
	cmp r20.z, r20.z, c3.x, c3.y;

	mad r2.xy, c101.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.w, r1.z, -r8.x;
	cmp r20.w, r20.w, c3.x, c3.y;

	mad r2.xy, c101.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.x, r1.z, -r8.x;
	cmp r21.x, r21.x, c3.x, c3.y;

	mad r2.xy, c102.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.y, r1.z, -r8.x;
	cmp r21.y, r21.y, c3.x, c3.y;

	mad r2.xy, c102.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.z, r1.z, -r8.x;
	cmp r21.z, r21.z, c3.x, c3.y;

	mad r2.xy, c103.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.w, r1.z, -r8.x;
	cmp r21.w, r21.w, c3.x, c3.y
	// 2 row   		                                                                                
	mad r2.xy, c100.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.x, r1.z, -r8.x;
	cmp r22.x, r22.x, c3.x, c3.y;

	mad r2.xy, c100.zz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.y, r1.z, -r8.x;
	cmp r22.y, r22.y, c3.x, c3.y;

	mad r2.xy, c100.wz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.z, r1.z, -r8.x;
	cmp r22.z, r22.z, c3.x, c3.y;

	mad r2.xy, c104.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.w, r1.z, -r8.x;
	cmp r22.w, r22.w, c3.x, c3.y;

	mad r2.xy, c104.wx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.x, r1.z, -r8.x;
	cmp r23.x, r23.x, c3.x, c3.y;

	mad r2.xy, c105.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.y, r1.z, -r8.x;
	cmp r23.y, r23.y, c3.x, c3.y;

	mad r2.xy, c105.wx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.z, r1.z, -r8.x;
	cmp r23.z, r23.z, c3.x, c3.y;

	mad r2.xy, c106.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.w, r1.z, -r8.x;
	cmp r23.w, r23.w, c3.x, c3.y
               		
							lrp r30,   r7.y, r20, r22
							lrp r31,   r7.y, r21, r23
							lrp r6.w, r7.x, r30.x, r30.y
               		
							lrp r6.z, r7.x, r30.y, r30.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.z, r30.w;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.w, r31.x;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.x, r31.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.y, r31.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.z, r31.w;
	add r6.w, r6.w, r6.z
	           		
	// 3	   		
	mad r2.xy, c100.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.x, r1.z, -r8.x;
	cmp r20.x, r20.x, c3.x, c3.y;

	mad r2.xy, c100.zw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.y, r1.z, -r8.x;
	cmp r20.y, r20.y, c3.x, c3.y;

	mad r2.xy, c100.ww, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.z, r1.z, -r8.x;
	cmp r20.z, r20.z, c3.x, c3.y;

	mad r2.xy, c104.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.w, r1.z, -r8.x;
	cmp r20.w, r20.w, c3.x, c3.y;

	mad r2.xy, c104.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.x, r1.z, -r8.x;
	cmp r21.x, r21.x, c3.x, c3.y;

	mad r2.xy, c105.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.y, r1.z, -r8.x;
	cmp r21.y, r21.y, c3.x, c3.y;

	mad r2.xy, c105.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.z, r1.z, -r8.x;
	cmp r21.z, r21.z, c3.x, c3.y;

	mad r2.xy, c106.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.w, r1.z, -r8.x;
	cmp r21.w, r21.w, c3.x, c3.y
	           		
							lrp r30,   r7.y, r22, r20
							lrp r31,   r7.y, r23, r21
							lrp r6.z, r7.x, r30.x, r30.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.y, r30.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.z, r30.w;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.w, r31.x;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.x, r31.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.y, r31.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.z, r31.w;
	add r6.w, r6.w, r6.z
	           		
	// 4       		                                                                                 
	mad r2.xy, c101.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.x, r1.z, -r8.x;
	cmp r22.x, r22.x, c3.x, c3.y;

	mad r2.xy, c104.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.y, r1.z, -r8.x;
	cmp r22.y, r22.y, c3.x, c3.y;

	mad r2.xy, c104.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.z, r1.z, -r8.x;
	cmp r22.z, r22.z, c3.x, c3.y;

	mad r2.xy, c101.zz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.w, r1.z, -r8.x;
	cmp r22.w, r22.w, c3.x, c3.y;

	mad r2.xy, c101.wz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.x, r1.z, -r8.x;
	cmp r23.x, r23.x, c3.x, c3.y;

	mad r2.xy, c107.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.y, r1.z, -r8.x;
	cmp r23.y, r23.y, c3.x, c3.y;

	mad r2.xy, c107.wx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.z, r1.z, -r8.x;
	cmp r23.z, r23.z, c3.x, c3.y;

	mad r2.xy, c108.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.w, r1.z, -r8.x;
	cmp r23.w, r23.w, c3.x, c3.y
	           		
							lrp r30,   r7.y, r20, r22
							lrp r31,   r7.y, r21, r23
							lrp r6.z, r7.x, r30.x, r30.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.y, r30.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.z, r30.w;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.w, r31.x;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.x, r31.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.y, r31.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.z, r31.w;
	add r6.w, r6.w, r6.z
	           		
	// 5       		
	mad r2.xy, c101.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.x, r1.z, -r8.x;
	cmp r20.x, r20.x, c3.x, c3.y;

	mad r2.xy, c104.xw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.y, r1.z, -r8.x;
	cmp r20.y, r20.y, c3.x, c3.y;

	mad r2.xy, c104.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.z, r1.z, -r8.x;
	cmp r20.z, r20.z, c3.x, c3.y;

	mad r2.xy, c101.zw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.w, r1.z, -r8.x;
	cmp r20.w, r20.w, c3.x, c3.y;

	mad r2.xy, c101.ww, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.x, r1.z, -r8.x;
	cmp r21.x, r21.x, c3.x, c3.y;

	mad r2.xy, c107.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.y, r1.z, -r8.x;
	cmp r21.y, r21.y, c3.x, c3.y;

	mad r2.xy, c107.wy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.z, r1.z, -r8.x;
	cmp r21.z, r21.z, c3.x, c3.y;

	mad r2.xy, c108.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.w, r1.z, -r8.x;
	cmp r21.w, r21.w, c3.x, c3.y
	           		
							lrp r30,   r7.y, r22, r20
							lrp r31,   r7.y, r23, r21
							lrp r6.z, r7.x, r30.x, r30.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.y, r30.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.z, r30.w;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.w, r31.x;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.x, r31.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.y, r31.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.z, r31.w;
	add r6.w, r6.w, r6.z
	           		
	// 6       		                                                                      
	mad r2.xy, c102.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.x, r1.z, -r8.x;
	cmp r22.x, r22.x, c3.x, c3.y;

	mad r2.xy, c105.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.y, r1.z, -r8.x;
	cmp r22.y, r22.y, c3.x, c3.y;

	mad r2.xy, c105.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.z, r1.z, -r8.x;
	cmp r22.z, r22.z, c3.x, c3.y;

	mad r2.xy, c107.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.w, r1.z, -r8.x;
	cmp r22.w, r22.w, c3.x, c3.y;

	mad r2.xy, c107.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.x, r1.z, -r8.x;
	cmp r23.x, r23.x, c3.x, c3.y;

	mad r2.xy, c102.zz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.y, r1.z, -r8.x;
	cmp r23.y, r23.y, c3.x, c3.y;

	mad r2.xy, c102.wz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.z, r1.z, -r8.x;
	cmp r23.z, r23.z, c3.x, c3.y;

	mad r2.xy, c109.zx, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.w, r1.z, -r8.x;
	cmp r23.w, r23.w, c3.x, c3.y
	           		
							lrp r30,   r7.y, r20, r22
							lrp r31,   r7.y, r21, r23
							lrp r6.z, r7.x, r30.x, r30.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.y, r30.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.z, r30.w;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.w, r31.x;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.x, r31.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.y, r31.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.z, r31.w;
	add r6.w, r6.w, r6.z
	           		
	// 7       		                                                                      
	mad r2.xy, c102.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.x, r1.z, -r8.x;
	cmp r20.x, r20.x, c3.x, c3.y;

	mad r2.xy, c105.xw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.y, r1.z, -r8.x;
	cmp r20.y, r20.y, c3.x, c3.y;

	mad r2.xy, c105.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.z, r1.z, -r8.x;
	cmp r20.z, r20.z, c3.x, c3.y;

	mad r2.xy, c107.xw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r20.w, r1.z, -r8.x;
	cmp r20.w, r20.w, c3.x, c3.y;

	mad r2.xy, c107.yw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.x, r1.z, -r8.x;
	cmp r21.x, r21.x, c3.x, c3.y;

	mad r2.xy, c102.zw, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.y, r1.z, -r8.x;
	cmp r21.y, r21.y, c3.x, c3.y;

	mad r2.xy, c102.ww, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.z, r1.z, -r8.x;
	cmp r21.z, r21.z, c3.x, c3.y;

	mad r2.xy, c109.zy, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r21.w, r1.z, -r8.x;
	cmp r21.w, r21.w, c3.x, c3.y
	           		
							lrp r30,   r7.y, r22, r20
							lrp r31,   r7.y, r23, r21
							lrp r6.z, r7.x, r30.x, r30.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.y, r30.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.z, r30.w;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r30.w, r31.x;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.x, r31.y;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.y, r31.z;
	add r6.w, r6.w, r6.z;

							lrp r6.z, r7.x, r31.z, r31.w;
	add r6.w, r6.w, r6.z
	           		
	// 8       		                                                                      
	mad r2.xy, c103.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.x, r1.z, -r8.x;
	cmp r22.x, r22.x, c3.x, c3.y;

	mad r2.xy, c106.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.y, r1.z, -r8.x;
	cmp r22.y, r22.y, c3.x, c3.y;

	mad r2.xy, c106.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.z, r1.z, -r8.x;
	cmp r22.z, r22.z, c3.x, c3.y;

	mad r2.xy, c108.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r22.w, r1.z, -r8.x;
	cmp r22.w, r22.w, c3.x, c3.y;

	mad r2.xy, c108.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.x, r1.z, -r8.x;
	cmp r23.x, r23.x, c3.x, c3.y;

	mad r2.xy, c109.xz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.y, r1.z, -r8.x;
	cmp r23.y, r23.y, c3.x, c3.y;

	mad r2.xy, c109.yz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.z, r1.z, -r8.x;
	cmp r23.z, r23.z, c3.x, c3.y;

	mad r2.xy, c103.zz, r11.xy, r10.xy;
	texld r8, r2.xy, s15;
	add r23.w, r1.z, -r8.x;
	cmp r23.w, r23.w, c3.x, c3.y
	
	lrp r30,   r7.y, r20, r22
	lrp r31,   r7.y, r21, r23
	lrp r6.z, r7.x, r30.x, r30.y;
	add r6.w, r6.w, r6.z;

	lrp r6.z, r7.x, r30.y, r30.z;
	add r6.w, r6.w, r6.z;

	lrp r6.z, r7.x, r30.z, r30.w;
	add r6.w, r6.w, r6.z;

	lrp r6.z, r7.x, r30.w, r31.x;
	add r6.w, r6.w, r6.z;

	lrp r6.z, r7.x, r31.x, r31.y;
	add r6.w, r6.w, r6.z;

	lrp r6.z, r7.x, r31.y, r31.z;
	add r6.w, r6.w, r6.z;

	lrp r6.z, r7.x, r31.z, r31.w;
	add r0.z, r6.w, r6.z
	

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

