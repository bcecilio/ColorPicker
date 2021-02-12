//
//  ColorPickerVIew.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/12/21.
//

import UIKit

class ColorPickerVIew: UIView {

    public var colorName: UITextField = {
        let field = UITextField()
        return field
    }()
    
    public var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Swatch", for: .normal)
        return button
    }()
    
    private lazy var colorDisplay : UIColor = {
        let color = UIColor()
        return color
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
//        backgroundColor = .white
        setupTextField()
        setupButton()
    }
    
    private func setupTextField() {
        addSubview(colorName)
        colorName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            colorName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            colorName.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupButton() {
        addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
