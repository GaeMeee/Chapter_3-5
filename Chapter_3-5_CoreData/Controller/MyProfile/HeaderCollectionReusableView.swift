//
//  HeaderCollectionReusableView.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/18.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "headerCRV"
    
    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "코주부 원숭이")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 44
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        return imageView
    }()
    
    private lazy var userFollowInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    let userNameLable: UILabel = {
        let label = UILabel()
        label.text = "르탄이"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let userDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var userUrlText: UILabel = {
        let label = UILabel()
        label.text = "GitHub Link"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 14)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userUrlTextTapped))
        
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var chevronDownButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var navGalleyStackView: UIStackView = {
        let view = UIStackView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Action
extension HeaderCollectionReusableView {
    @objc func userUrlTextTapped() {
        if let url = URL(string: "https://github.com/GaeMeee") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Layout
private extension HeaderCollectionReusableView {
    func configureUI() {
        backgroundColor = .white
        configureMyImageView()
        configureUserFollowInfo()
        configureInfoStackView()
        confingureFollowButton()
        configureMessageButton()
        configureChevronDownButton()
        configureNavGalleyView()
        
    }
    
    func configureMyImageView() {
        addSubview(myImageView)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            myImageView.widthAnchor.constraint(equalToConstant: 88),
            myImageView.heightAnchor.constraint(equalToConstant: 88)
        ])
    }
    
    func configureUserFollowInfo() {
        addSubview(userFollowInfoStackView)
        
        userFollowInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userFollowInfoStackView.topAnchor.constraint(equalTo: myImageView.centerYAnchor, constant: -20.5),
            userFollowInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130),
            userFollowInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            userFollowInfoStackView.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        configureCustomStackView()
    }
    
    func configureCustomStackView() {
        let postCustomStackView = CustomStackView(countText: "7", labelText: "post")
        let followerCustomStackView = CustomStackView(countText: "0", labelText: "follower")
        let followingCustomStackView = CustomStackView(countText: "0", labelText: "following")
        
        userFollowInfoStackView.addArrangedSubview(postCustomStackView)
        userFollowInfoStackView.addArrangedSubview(followerCustomStackView)
        userFollowInfoStackView.addArrangedSubview(followingCustomStackView)
    }
    
    func configureInfoStackView() {
        addSubview(userInfoStackView)
        
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInfoStackView.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 15),
            userInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            userInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            userInfoStackView.heightAnchor.constraint(equalToConstant: 59)
        ])
        
        configureUserInfo()
    }
    
    func configureUserInfo() {
        userInfoStackView.addArrangedSubview(userNameLable)
        userInfoStackView.addArrangedSubview(userDescriptionLabel)
        userInfoStackView.addArrangedSubview(userUrlText)
    }
    
    func confingureFollowButton() {
        addSubview(followButton)
        
        followButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 5),
            followButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            followButton.widthAnchor.constraint(equalToConstant: 150),
            followButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureMessageButton() {
        addSubview(messageButton)
        
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageButton.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 5),
            messageButton.leadingAnchor.constraint(equalTo: followButton.trailingAnchor, constant: 15),
            messageButton.widthAnchor.constraint(equalToConstant: 150),
            messageButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureChevronDownButton() {
        addSubview(chevronDownButton)
        
        chevronDownButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chevronDownButton.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 5),
            chevronDownButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 15),
            chevronDownButton.widthAnchor.constraint(equalToConstant: 30),
            chevronDownButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
    }
    
    func configureNavGalleyView() {
        addSubview(navGalleyStackView)
        
        navGalleyStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let gridImageView = ImageCustomVIew(imageString: "Grid")
        
        navGalleyStackView.addArrangedSubview(gridImageView)
        navGalleyStackView.addArrangedSubview(UIView())
        navGalleyStackView.addArrangedSubview(UIView())
        
        NSLayoutConstraint.activate([
            navGalleyStackView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 10),
            navGalleyStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navGalleyStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navGalleyStackView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
