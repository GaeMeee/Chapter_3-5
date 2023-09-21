//
//  MainView.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/21.
//

import UIKit

class MainView: UIView {
    
// MARK: - Properties
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var showTodoListButton: UIButton = {
        let button = UIButton()
        button.setTitle("할 일 작성하기", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.tintColor.cgColor
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(showTodoListVC), for: .touchUpInside)
        return button
    }()
    
    lazy var showCompleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료한 할 일 보기", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.tintColor.cgColor
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(showCompleteTodoVC), for: .touchUpInside)
        return button
    }()
    
    lazy var showCatImageViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("🐈", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.tintColor.cgColor
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(showCatImageVC), for: .touchUpInside)
        return button
    }()

    lazy var showProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("ProfileDesignViewController", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.tintColor.cgColor
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(showMyProfileVC), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - AutoLayOut

private extension MainView {
    private func configureUI() {
        self.backgroundColor = .white
        
        configureImageView()
        configureShowWriteButton()
        configureShowCompleteButton()
        configureShowCatImageButton()
        configureShowProfileButtoN()
    }
    
    private func configureImageView() {
        self.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureShowWriteButton() {
        self.addSubview(showTodoListButton)
        
        showTodoListButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showTodoListButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            showTodoListButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            showTodoListButton.widthAnchor.constraint(equalToConstant: 150),
            showTodoListButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureShowCompleteButton() {
        self.addSubview(showCompleteButton)
        
        showCompleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showCompleteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            showCompleteButton.topAnchor.constraint(equalTo: showTodoListButton.bottomAnchor, constant: 50),
            showCompleteButton.widthAnchor.constraint(equalToConstant: 200),
            showCompleteButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureShowCatImageButton() {
        self.addSubview(showCatImageViewButton)
        
        showCatImageViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showCatImageViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            showCatImageViewButton.topAnchor.constraint(equalTo: showCompleteButton.bottomAnchor, constant: 50),
            showCatImageViewButton.widthAnchor.constraint(equalToConstant: 50),
            showCatImageViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureShowProfileButtoN() {
        self.addSubview(showProfileButton)
        
        showProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showProfileButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            showProfileButton.topAnchor.constraint(equalTo: showCatImageViewButton.bottomAnchor, constant: 50),
            showProfileButton.widthAnchor.constraint(equalToConstant: 300),
            showProfileButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
