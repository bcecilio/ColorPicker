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
        pickerView.colorButton.addTarget(self, action: #selector(presentColorPicker(_:)), for: .touchUpInside)
        pickerView.colorView.backgroundColor = selectedColor
        print("SELECTED COLOR: \(selectedColor)")
    }
    
    @objc private func presentColorPicker(_ sender: UIButton) {
        
        present(self.colorPicker, animated: true)
    }

}

extension ColorPickerController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        pickerView.colorView.backgroundColor = selectedColor
    }
}
