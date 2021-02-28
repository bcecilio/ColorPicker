//
//  Filemanager + Extensions.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/27/21.
//

import Foundation

public enum Directory{
    case documentsDirectory
    case cacheDirectory
}

extension FileManager {
    
    // this function gets a URL path to the documents directory
    // this is an type method - works on the type FileManager
    public static func getDocumentsDirectory() -> URL {
        // (singleton - design pattern)
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    public static func getCacheDirectory() -> URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }
    
    public static func getPath(with fileName: String, for directory: Directory) -> URL {
        
        switch directory {
        case .documentsDirectory:
            return getDocumentsDirectory().appendingPathComponent(fileName)
        case .cacheDirectory:
            return getDocumentsDirectory().appendingPathComponent(fileName)
        }
    }
}
