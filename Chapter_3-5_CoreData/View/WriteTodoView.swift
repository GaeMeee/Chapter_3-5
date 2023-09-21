//
//  WriteTodoView.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/21.
//

import UIKit

class WriteTodoView: UIView {

    lazy var todoTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Todo:"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    let todoTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var cateogryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category:"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    lazy var categorySegment: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentIndex = 0
        segment.insertSegment(withTitle: "Life", at: 0, animated: false)
        segment.insertSegment(withTitle: "Work", at: 1, animated: false)
        segment.insertSegment(withTitle: "Travel", at: 2, animated: false)
        segment.backgroundColor = .systemGray4
        
        return segment
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension WriteTodoView {
    private func configureUI() {
        self.backgroundColor = .white
        
        configureTodoTextLabel()
        configureTodoTextField()
        configureCategoryLabel()
        configureSegment()
    }
    
    private func configureTodoTextLabel() {
        self.addSubview(todoTextLabel)
        
        todoTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoTextLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            todoTextLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            todoTextLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            todoTextLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureTodoTextField() {
        self.addSubview(todoTextField)
        
        todoTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoTextField.centerYAnchor.constraint(equalTo: todoTextLabel.centerYAnchor),
            todoTextField.leadingAnchor.constraint(equalTo: todoTextLabel.trailingAnchor, constant: 5),
            todoTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            todoTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureCategoryLabel() {
        self.addSubview(cateogryLabel)
        
        cateogryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cateogryLabel.topAnchor.constraint(equalTo: todoTextLabel.bottomAnchor, constant: 20),
            cateogryLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cateogryLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 150),
            cateogryLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureSegment() {
        self.addSubview(categorySegment)
        
        categorySegment.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categorySegment.centerYAnchor.constraint(equalTo: cateogryLabel.centerYAnchor),
            categorySegment.leadingAnchor.constraint(equalTo: cateogryLabel.trailingAnchor, constant: 5),
            categorySegment.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            categorySegment.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
