//
//  ViewController.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Colors"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(presentColorPickerVC(_:)))
        view = mainView
    }

    @objc private func presentColorPickerVC(_ sender: UIBarButtonItem) {
        self.present(ColorPickerController(), animated: true)
    }

}

