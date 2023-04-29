//
//  Buttons.swift
//  Tipsy
//
//  Created by Александра Савчук on 29.04.2023.
//


import UIKit

class Buttons: UIButton {
    
    let color = UIColor(named: "GreenTextColor")
    
    convenience init(title: String, type: UIButton.ButtonType = .system) {
        self.init(type: type)
        setupButton(with: title)
    }
    
    private func setupButton(with title: String) {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 35)

        if title == "Calculate" || title == "Recalculate" {
            backgroundColor = color
            layer.cornerRadius = 10
            setTitleColor(.white, for: .normal)
        } else {
            tintColor = color
            setTitleColor(color, for: .normal)
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
}

