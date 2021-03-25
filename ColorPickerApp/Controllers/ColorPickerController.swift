//
//  ColorPickerController.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/12/21.
//

import UIKit

protocol ColorPickerControllerDelegate: AnyObject {
    func createButtonPressed(vc: ColorPickerController, color: [CGFloat], colorName: String)
}

class ColorPickerController: UIViewController {
    
    var selectedColor = UIColor.white
    var colorPicker = UIColorPickerViewController()
    
    private let pickerView = ColorPickerVIew()
    weak var delegate: ColorPickerControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pickerView
        view.backgroundColor = .white
        self.colorPicker.delegate = self
        self.colorPicker.supportsAlpha = true
        self.colorPicker.selectedColor = selectedColor
        pickerView.colorButton.addTarget(self, action: #selector(presentColorPicker(_:)), for: .touchUpInside)
        pickerView.createButton.addTarget(self, action: #selector(createButtonPressed(_:)), for: .touchUpInside)
        pickerView.colorView.backgroundColor = selectedColor
        print("SELECTED COLOR: \(selectedColor)")
    }
    
    @objc func createButtonPressed(_ sender: UIButton) {
        
        let cgColor = selectedColor.cgColor
        let components = cgColor.components!
        let newColorName = pickerView.colorName.text
        delegate?.createButtonPressed(vc: self, color: components, colorName: newColorName ?? "Some Color")
        self.dismiss(animated: true)
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
