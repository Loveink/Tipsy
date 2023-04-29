//
//  ViewController.swift
//  Tipsy
//
//  Created by Александра Савчук on 24.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    private lazy var billTotalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.text = "Enter bill total"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var billTotalTextField: UITextField = {
        let text = UITextField()
        text.text = "0.0"
        text.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        text.textColor = .lightGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var calculateView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BillView")
        view.isUserInteractionEnabled  = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private lazy var selectTipLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.text = "Select tip"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var percentButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var zeroButton: Buttons = {
        let button = Buttons(title: "0%")
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        return button
    }()
    private lazy var tenButton: Buttons = {
        let button = Buttons(title: "10%")
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        return button
    }()
    private lazy var twentyButton: Buttons = {
        let button = Buttons(title: "20%")
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        return button
    }()
    private lazy var chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.text = "Choose Split"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var splitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 27
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var splitNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        label.text = "\(Int(chooseSplitStepper.value))"
        label.textColor = UIColor(named: "GreenTextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chooseSplitStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 2
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "GreenTextColor")
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled  = true
        button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subviews()
        setupConstraints()
    }
    
    private func subviews() {
        view.addSubview(billTotalLabel)
        view.addSubview(billTotalTextField)
        view.addSubview(calculateView)
        calculateView.addSubview(selectTipLabel)
        calculateView.addSubview(percentButtonsStackView)
        calculateView.addSubview(chooseSplitLabel)
        calculateView.addSubview(splitStackView)
        calculateView.addSubview(calculateButton)
        percentButtonsStackView.addArrangedSubview(zeroButton)
        percentButtonsStackView.addArrangedSubview(tenButton)
        percentButtonsStackView.addArrangedSubview(twentyButton)
        splitStackView.addSubview(splitNumberLabel)
        splitStackView.addArrangedSubview(chooseSplitStepper)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            calculateView.topAnchor.constraint(equalTo: billTotalTextField.bottomAnchor, constant: 40),
            calculateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculateView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            billTotalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            billTotalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            billTotalLabel.heightAnchor.constraint(equalToConstant: 30),
            
            billTotalTextField.topAnchor.constraint(equalTo: billTotalLabel.bottomAnchor, constant: 10),
            billTotalTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            billTotalTextField.heightAnchor.constraint(equalToConstant: 48),
            
            selectTipLabel.topAnchor.constraint(equalTo: calculateView.topAnchor, constant: 20),
            selectTipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            selectTipLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            selectTipLabel.heightAnchor.constraint(equalToConstant: 30),
            
            percentButtonsStackView.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 20),
            percentButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            percentButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            percentButtonsStackView.heightAnchor.constraint(equalToConstant: 30),
            
            chooseSplitLabel.topAnchor.constraint(equalTo: percentButtonsStackView.bottomAnchor, constant: 30),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            chooseSplitLabel.heightAnchor.constraint(equalToConstant: 30),
            
            splitStackView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 20),
            //            splitStackView.widthAnchor.constraint(equalToConstant: 214),
            splitStackView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: 30),
            splitStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            splitNumberLabel.widthAnchor.constraint(equalToConstant: 94),
            splitNumberLabel.heightAnchor.constraint(equalToConstant: 29),
            splitNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            
            chooseSplitStepper.widthAnchor.constraint(equalToConstant: 94),
            chooseSplitStepper.heightAnchor.constraint(equalToConstant: 29),
            chooseSplitStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            
            zeroButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
            zeroButton.heightAnchor.constraint(equalToConstant: 54),
            tenButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
            tenButton.heightAnchor.constraint(equalToConstant: 54),
            twentyButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
            twentyButton.heightAnchor.constraint(equalToConstant: 54),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = "\(numberOfPeople)"
    }
    
    @objc func tipChanged(_ sender: UIButton) {
        billTotalTextField.endEditing(true)
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @objc func calculatePressed(_ sender: UIButton) {
        let bill = billTotalTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        let vc = SecondViewController()
        vc.result = finalResult
        vc.tip = Int(tip * 100)
        vc.split = numberOfPeople
        present(vc, animated: true)
    }
}
