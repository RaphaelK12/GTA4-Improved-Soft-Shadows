//
// Generated by RAGE Shader Editor 1.0.1
    ps_3_0
    def c0, -0.5, -1.5, 1.5, 0.5
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0.25, 1, 256, 0
    def c3, 0, 2, 4, 8
    def c4, 256, 2, 4, 8
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    texld r0, v0, s1
    add r0.y, -c73.x, c73.y
    rcp r0.y, r0.y
    mad r0.x, c73.y, -r0.y, r0.x
    mul r0.y, r0.y, c73.y
    mul r0.y, r0.y, -c73.x
    rcp r0.x, r0.x
    mad r0.x, r0.y, r0.x, -c74.w
    mov r1, c0
    mad r0.x, c74.y, -r1.w, r0.x
    max r2.x, r0.x, c1.x
    rcp r0.x, c74.z
    mul r0.x, r2.x, r0.x
    lrp r2.x, r0.x, c75.z, c75.y
    min r0.x, c75.z, r2.x
    mul r0.x, r0.x, r0.x
    mad r0.yz, c72.xxyw, r1.xxyw, v0.xxyw
    texld r2, r0.yzzw, s2
    dp3 r3.x, r2, c1.yzww
    mad r0.yz, c72.xxyw, r1.xzxw, v0.xxyw
    texld r4, r0.yzzw, s2
    dp3 r3.y, r4, c1.yzww
    mad r0.yz, c72.xxyw, r1.xwzw, v0.xxyw
    texld r5, r0.yzzw, s2
    dp3 r3.z, r5, c1.yzww
    mad r0.yz, c72.xxyw, r1.xyww, v0.xxyw
    texld r1, r0.yzzw, s2
    dp3 r3.w, r1, c1.yzww
    dp4 r0.y, r3, c2.x
    add r3, r3, -r0.y
    dp4 r0.z, r3, r3
    texld r3, v0, s2
    dp3 r0.w, r3, c1.yzww
    add r0.y, -r0.y, r0.w
    mad r0.y, r0.y, r0.y, -r0.z
    cmp r0.x, r0.y, c2.y, r0.x
    add r0.y, -r0.x, c2.y
    mul r0.z, r0.x, c2.x
    mul r6.xyz, r2, r0.z
    texld r7, v0, s0
    mov r7.yz, c2
    mad r8, r7.w, -r7.z, c3
    mad r9, r7.w, -c4.x, c4.yzwx
    cmp r9, r9, -c2.y, -c2.w
    cmp r8, r8, c2.y, c2.w
    add r8, r9, r8
    mul r8, r8, c0.x
    mul r2.xyz, r2, r8.x
    mad r2.xyz, r3, c0.w, r2
    mad r2.xyz, r4, r8.y, r2
    mad r2.xyz, r5, r8.z, r2
    mad r2.xyz, r1, r8.w, r2
    dp4 r0.w, r8, c2.y
    add r0.w, r0.w, c0.w
    rcp r0.w, r0.w
    mul r2.xyz, r2, r0.w
    mad r2.xyz, r2, r0.y, r6
    mad r2.xyz, r4, r0.z, r2
    mad r2.xyz, r5, r0.z, r2
    mad r1.yzw, r1.xxyz, r0.z, r2.xxyz
    mul r1.x, r0.x, r1.y
    texld r0, v0, s3
    texld r2, c1.x, s4
    rcp r0.w, r2.x
    mul r0.w, r0.w, c76.y
    rcp r1.y, r0.w
    mul r1.y, r1.y, c76.x
    mad r0.xyz, r0, c66.x, -r1.y
    mul r2.xyz, r0, c76.z
    mul r2.xyz, r2, c2.x
    cmp r0.xyz, r0, r2, c1.x
    mad r0.xyz, r1.xzww, c66.x, r0
    mul r1.xyz, r0.w, r0
    dp3 r1.x, r1, c1.yzww
    mad r0.xyz, r0, r0.w, -r1.x
    mad r0.xyz, c77.x, r0, r1.x
    mul r0.w, r1.x, c79.w
    mov_sat r1.x, r1.x
    mad r0.xyz, c79, -r0.w, r0
    mul r1.yzw, r0.w, c79.xxyz
    mov_sat r0.w, r0.w
    mad r0.xyz, r0.w, r0, r1.yzww
    mul r0.xyz, r0, c78
    add r0.xyz, r0, r0
    add r0.w, -r7.y, c77.z
    pow r2.x, r1.x, r0.w
    mul oC0.xyz, r0, r2.x
    mov oC0.w, c2.y

// approximately 90 instruction slots used (9 texture, 81 arithmetic)
 