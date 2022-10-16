# GTA4-Improved-Soft-Shadows
This repository provides some options to improve GTA4 EFLC shadows and remove (reduce) the pixelated aspect.

In the shader folder there are some folders with shader options to use in GTA4, just choose an option and copy the file **"deferred_lighting.fxc"** to the game folder **"GTA_IV\common\shaders\win32_30_atidx10"** (at least it's the folder that game uses for my computer), together it also has the shader assembly to be used with some shader injector.

Tested on version 1.0.8.0 with Ryzen 5600G using integrated graphics.

Some options need the d3d9.dll file to work correctly (I also provided a version without), I used a modified version of ThirteenAG's dx-wraper to unlock the original resolution of the shadow map, something that doesn't affect performance, it just prevents the game to reduce the shadow resolution by half (in GTA4 the low quality shadow is 512x512 pixels, so the game generates the shadow and rescales it to 256x256 which is useless), just copy the file **"d3d9.dll"** to the "GTAIV.exe" game executable folder.

For dual version shaders one needs this d3d9.dll to work correctly without artifacts and the other only works without this d3d9.dll due to the difference in shadow map resolution.

# Original Shadows (low, medium, high, very high)

![image](https://user-images.githubusercontent.com/38438130/196017983-310d51e3-f49f-40b7-8919-2f4803ffbc9d.png)
![image](https://user-images.githubusercontent.com/38438130/196017964-083f9eeb-ad42-41eb-9319-1ea11cbf7a93.png)
![image](https://user-images.githubusercontent.com/38438130/196017962-fbb994b5-efb6-40ae-9f91-620d0101d17a.png)
![image](https://user-images.githubusercontent.com/38438130/196017953-afce0f7e-5d59-4001-bb28-84cac5b93665.png)

Some examples of the new shadows (low, medium, high):
# Disk

![image](https://user-images.githubusercontent.com/38438130/196018700-a8c31731-dbf7-45da-bb9a-7f1c4ab305a5.png)
![image](https://user-images.githubusercontent.com/38438130/196018708-c2844355-7510-4631-b21f-52bffd1c2304.png)
![image](https://user-images.githubusercontent.com/38438130/196018722-7510b5b4-d7ed-4629-a0dc-1343f61224fd.png)

# Simple (hard) bilinear

![image](https://user-images.githubusercontent.com/38438130/196018740-f14808c7-a6ea-4aa5-9a7d-13917945a5cf.png)
![image](https://user-images.githubusercontent.com/38438130/196018751-0fbd3c88-0649-4c08-8731-ab82c3433dfb.png)
![image](https://user-images.githubusercontent.com/38438130/196018761-4008b16b-c48c-415f-a1b4-786dc36fe4f6.png)

# Soft bilinear

![image](https://user-images.githubusercontent.com/38438130/196018792-e9484d95-3c5b-4545-9c66-8d45315db4e2.png)
![image](https://user-images.githubusercontent.com/38438130/196018797-76cb84b0-b0a4-45ac-a924-c204e36bcaa5.png)
![image](https://user-images.githubusercontent.com/38438130/196018802-d01fa90c-6df6-42f3-9e0a-c0b785a4860e.png)
![image](https://user-images.githubusercontent.com/38438130/196018809-6753cfde-939f-4c37-a26f-3ab58cdaea34.png)

These new shadows are not free of artifacts (see the simple bilinear), but it is possible to see big improvements in all levels of quality (mostly low) being unnecessary very high quality for shadow (perhaps for those who play at 4k or more it will be useful I believe) .

The original low quality shadow is horrible, totally pixelated, with any of these shaders it is possible to have much higher quality without performance losses, reducing pixelation and flickering shadows.


# Todo
Achieve this result without compromising performance and without producing more glitch:
![image](https://user-images.githubusercontent.com/38438130/196019381-cbc7d0e3-ae80-4089-9b68-2a74a2cd25bf.png)
![image](https://user-images.githubusercontent.com/38438130/196019401-81e0860d-4292-4017-a232-300007520e56.png)

