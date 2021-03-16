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
    
    private var colors = [Color]() {
        didSet {
            mainView.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Colors"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(presentColorPickerVC(_:)))
        view = mainView
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(ColorCell.self, forCellWithReuseIdentifier: "colorCell")
        loadColors()
        print("COLORS: \(colors)")
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
        let colorPickerVC = ColorPickerController()
        colorPickerVC.delegate = self
        self.present(colorPickerVC, animated: true)
    }

}

extension ViewController: ColorPickerControllerDelegate {
    func createButtonPressed(vc: ColorPickerController, color: [CGFloat]) {
        let newColor = Color(color: color, colorName: "some color")
        colors.append(newColor)
        let indexPath = IndexPath(row: colors.count - 1, section: 0)
        mainView.collectionView.insertItems(at: [indexPath])
        try? dataPersistence.createItem(newColor)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as? ColorCell else {
            fatalError("could not dequeue colorCell")
        }
        let colorComponents = colors[indexPath.row].color
        let newColor = colors[indexPath.row]
        cell.colorView.backgroundColor = UIColor(components: colorComponents)
        cell.colorName.text = newColor.colorName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 3)
        return cellSize
    }
}

