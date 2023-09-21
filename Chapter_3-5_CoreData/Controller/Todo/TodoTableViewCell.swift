//
//  TodoTableViewCell.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/13.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    static let identifier = "TodoCell"
    
    let todoSwitch = UISwitch()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        configureUI()
    }
    
    func setSwitchStace(_ isOn: Bool) {
        todoSwitch.isOn = isOn
    }
}

extension TodoTableViewCell {
    private func configureUI() {
        configureSwitch()
    }
    
    private func configureSwitch() {
        contentView.addSubview(todoSwitch)
        
        todoSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            todoSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
