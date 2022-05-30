//
//  ListViewModel.swift
//  TodoList_MVVM
//
//  Created by 江啟綸 on 2022/5/29.
//

import Foundation

/*
 CRUD FUNCTIONs
 
 create
 read
 update
 delete
 
 */


class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItem()
    }
    
    func getItem() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is second", isCompleted: true),
//            ItemModel(title: "This is the third", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
