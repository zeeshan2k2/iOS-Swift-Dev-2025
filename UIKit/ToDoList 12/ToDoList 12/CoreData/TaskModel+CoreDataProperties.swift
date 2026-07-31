//
//  TaskModel+CoreDataProperties.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 24/02/2026.
//
//

public import Foundation
public import CoreData


public typealias TaskModelCoreDataPropertiesSet = NSSet

extension TaskModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskModel> {
        return NSFetchRequest<TaskModel>(entityName: "TaskModel")
    }

    @NSManaged public var category: String
    @NSManaged public var caption: String
    @NSManaged public var createdDate: Date
    @NSManaged public var isComplete: Bool

}

extension TaskModel : Identifiable {

}
