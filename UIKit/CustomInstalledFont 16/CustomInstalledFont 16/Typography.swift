////
////  Typography.swift
////  CustomInstalledFont 16
////
////  Created by Zeeshan Waheed on 14/09/2025.
////
//
//
//import Foundation
//import UIKit
//
//
//enum FontType: String {
//    
//    case robotoRegular = "Roboto-Regular"
//    case robotoMedium = "Roboto-Medium"
//    case robotoBold = "Roboto-Bold"
//    
//}
//
//extension FontType {
//    
//    var name: String {
//        return self.rawValue
//    }
//}
//
//
//enum FontSize {
//    case custom(Double)
//    case theme(FontStyle)
//}
//
//extension FontSize {
//    
//    var value: Double {
//        switch self {
//        case .custom(let customSize):
//            return customSize
//        case .theme(let size):
//            return size.size
//        }
//    }
//}
//
//
//enum FontStyle {
//    
//    case h1
//    case h2
//    case h3
//    case body
//    case secondaryText
//    case caption
//    
//}
//
//
//extension FontStyle {
//    
//    var size: Double {
//        switch self {
//        case .h1:
//            return 32
//        case .h2:
//            return 32
//        case .h3:
//            return 32
//        case .body:
//            return 16
//        case .secondaryText:
//            return 14
//        case .caption:
//            return 12
//        }
//    }
//    
//    private var fontDescription: FontDescription {
//        switch self {
//        case .h1:
//            return FontDescription(font: .robotoBold, size: .theme(.h1), style: .title1)
//        case .h2:
//            return FontDescription(font: .robotoMedium, size: .theme(.h2), style: .title2)
//        case .h3:
//            return FontDescription(font: .robotoMedium, size: .theme(.h3), style: .title3)
//        case .body:
//            return FontDescription(font: .robotoRegular, size: .theme(.body), style: .body)
//        case .secondaryText:
//            return FontDescription(font: .robotoRegular, size: .theme(.secondaryText), style: .body)
//        case .caption:
//            return FontDescription(font: .robotoMedium, size: .theme(.caption), style: .caption1)
//        }
//    }
//    
//    var font: UIFont {
//        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size.value) else {
//            return UIFont.preferredFont(forTextStyle: fontDescription.style)
//        }
//        let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
//        return fontMetrics.scaledFont(for: font)
//    }
//}
//
//
//private struct FontDescription {
//    let font: FontType
//    let size: FontSize
//    let style: UIFont.TextStyle
//}
