/*:
# UIImage and Assets Catalog
 
Images are defined and managed using *UIImage*. In your own apps, you will typically create an image using symbols or your own assets.
 
## SF Symbols
 
SF symbols are pre-installed vector based icons in Xcode you can use in your own applications. The complete list of icons is available in the [SF Symbols app](https://developer.apple.com/sf-symbols/).
*/
/*:
![assets](assets.png)
*/
/*:
 To create an image using SF symbols, you use the `systemName` initializer of UIImage and supply the name of the symbol you want to use.
 
 ```
 UIImage(systemName: "person.fill")
 ```
 
 SF symbols are vector images meaning you can configure their color using the `tintColor` property.
 
 ```
 let image = UIImage(systemName: "person.fill")
 let imageView = UIImageView(image: image)
 imageView.tintColor = UIColor.systemYellow
 ```
 
 Although SF symbols are images they support similar characteristics to text. For example, you can:
 
 * Apply a font text style to a symbol image
 * Apply a font weight
 * Scale and style symbols to match the text you use
 
 
### Symbol Configuration
 
SF symbol configuration can be used to adjust properties of a SF Symbol such as size, scale and attributes to match text.
 
```
 //change size to 35
 let config = UIImage.SymbolConfiguration(pointSize: 35)
 let image = UIImage(systemName: "person.fill", withConfiguration: config)
```
 
```
 //change size to match title text style
 let config = UIImage.SymbolConfiguration(textStyle: .title)
 let image = UIImage(systemName: "person.fill", withConfiguration: config)
```
 
## Custom Images
 
 You can add your own images to the Assets catalog or as part of the app bundle. Xcode accepts images in the jpg, png, pdf or svg format.
*/
/*:
  ![sf](sf.png)
*/
/*:
### Png and Jpg
 
Png and jpg images are bitmap images. Bitmaps are a matrix of rows and columns where each intersection is painted with color. Bitmaps are best used with highly detailed images. Jpg in particular is best suited for images like photos and pictures. Png can be used for photos and pictures where transparency needs to be supported. Png is a good choice for icons and small assets.
 
Png and jpg images should be imported at @1x, @2x and @3x resolutions in the assets catalog. This is to allow Xcode to create multiple variations of the same image and load the appropriate one according to device and platform.
 
### Svg and Pdf
 
Svg and Pdf are vector images. Vector images are mathematical representations of shapes and glyphs that form an image. Svg and pdf images are able to scale automatically so there is no need to supply @1x, @2x and @3x variations. Instead, you should choose the *Single Scales* option and supply just one image.
 
Svg and pdf have the added benefit of templating. This allows you to change the color of a pdf or svg image by changing its tint color. This is acheived by changing the images render option to *Always Template*.
 
Although svg and pdf are a tempting option to use for all your images because they only need a single vector, there are complications that arise. Vector images are converted into bitmaps at compile time. Sometimes, the vector image may mix vector and bitmap parts during resizing which may lead to strange results. There are also issues with details like masks and gradients in the vector image. To avoid some of these issues, make sure the *Preserve Vector Data* option is selected which makes the vector image scale at runtime instead of compile time.
 
Svg and pdf are great options for small images like icons. Svg and pdf are similar under the hood so there aren't many drawbacks to using either. Svg will only work for iOS 13 and higher so if you need to support lower versions you should use pdf.
 
## App Icons
 
Every app needs an app icon before submission to the App Store. Starting with Xcode 14 you only need to supply a single 1024x1024 image which will be converted to multiple app icon sizes that support different devices and platforms.
 
## Naming Images
 
Naming conventions vary but a good rule to follow is to name your images by what they look like and not their function. You should not include the image extension e.g png. The name should be all lower case and should include dashes in between words.
 
*/
