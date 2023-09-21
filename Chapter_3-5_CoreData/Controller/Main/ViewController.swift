//
//  ViewController.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/13.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let todoRepository = TodoRepository()
    
    private let imageLoader = ImageLoder()
    
    private let logoURL = "https://spartacodingclub.kr/css/images/scc-og.jpg"
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        loadImage()
        setupAddTarget()
    }
    
    private func loadImage() {
        imageLoader.loadImage(urlString: logoURL) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    self.mainView.logoImageView.image = image
                }
            }
        }
    }
    
    func setupAddTarget() {
        mainView.showTodoListButton.addTarget(self, action: #selector(showTodoListVC), for: .touchUpInside)
        mainView.showCompleteButton.addTarget(self, action: #selector(showCompleteTodoVC), for: .touchUpInside)
        mainView.showCatImageViewButton.addTarget(self, action: #selector(showCatImageVC), for: .touchUpInside)
        mainView.showProfileButton.addTarget(self, action: #selector(showMyProfileVC), for: .touchUpInside)
    }
}

// MARK: - Action

private extension ViewController {
    @objc func showTodoListVC() {
        let todoListVC = TodoListViewController(todoRepository: todoRepository)
        
        self.navigationController?.pushViewController(todoListVC, animated: true)
    }
    
    @objc func showCompleteTodoVC() {
        let completeTodoVC = CompleteTodoViewController(todoRepository: todoRepository)
        
        self.navigationController?.pushViewController(completeTodoVC, animated: true)
    }
    
    @objc func showCatImageVC() {
        let catImageVC = CatImageViewController(imageLoder: imageLoader)
        
        self.navigationController?.pushViewController(catImageVC, animated: true)
    }
    
    @objc func showMyProfileVC() {
        let tabBarController = TabBarViewController()
        tabBarController.tabBar.tintColor = .black
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
}
