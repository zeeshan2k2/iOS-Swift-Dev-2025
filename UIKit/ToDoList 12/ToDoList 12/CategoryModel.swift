//
//  CategoryModel.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 07/09/2025.
//

import Foundation
import UIKit

enum Category: String, CaseIterable {
    case work = "Work", study = "Study", exercise = "Exercise"
    
    var color: UIColor {
        switch self {
        case .work:
            return UIColor.Assets.work
        case .exercise:
            return UIColor.Assets.exercise
        case .study:
            return UIColor.Assets.study
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .work:
            return UIColor.Assets.secondaryWork
        case .exercise:
            return UIColor.Assets.secondaryExercise
        case .study:
            return UIColor.Assets.secondaryStudy
        }
    }
}
