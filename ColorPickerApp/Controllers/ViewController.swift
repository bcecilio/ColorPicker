//
//  ViewController.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainView = MainView()
    public var dataPersistence = DataPersistence<Color>(filename: "colors.plist")
    
    private var colors = [Color]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Colors"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(presentColorPickerVC(_:)))
        view = mainView
        // print path to document's directory
        // print("PATH TO DOCUMENT DIRECTORY \(FileManager.getDocumentsDirectory())")
        loadColors()
    }
    
    private func newColorWillBeAdded(segue: UIStoryboardSegue) {
        // reference to ColorPickerController instance
        guard let colorPickerController = segue.source as? ColorPickerController else {
            print("could not create new color")
            return
        }
        let newColor = colorPickerController.colorPicker.selectedColor
        let cgColor = newColor.cgColor
        let components = cgColor.components!
        createNewColor(color: Color(color: components, colorName: "some color"))
    }
    
    private func loadColors() {
        do {
            colors = try dataPersistence.loadItems()
            mainView.collectionView.reloadData()
        } catch {
            print("loading items error: \(error)")
        }
    }
    
    func createNewColor(color: Color) {
        colors.append(color)
        let indexPath = IndexPath(row: colors.count - 1, section: 0)
        mainView.collectionView.insertItems(at: [indexPath])
        try? dataPersistence.createItem(color)
    }

    @objc private func presentColorPickerVC(_ sender: UIBarButtonItem) {
        self.present(ColorPickerController(), animated: true)
    }

}

