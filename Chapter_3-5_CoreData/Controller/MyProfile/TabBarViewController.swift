//
//  TabBarViewController.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/19.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myProfileVC = MyProfileViewController()
        myProfileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.fill"), selectedImage: nil)
        
        viewControllers = [myProfileVC]
    }
}
