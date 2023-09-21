//
//  Task.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/13.
//

import CoreData
import UIKit

struct TaskModel: Equatable {
    var todoText: String
    var isSwitch: Bool
    var category: Category = .none
    
    init(todoText: String, isSwitch: Bool, category: Category) {
        self.todoText = todoText
        self.isSwitch = isSwitch
        self.category = category
    }
}

enum Category: String, CaseIterable {
    case none
    case work
    case life
    case travel
}
