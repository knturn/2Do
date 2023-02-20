//
//  ListViewModel.swift
//  2Do
//
//  Created by Turan, Kaan on 16.02.2023.
//

import Foundation
class ListViewModel: ObservableObject {
    private let itemsKey = "todo_array"
    @Published var items: [ToDoElement] = [] {
        didSet {
            saveElements()
        }
    }
    
    init() {
        getItems()
    }
    func getItems() {
        guard let itemsData = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([ToDoElement].self, from: itemsData) else { return }
        items = savedItems
    }
    func addNewItem(with title: String) {
        let newItem = ToDoElement(title: title, isDone: false)
        items.append(newItem)
    }
    
    func deleteElement(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveElement(from indexSet: IndexSet, to int: Int) {
        items.move(fromOffsets: indexSet, toOffset: int)
    }
    func changeIsDone(item: ToDoElement) {
        guard let index = items.firstIndex(where: {$0.id == item.id}) else { return }
        items[index] = item.changeIsDone()
    }
    func saveElements() {
        guard let encodedData = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(encodedData, forKey: itemsKey)
    }
}
