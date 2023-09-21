//
//  ImageCollectionViewCell.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/18.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "imageCell"
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ImageCollectionViewCell {
    func configureUI() {
        configureImageView()
    }
    
    func configureImageView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
