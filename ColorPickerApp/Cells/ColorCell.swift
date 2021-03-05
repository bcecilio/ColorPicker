//
//  ColorCell.swift
//  ColorPickerApp
//
//  Created by Brendon Cecilio on 2/12/21.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    public var colorBackground: UIView = {
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
        setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        addSubview(colorBackground)
        colorBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorBackground.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            colorBackground.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            colorBackground.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            colorBackground.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
