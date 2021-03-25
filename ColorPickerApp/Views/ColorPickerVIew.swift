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
        field.attributedPlaceholder = NSAttributedString(string: " Name your Swatch", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        field.backgroundColor = .lightGray
        field.borderStyle = .roundedRect
        return field
    }()
    
    public var createButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
        button.setTitle("Create Swatch", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    public var colorButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "beach-ball"), for: .normal)
//        button.setTitle("create color", for: .normal)
//        button.backgroundColor = .blue
        return button
    }()
    
    public lazy var colorView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 5
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
        setupColorDisplay()
        setupColorButton()
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
            colorView.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 50),
            colorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            colorView.heightAnchor.constraint(equalToConstant: 100)
//            colorView.bottomAnchor.constraint(equalTo: colorButton.topAnchor, constant: -20)
        ])
    }
    
    private func setupColorButton() {
        addSubview(colorButton)
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorButton.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            colorButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
            colorButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),
            colorButton.widthAnchor.constraint(equalToConstant: 20),
            colorButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
