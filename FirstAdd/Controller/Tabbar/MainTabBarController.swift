//
//  MainTabBarController.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create instances of your view controllers
        let firstViewController = HomeVC()
        let secondViewController = MessageVC()
        let thirdViewController = CalenderVC()
        let fourthViewController = ProfileVC()

        // Assign view controllers to the tab bar
//        self.viewControllers = [
//            createNavController(for: HomeVC(), title: "First", image: UIImage(named: "firstIcon")),
//            createNavController(for: MessageVC(), title: "Second", image: UIImage(named: "secondIcon")),
//            createNavController(for: CalenderVC(), title: "Third", image: UIImage(named: "thirdIcon")),
//            createNavController(for: ProfileVC(), title: "Fourth", image: UIImage(named: "fourthIcon"))
//        ]
    }

    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
//        navController.tabBarItem.title = title
//        navController.tabBarItem.image = image
//        rootViewController.navigationItem.title = title
        return navController
    }
}
