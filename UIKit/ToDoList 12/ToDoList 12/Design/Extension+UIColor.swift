//
//  Colors.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 28/12/2025.
//

import Foundation
import UIKit

extension UIColor {
    enum Assets {
        static let work = UIColor(named: "work")!
        static let secondaryWork = UIColor(named: "work")!.withAlphaComponent(0.2)
        static let study = UIColor(named: "study")!
        static let secondaryStudy = UIColor(named: "study")!.withAlphaComponent(0.2)
        static let exercise = UIColor(named: "exercise")!
        static let secondaryExercise = UIColor(named: "exercise")!.withAlphaComponent(0.2)
        static let secondaryLink = UIColor(named: "secondaryLink")!
    }
}



// old code gave erros in Swift 6
// this pattern (UIColor.work) causes name-lookup ambiguity in Swift 6 when enum cases or other symbols share the same names. Newer Swift versions are stricter about resolving shorthand enum cases and static members, so namespaced access (e.g. UIColor.Assets.work) is safer and future-proof.

//extension UIColor {
//    
//    static var work: UIColor {
//        return UIColor(named: "work")!
//    }
//    
//    static var exercise: UIColor {
//        return UIColor(named: "exercise")!
//    }
//    
//    static var study: UIColor {
//        return UIColor(named: "study")!
//    }
//}
