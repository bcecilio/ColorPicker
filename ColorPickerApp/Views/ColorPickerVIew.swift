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
        field.backgroundColor = .white
        field.layer.cornerRadius = 6
        field.placeholder = " Name your Swatch"
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
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
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
            colorName.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            colorName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            colorName.widthAnchor.constraint(equalToConstant: 200)
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
    
    private func setupColorDisplay() {
        addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 20),
            colorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            colorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ])
    }
}
