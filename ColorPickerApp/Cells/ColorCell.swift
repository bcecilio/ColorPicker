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
        view.layer.cornerRadius = 15
        return view
    }()
    
    public var colorName: UILabel = {
        let text = UILabel()
        text.textColor = .white
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
    
    public var redComponent: UIView = {
        let view = UIView()
        return view
    }()
    
    public var greenComponent: UIView = {
        let view = UIView()
        return view
    }()
    
    public var blueComponent: UIView = {
        let view = UIView()
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
        setupColorView()
        setupColorName()
//        setupComponents()
    }
    
    private func setupColorName() {
        colorView.addSubview(colorName)
        colorName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            colorName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            colorName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            colorName.bottomAnchor.constraint(equalTo: colorView.topAnchor, constant: 20)
        ])
    }
    
    private func setupColorView() {
        addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: topAnchor),
//            colorView.heightAnchor.constraint(equalTo: heightAnchor, constant: 80),
            colorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            colorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func setupComponents() {
        addSubview(rgbContainer)
        rgbContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rgbContainer.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            rgbContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rgbContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}
