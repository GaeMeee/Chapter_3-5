//
//  CatImageViewController.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/14.
//

import UIKit

class CatImageViewController: UIViewController {
    
    let placeholderImage = UIImage(systemName: "photo")
    let randomImageApi: String = "https://api.thecatapi.com/v1/images/search"
    
    let imageLoder: ImageLoder
    
    init(imageLoder: ImageLoder) {
        self.imageLoder = imageLoder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let catImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonTapped))
    }
}

extension CatImageViewController {
    @objc func refreshButtonTapped() {
        catImageView.image = placeholderImage
        
        imageLoder.loadUrlImage(urlString: randomImageApi) { result in
            switch result {
            case .failure(let failure):
                print(failure)
            case .success(let imageModel):
                self.imageLoder.loadImage(urlString: imageModel.url) { result in
                    switch result {
                    case .success(let image):
                        DispatchQueue.main.async {
                            self.catImageView.image = image
                        }
                        
                    case .failure(let failure):
                        print(failure)
                    }
                }
            }
        }
    }
}

extension CatImageViewController {
    private func configureUI() {
        view.backgroundColor = .white
        
        configureCatImageView()
    }
    
    private func configureCatImageView() {
        view.addSubview(catImageView)
        
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            catImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            catImageView.widthAnchor.constraint(equalToConstant: 360),
            catImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
