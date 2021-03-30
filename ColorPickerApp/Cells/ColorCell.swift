//
//  ColorCell.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/12/21.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    public var colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        return view
    }()
    
    public var colorName: UILabel = {
        let text = UILabel()
        text.textColor = #colorLiteral(red: 0.878004849, green: 0.8727861047, blue: 0.8820168376, alpha: 1)
        text.textAlignment = .center
        text.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        return text
    }()
    
    private lazy var rgbContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.addArrangedSubview(redComponent)
        stackView.addArrangedSubview(greenComponent)
        stackView.addArrangedSubview(blueComponent)
        return stackView
    }()
    
    public var redComponent: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = .white
        label.text = "red:"
        return label
    }()
    
    public var greenComponent: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = .white
        label.text = "green:"
        return label
    }()
    
    public var blueComponent: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = .white
        label.text = "blue:"
        return label
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
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        setupColorView()
        setupColorName()
        setupComponents()
    }
    
    private func setupColorName() {
        colorView.addSubview(colorName)
        colorName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorName.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 10),
            colorName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            colorName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            colorName.bottomAnchor.constraint(equalTo: colorView.topAnchor, constant: 20)
        ])
    }
    
    private func setupColorView() {
        addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            colorView.topAnchor.constraint(equalTo: topAnchor),
//            colorView.heightAnchor.constraint(equalTo: heightAnchor, constant: 80),
            colorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            colorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func setupComponents() {
        colorView.addSubview(rgbContainer)
        rgbContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rgbContainer.topAnchor.constraint(equalTo: colorName.bottomAnchor, constant: 20),
            rgbContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rgbContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            rgbContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
