//
//  CustomView.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/15.
//

import UIKit

class CustomStackView: UIStackView {
    
    // MARK: - Property
    let countText: String
    let labelText: String
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = countText
        label.font = UIFont.systemFont(ofSize: 16.5, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = labelText
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    init(countText: String, labelText: String) {
        self.countText = countText
        self.labelText = labelText
        
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - AutoLayout
private extension CustomStackView {
    func configureUI() {
        axis = .vertical
        distribution = .fillEqually
        
        addArrangedSubview(countLabel)
        addArrangedSubview(label)
    }
}
