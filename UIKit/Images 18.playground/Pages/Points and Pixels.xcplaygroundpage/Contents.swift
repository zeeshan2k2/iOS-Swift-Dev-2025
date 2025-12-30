/*:
# Points and Pixels - Why We Need @2x and @3x Icons
 
 ## The Problem of Higher Pixel Density

 Why do we have to create @2x and @3x icons? Well, not too long ago, all iPhones had a standard resolution. However, all this changed when the iPhone 4 was released. The iPhone 4 came with retina display with twice as many pixels as before. More pixels meant that graphics appeared clearer to users but what this also meant was that graphics on a non-retina device will smaller on a retina display. For example, a 100px by 100px image on a non-retina device would look like a 50px by 50px image even though its actual size is still 100px by 100px. Things only got worse with the introduction of the iPhone 6 Plus which had three times as many pixels as the older devices.
 
 ## How Points Solved Differing Pixel Densities

 To ensure that graphics displayed at the correct size regardless of device, Apple came up with the system of points. A point is a device independent measurement. On non-retina devices 1 point is equal to 1 pixel. On retina devices like iPhone 4, 5 and 6 - 1 point is equal to 2 pixels. And on much larger devices like iPhone 6 Plus with higher pixel density 1 point is equal to 3 pixels.

 This change has important implications for the images we export to Xcode. We should always ensure that we supply images at @2x and @3x scales (in reality we do not have to worry about @1x image scales because these support the very old non-retina iPhones which you aren't able to target). When we do this, Xcode will handle ensuring the correct scaled image is supplied to the device the user is using.
*/
/*:
 ![points](points.png)
*/
/*:
 So for example, if we create an image with a size of 100px by 100px, then we should export it to Xcode as a @2x image at 200px by 200px and a @3x image at 300px by 300px.
*/
/*:
 ![slots](slots.png)
*/
/*:
 The benefits of the point system are not limited to just the iPhone. They also extend to the iPad. The following is a list of the image scales Apple expects us to export our images at for iPhone and iPad. By simply exporting our images at @2x and @3x scales we support all iOS devices.
*/
/*:
 ![scalefactor](scalefactor.png)
*/
/*:
## Do We Need to Rescale our Interface Objects Too?

 So if we have to rescale our images, do we need to make the same consideration for the interface objects we use in Xcode? Fortunately we do not. The drawing coordinate space used by our interface objects is measured in points. Native drawing technologies like Core Graphics (we will be learning more about this later in the course) take into account the scale of the device for you to ensure all interface objects appear at the correct size irregardless of device.
*/
/*:
 ![size](size.png)
*/
