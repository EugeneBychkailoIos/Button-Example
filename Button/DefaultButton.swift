//
//  DefaultButton.swift
//
//  Created by jekster on 9/2/21.
//

import UIKit

class DefaultButton: UIButton {
    
    // MARK: - Nested Types
    
    enum ButtonStyle {
        case contained
        case outlined
        case empty
        case withImage
        case genderButton
        case emptyRed
    }
    
    // MARK: - Public properties
    
    override var isHighlighted: Bool {
        didSet {
            layer.borderColor = isHighlighted ?
                Asset.Color.easternBlue.color.cgColor :
                Asset.Color.ballBlue.color.cgColor
        }
    }
    
    // MARK: - Public methods
    
    func setUp(style: ButtonStyle, title: String, image: UIImage? = nil) {
        NavvarHeadingStyle.apply(to: self)
        switch style {
        case .contained:
            setupContainedStyle()
        case .outlined:
            setupOutlinedStyle()
        case .empty:
            setupEmptyStyle()
        case .withImage:
            setupWithImageStyle(image: image ?? UIImage())
        case .genderButton:
            setupGenderButton()
        case .emptyRed:
            setupEmptyRedButton()
        }
        setTitle(title, for: .normal)
        layer.cornerRadius = frame.height / 2
    }
    
    func canBeEnabled(value: Bool) {
        isEnabled = value
    }
    
    // MARK: - Private methods
    
    private func setupContainedStyle() {
        setBackgroundImage(Asset.Color.ballBlue.color.image(), for: .normal)
        setBackgroundImage(Asset.Color.easternBlue.color.image(), for: .highlighted)
        layer.masksToBounds = true
        setTitleColor(Asset.Color.aliceBlue.color, for: .normal)
    }
    
    private func setupOutlinedStyle() {
        layer.borderWidth = 2
        isHighlighted = false
        setTitleColor(Asset.Color.ballBlue.color, for: .normal)
        setTitleColor(Asset.Color.easternBlue.color, for: .highlighted)
    }
    
    private func setupEmptyStyle() {
        setTitleColor(Asset.Color.ballBlue.color, for: .normal)
        setTitleColor(Asset.Color.easternBlue.color, for: .highlighted)
    }
    
    private func setupWithImageStyle(image: UIImage) {
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 0)
        semanticContentAttribute = .forceRightToLeft
        setBackgroundImage(Asset.Color.ballBlue.color.image(), for: .normal)
        setBackgroundImage(Asset.Color.easternBlue.color.image(), for: .highlighted)
        layer.masksToBounds = true
        setTitleColor(Asset.Color.aliceBlue.color, for: .normal)
    }
    
    private func setupGenderButton() {
        InputTextStyle.apply(to: self)
        setBackgroundImage(UIColor.clear.image(), for: .normal)
        setBackgroundImage(Asset.Color.ballBlue.color.image(), for: .selected)
        layer.borderWidth = 1.0
        layer.borderColor = Asset.Color.ballBlue.color.cgColor
        let titleColor = isSelected ? Asset.Color.aliceBlue.color : Asset.Color.ballBlue.color
        setTitleColor(titleColor, for: .normal)
        if isSelected {
            layer.borderWidth = 0.0
        }
        layer.masksToBounds = true
    }
    
    private func setupEmptyRedButton() {
        MainTextStyle.apply(to: self)
        backgroundColor = UIColor.white
        setTitleColor(Asset.Color.beanRed.color, for: .normal)
    }
}
