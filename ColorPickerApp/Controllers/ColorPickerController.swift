//
//  ColorPickerController.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/12/21.
//

import UIKit

class ColorPickerController: UIViewController {
    
    private let pickerView = ColorPickerVIew()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pickerView
        view.backgroundColor = .systemGreen
    }

}
