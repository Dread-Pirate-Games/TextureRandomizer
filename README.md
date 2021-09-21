# TextureRandomizer
A Roblox plugin to randomize the placement of textures on repetitive parts.

## Background 
I like to use my own textures on things because I find the base part textures too limiting. However, when you use textures on things like stairs, you can wind up with a repetitive texture that really stands out. Here is an example:

![image](https://user-images.githubusercontent.com/82744105/134180584-1100653e-7569-4914-a815-d50f2501f3b3.png)

I got tired of manually going back and editing textures because I had lots of stairs, and each step had two textures in it. And if I didn’t want to edit each one individually, I still ended up with some obvious repetition. So, I created the Texture Randomizer.

## Here’s how it works:

You select the items you want to edit, which can be the Texture instances themselves or the parents of the Texture instances. You can select any number at a time. You click on the plugin, and it prompts you for an upper and lower range of values for OffsetStuds and StudsPerTile for both U and V. The plugin then generates a random number between those two numbers and replaces the values in the Texture instance. The random number is a decimal number to reduce any coincidental repetition.

![image](https://user-images.githubusercontent.com/82744105/134180604-2fb2fa15-6ac7-40ff-8fa9-02197b086ad1.png)

You will need to know the appropriate values to plug in for the lower and upper bounds, but the good news is, if you do it and any textures look stretched or otherwise weird, you can change the values and run it again!

## Here is the result:

![image](https://user-images.githubusercontent.com/82744105/134180637-1f76e2f1-895b-4467-a030-0e4dc7188168.png)

## Here is the link to the plugin:

https://www.roblox.com/library/7510389078/Texture-Randomizer 
