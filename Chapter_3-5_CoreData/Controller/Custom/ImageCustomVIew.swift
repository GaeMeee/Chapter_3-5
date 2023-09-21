//
//  ImageCustomVIew.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/18.
//

import UIKit

class ImageCustomVIew: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Grid")
        return imageView
    }()
    
    init(imageString: String) {
        super.init(frame: .zero)
        self.imageView.image = UIImage(named: imageString)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ImageCustomVIew {
    func configureUI() {
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 22.5),
            imageView.heightAnchor.constraint(equalToConstant: 22.5)
        ])
    }
}
