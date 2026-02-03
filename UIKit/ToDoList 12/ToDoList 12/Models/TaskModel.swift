//
//  TaskModel.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 08/09/2025.
//

import Foundation
import RealmSwift

struct Task {
    let id: String
    let category: Category
    let caption: String
    let createdDate: Date
    var isComplete: Bool
}

class LocalTask: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var category = Category.study
    @Persisted var caption: String = ""
    @Persisted var createdDate = Date()
    @Persisted var isComplete = false
}
