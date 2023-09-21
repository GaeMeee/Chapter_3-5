//
//  DataManager.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/13.
//

import UIKit
//import CoreData

class TodoRepository {
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var todoList: [TaskModel] = []
    var completedTodoList: [TaskModel] = []
    
//    var todoCoreDataList: [TaskCoreData]?
    
    
    func addTask(_ todo: TaskModel) {
        todoList.append(todo)
    }
    
//    func addCoreData(_ todo: TaskModel) {
//        let task = TaskCoreData(context: context)
//        task.title = todo.todoText
//        task.isComplete = todo.isSwitch
//        task.category = todo.category.rawValue
//
//        do {
//            try context.save()
//            print(task)
//        } catch {
//            print(error)
//        }
//    }
    
//    func fetchTaskCoreData(tableView: UITableView) {
//        do {
//            self.todoCoreDataList = try context.fetch(TaskCoreData.fetchRequest())
//
//            DispatchQueue.main.async {
//                tableView.reloadData()
//            }
//        } catch {
//
//        }
//    }
    
    func filterCategory(_ category: Category) -> [TaskModel] {
        return todoList.filter { $0.category == category }
    }
    
//    func filterCore(_ category: Category) -> [TaskCoreData] {
//        return (todoCoreDataList?.filter { $0.category == category.rawValue })
//    }
    
    func completeTask(_ index: Int) {
        if index >= 0 && index < todoList.count {
            let completeTodo = todoList.remove(at: index)
            completedTodoList.append(completeTodo)
        }
    }
    
    func completeCore(_ index: Int) {
        if index >= 0 && index < todoList.count {
//            let completeCore = context.delete(todoCoreDataList![index])
            let completeTodo = todoList.remove(at: index)
            completedTodoList.append(completeTodo)
        }
    }
    
    func removeTaskFromTodoList(_ task: TaskModel?) {
        if let taskToRemove = task, let index = todoList.firstIndex(of: taskToRemove) {
            todoList.remove(at: index)
        }
    }
    
    func removeTaskFromCompletedTodoList(_ task: TaskModel?) {
        if let taskToRemove = task, let index = completedTodoList.firstIndex(of: taskToRemove) {
            completedTodoList.remove(at: index)
        }
    }
    
    func editTaks(index: Int, newTitle: String, newCategory: Category) {
        if index >= 0 && index < todoList.count {
            todoList[index].todoText = newTitle
            todoList[index].category = newCategory
        }
    }
}
