//
//  ColorPickerController.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/12/21.
//

import UIKit

class ColorPickerController: UIViewController {
    
    var selectedColor = UIColor.orange
    var colorPicker = UIColorPickerViewController()
    
    private let pickerView = ColorPickerVIew()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pickerView
        view.backgroundColor = .systemGreen
        self.colorPicker.delegate = self
        self.colorPicker.supportsAlpha = true
        self.colorPicker.selectedColor = selectedColor
//        self.present(UIColorPickerViewController, animated: true)
        pickerView.colorView.backgroundColor = selectedColor
    }
    
    private func presentColorPicker(_ sender: UIButton) {
        
        present(self.colorPicker, animated: true)
    }

}

extension ColorPickerController: UIColorPickerViewControllerDelegate {
    
}
