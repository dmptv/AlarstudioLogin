//
//  Globals.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

internal func printMine(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    var i = items.startIndex
    repeat {
        Swift.print(items[i], separator: separator, terminator: i == (items.endIndex - 1) ? terminator : separator)
        i += 1
    } while i < items.endIndex
    #endif
}

internal func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
}

internal enum AnimationCurves: String {
    case EaseIn = "easeIn"
    case EaseOut = "easeOut"
    case EaseInOut = "easeInOut"
    case Linear = "linear"
    case Spring = "spring"
    case EaseInSine = "easeInSine"
    case EaseOutSine = "easeOutSine"
    case EaseInOutSine = "easeInOutSine"
    case EaseInQuad = "easeInQuad"
    case EaseOutQuad = "easeOutQuad"
    case EaseInOutQuad = "easeInOutQuad"
    case EaseInCubic = "easeInCubic"
    case EaseOutCubic = "easeOutCubic"
    case EaseInOutCubic = "easeInOutCubic"
    case EaseInQuart = "easeInQuart"
    case EaseOutQuart = "easeOutQuart"
    case EaseInOutQuart = "easeInOutQuart"
    case EaseInQuint = "easeInQuint"
    case EaseOutQuint = "easeOutQuint"
    case EaseInOutQuint = "easeInOutQuint"
    case EaseInExpo = "easeInExpo"
    case EaseOutExpo = "easeOutExpo"
    case EaseInOutExpo = "easeInOutExpo"
    case EaseInCirc = "easeInCirc"
    case EaseOutCirc = "easeOutCirc"
    case EaseInOutCirc = "easeInOutCirc"
    case EaseInBack = "easeInBack"
    case EaseOutBack = "easeOutBack"
    case EaseInOutBack = "easeInOutBack"
}

internal enum AnimationPresets: String {
    case SlideLeft = "slideLeft"
    case SlideRight = "slideRight"
    case SlideDown = "slideDown"
    case SlideUp = "slideUp"
    case SqueezeLeft = "squeezeLeft"
    case SqueezeRight = "squeezeRight"
    case SqueezeDown = "squeezeDown"
    case SqueezeUp = "squeezeUp"
    case FadeIn = "fadeIn"
    case FadeOut = "fadeOut"
    case FadeOutIn = "fadeOutIn"
    case FadeInLeft = "fadeInLeft"
    case FadeInRight = "fadeInRight"
    case FadeInDown = "fadeInDown"
    case FadeInUp = "fadeInUp"
    case ZoomIn = "zoomIn"
    case ZoomOut = "zoomOut"
    case Fall = "fall"
    case Shake = "shake"
    case Pop = "pop"
    case FlipX = "flipX"
    case FlipY = "flipY"
    case Morph = "morph"
    case Squeeze = "squeeze"
    case Flash = "flash"
    case Wobble = "wobble"
    case Swing = "swing"
}

internal func bannerView() {
    if let applicationDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate? {
        let rect = UIScreen.main.bounds
        var bannerHeight: CGFloat = 20.0
        if (rect.width == 375 && rect.height == 812) {
            bannerHeight = 45
        }
        
        if let window: UIWindow = applicationDelegate.window {
            let blueView = UIView(frame: CGRect(x: UIScreen.main.bounds.minX,
                                                y: UIScreen.main.bounds.minY,
                                                width: UIScreen.main.bounds.width,
                                                height: bannerHeight))
            blueView.backgroundColor = .mainBlue()
            window.addSubview(blueView)
        }
    }
}




















