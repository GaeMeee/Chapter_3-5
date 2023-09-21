//
//  MyProfileViewController.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/15.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    // MARK: - Property
    private lazy var imageCollectionView: UICollectionView = {
        let collecitonView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewFlow())
        collecitonView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collecitonView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collecitonView.dataSource = self
        collecitonView.delegate = self
        return collecitonView
    }()
    
    private lazy var navBarView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var navBarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        return imageView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        configureUI()
    }
}

// MARK: - AutoLayout
private extension MyProfileViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        self.navigationItem.title = "UserName"
        
        configureImageCollectionView()
//        configureNavBar()
    }
    
    func configureImageCollectionView() {
        view.addSubview(imageCollectionView)
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureCollectionViewFlow() -> UICollectionViewFlowLayout{
        
        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.scrollDirection = .vertical
        collectionViewLayer.minimumLineSpacing = 2
        collectionViewLayer.minimumInteritemSpacing = 2
        
        return collectionViewLayer
    }
    
    func configureNavBar() {
        view.addSubview(navBarView)

        navBarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            navBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            navBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        configureNavBarImageView()
    }

    func configureNavBarImageView() {
        navBarView.addSubview(navBarImageView)

        navBarImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            navBarImageView.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor),
            navBarImageView.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor),
            navBarImageView.widthAnchor.constraint(equalToConstant: 22.5),
            navBarImageView.heightAnchor.constraint(equalToConstant: 22.5)
        ])
    }
}


extension MyProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        
        cell.imageView.image = UIImage(named: "코주부 원숭이")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader, let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 265)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imageCollectionView.frame.width / 3 - 2, height: imageCollectionView.frame.width / 3 - 2)
    }
}

extension MyProfileViewController {
    @objc func userUrlTextTapped() {
        if let url = URL(string: "https://github.com/GaeMeee") {
            UIApplication.shared.open(url)
        }
    }
}
