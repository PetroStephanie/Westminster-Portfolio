//
//  MyToDoList.swift
//  Assignment Tabler
//
//  Created by Stephanie Petrosyants on 6/3/19.
//  Copyright © 2019 CSLocal. All rights reserved.
//

import Foundation

class ToDoItem {
    
    var title: String
    var done: Bool


public init(title: String) {
    
    self.title = title
    self.done = false
    
    }
}
// displays data in the application
extension ToDoItem {
    
    public class func getMockData() -> [ToDoItem] {
    
    return [
    
    ToDoItem(title: "Bread"),
    ToDoItem(title: "Milk"),
    ToDoItem(title: "Batteries"),
    ToDoItem(title: "Apples")
    ]
    
    }
}
