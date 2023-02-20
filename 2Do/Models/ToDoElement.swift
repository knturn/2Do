//
//  ToDoElement.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import Foundation

struct ToDoElement: Identifiable, Codable {
    let id: String
    let title: String
    let isDone: Bool
    
    init(id: String = UUID().description, title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    func changeIsDone() -> ToDoElement {
        ToDoElement(id: id, title: title, isDone: !isDone)
    }
}
