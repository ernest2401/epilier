//
//  ViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.09.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var height: CGFloat!
    private let transition = PanelTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#FFFFFF")
        
        setupTabBar()
        setTabBarItems()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2{
            let child = SignUpPopUpView()
            child.transitioningDelegate = transition   // 2
            child.modalPresentationStyle = .custom  // 3
            height = view.frame.height * 0.60
            transition.height = height
            //self.present(child, animated: true)
            DispatchQueue.main.async(execute: {
                self.present(child, animated: true)
            })
        }
    }
    
    
    func setTabBarItems(){
        
        let massive = ["Home","Discovery","More Square","Chat","Profile"]
        for item in 0...massive.count - 1 {
            print(item)
            let myTabBarItem1 = (self.tabBar.items?[item])! as UITabBarItem
            myTabBarItem1.tag = item
            
        }

    }
    
    
    func setupTabBar(){
        let mainViewController = createNavController(vc: FirstViewController())
        let secondViewController = SecondViewController()
        let thirdViewController = createNavController(vc: FirstViewController())
        let fourthViewController = FourthViewController()
        let fifthViewController = createNavController(vc: FifthViewController())
        viewControllers = [mainViewController,secondViewController,thirdViewController,fourthViewController,fifthViewController]
        setupAnimation()
        
    }
    
    func setupAnimation(){
        let massive1 = ["Home","Discovery","More Square","Chat","Profile"]
        let massive2 = ["HomeOff","DiscoveryOff","More Square","ChatOff","ProfileOff"]
        
        for item in 0 ... massive1.count - 1 {
            viewControllers![item].tabBarItem.selectedImage = UIImage(named: massive1[item])
            viewControllers![item].tabBarItem.image = UIImage(named: massive2[item])
        }
    }
    
    func createNavController(vc: UIViewController) -> UINavigationController{
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
    
}
