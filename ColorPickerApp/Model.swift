//
//  Model.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/27/21.
//

import Foundation
import UIKit

struct Color: Codable, Equatable {
    let color: [CGFloat]
    let colorName: String
}

//struct Color: Codable, Equatable {
//
//    var color: UIColor {
//        return UIColor()
//    }
//    let colorName: String
//}
