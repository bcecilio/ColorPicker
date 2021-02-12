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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
