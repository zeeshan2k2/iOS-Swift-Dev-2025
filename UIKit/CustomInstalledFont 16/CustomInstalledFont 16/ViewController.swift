//
//  ViewController.swift
//  CustomInstalledFont 16
//
//  Created by Zeeshan Waheed on 13/09/2025.
//

import UIKit

extension UIFont {
    
    convenience init(type: FontType, size: FontSize) {
        self.init(name: type.name, size: size.value)!
    }
    
    static func style(_ style: FontStyle) -> UIFont {
        return style.font
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // It's added but won't show in the Storyboard
        UIFont.familyNames.sorted().forEach { family in
            let names = UIFont.fontNames(forFamilyName: family).sorted()
            print("Family: \(family) — Fonts: \(names)")
        }
        
        // usage
        // let font = UIFont(name: "Roboto-Black", size: 16)
        
        // instead of the above implementation which is good but in some cases where there's a typo the font will return to system font, so to avoid all the refer to the Typography enum and the updated code below
        let font = UIFont(name: FontType.robotoBold.name, size: FontSize.theme(.h1).value)
        let font2 = UIFont(type: .robotoBold, size: .custom(16))
        let font3 = UIFont(type: .robotoMedium, size: .theme(.h1))
        let font4 = UIFont.style(.h1)
        
    }


}

