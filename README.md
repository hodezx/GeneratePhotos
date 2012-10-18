GeneratePhotos
==============

Populate photos for the iOS simulator

Will let the photos in the test_photos directory get into the iOS simulator for testing with lots of photos.
To change how many photos(could be dublicated) you want for you simulator, simply call debugWritePicture in ViewController.m the same times.

Obviously what matters are the two functions in ViewController.m:
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
- (void) debugWritePicture;

Just copy this two functions to your dummy project and do the magic.
Should work for any SDK.

Tested on iOS 5.1, Xcode 4.5.