//
//  DataStorage.swift
//  demo06
//
//  Created by 宋晓明 on 2025/9/28.
//

import SwiftData
import Foundation
import Combine

@Model
final class NotesModel: ObservableObject {
    var fileName: String
    var fileData: String
    var content: [String]
    var date: Date
    var star: Bool
    
    init(fileName: String, fileData: String, content: [String],date: Date, star: Bool) {
        self.fileName = fileName
        self.fileData = fileData
        self.content = content
        self.date = date
        self.star = star
    }
}

class DataTools: ObservableObject {
    static var shared = DataTools()
    @Published var container: ModelContainer?
    @Published var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(for: NotesModel.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print(error)
        }
    }
    
    func insert(item: NotesModel) {
        context?.insert(item)
        print("Added:\(item.fileName)")
        save()
    }
    
    func togglestar(item: NotesModel) {
        let notesModel = NotesModel(fileName: item.fileName, fileData: item.fileData, content: item.content, date: item.date, star: item.star)
        update(item: notesModel)
    }
    
    func update(item: NotesModel) {
        let list = getItems()
        for m in list {
            if m.fileName == item.fileName {
                context?.delete(m)
                context?.insert(item)
                print("Changed:\(m.fileName)")
                save()
                return
            }
        }
        save()
    }
    
    func delete(item: NotesModel) {
        let list = getItems()
        for m in list {
            if m.fileName == item.fileName {
                context?.delete(m)
                print("Deleted:\(m.fileName)")
                save()
                return
            }
        }
        save()
    }
    
    func find(item: NotesModel) -> Bool {
        let list = getItems()
        if list.isEmpty {
            return false
        }
        for m in list {
            if m.fileName == item.fileName {
                return true
            }
        }
        return false
    }
    
    func getItems() -> [NotesModel] {
        let descriptor = FetchDescriptor(sortBy: [SortDescriptor<NotesModel>(\.date)])
        do {
            guard let data = try context?.fetch(descriptor) else { return [] }
            return data
        } catch {
            print(error)
        }
        return []
    }
    
    func save() {
        do {
            try context?.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func DeveloperUse_Print(){
            var i = 0
            for item in getItems(){
                i += 1
                print("---------------[",i,"]----------------")
                print("Name:",item.fileName)
                print("Date",item.date)
                print("Content",item.content)
                print("Starred",item.star)
            }
        }
}
