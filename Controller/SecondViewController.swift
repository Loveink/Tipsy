//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Александра Савчук on 24.04.2023.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    var resultBillView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BillView")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = UIColor(named: "GrayTextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "56.32"
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        label.textColor = UIColor(named: "GreenTextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var splitLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Split between 2 people,\nwith 10% tip."
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textColor = UIColor(named: "GrayTextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "GreenTextColor")
        button.setTitle("Recalculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        button.addTarget(self, action: #selector(tapRecalculateButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subviews()
        setupConstraints()
        updateUI()
    }
    
    private func subviews() {
        view.addSubview(resultBillView)
        view.addSubview(splitLabel)
        view.addSubview(recalculateButton)
        resultBillView.addSubview(totalPerPersonLabel)
        resultBillView.addSubview(resultLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            resultBillView.topAnchor.constraint(equalTo: view.topAnchor),
            resultBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultBillView.heightAnchor.constraint(equalToConstant: 300),
            
            splitLabel.heightAnchor.constraint(equalToConstant: 117),
            splitLabel.topAnchor.constraint(equalTo: resultBillView.bottomAnchor, constant: 5),
            splitLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            splitLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            
            totalPerPersonLabel.centerYAnchor.constraint(equalTo: resultBillView.centerYAnchor),
            totalPerPersonLabel.centerXAnchor.constraint(equalTo: resultBillView.centerXAnchor),
            
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            resultLabel.centerXAnchor.constraint(equalTo: resultBillView.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: totalPerPersonLabel.bottomAnchor),
        ])
    }
    
    func updateUI() {
        resultLabel.text = result
        splitLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @objc func tapRecalculateButton() {
        dismiss(animated: true)
    }
}


