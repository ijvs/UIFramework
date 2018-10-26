# UIFramework

## Concepts

### Cocoa Touch Framework vs. Cocoa Touch Static Library

A. A static library is a collection of compiled source files which is then linked directly into an app’s binary. That is, it becomes a part of your app’s binary. A framework is a standalone entity that contains a binary containing compiled code (along with any related resources) that is a standalone unit itself.

B. Cocoa Touch Frameworks are supported from iOS 8 onwards. If you need to support iOS versions before iOS 8, you should consider using a Cocoa Touch Static Library and writing your code in Objective-C.

C. Cocoa Touch Static Libraries do not support Swift. So if you decide to use a Cocoa Touch Static Library, you need to use Objective-C.

D. Frameworks also require less manual work to setup in a project than static libraries.

**Source:** [Create Cocoa Touch Framework and publish it. Rageeni Jadan](https://medium.com/@Rageeni16/create-cocoa-touch-framework-and-publish-it-be9ad6535f33)

### IBDesignable & IBInspectable

**IBDesignable** and **IBInspectable** are attributes used by **Interface Builder**, but different than IBOutlet and IBAction that are attributes too, IBInspectable and IBDesignable are used to render elements directly in Interface Builder.


**Source:** [What’s IBDesignable / IBInspectable? Geraldo Bastos](https://medium.com/@GeraldoBastos/whats-ibdesignable-ibinspectable-292829384e1)

### NibDesignable
Elegant way of enabling IBDesignable on your nib-based views

Repo: https://github.com/mbogh/NibDesignable
