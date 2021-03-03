//
//  PersistanceHelper.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/28/21.
//

import Foundation

typealias Writable = Codable & Equatable

class DataPersistence<T: Writable> {
    
    private var items = [T]()
    private let filename: String
    
    public init(filename: String) {
        self.items = []
        self.filename = filename
    }
    
    // CRUD
    
    // save item
    private func saveItemToDocumentsDirectory() throws {
        do {
            let url = FileManager.getPath(with: filename, for: .documentsDirectory)
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: url, options: .atomic)
        } catch {
            print("cannot save item")
        }
    }
    
    // Create
    public func createItem(_ item: T) throws {
        items.append(item)
        do {
            try saveItemToDocumentsDirectory()
        } catch {
            print("cannot create item")
        }
    }
    
    // Read - load items from documentsDirectory
    public func loadItems() throws -> [T] {
        let path = FileManager.getPath(with: filename, for: .documentsDirectory).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    items = try PropertyListDecoder().decode([T].self, from: data)
                } catch {
                    print("cannot load items")
                }
            }
        }
        return items
    }
    
    // Update - update items from documentsDirectory
    
    // Delete - delete items from documentsDirectory
}
