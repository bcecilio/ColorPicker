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
    
    func createButtonPressed(vc: ColorPickerController, color: [CGFloat], colorName: String) {
        let newColor = Color(color: color, colorName: colorName)
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
        let redValue = colorComponents[0]
        let greenValue = colorComponents[1]
        let blueValue = colorComponents[2]
        cell.redComponent.text = String(format: "red: %.2f", redValue)
        cell.greenComponent.text = String(format: "green: %.2f", greenValue)
        cell.blueComponent.text = String(format: "blue: %.2f", blueValue)
        cell.layer.cornerRadius = 15.0
//        cell.layer.borderWidth = 0.0
//        cell.layer.shadowColor = UIColor.lightGray.cgColor
//        cell.layer.shadowOffset = CGSize(width: 6, height: 5)
//        cell.layer.shadowRadius = 5.0
//        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = CGSize(width: collectionView.frame.width - 60, height: 400)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1
        }
    }
}

