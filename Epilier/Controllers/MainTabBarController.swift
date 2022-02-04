//
//  ViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.09.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var last: Int = 0
    
    var massive: [Int] = []
    
    var height: CGFloat!
    private let transition = PanelTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = UIColor(hexString: "#FFFFFF")
        
        setupTabBar(vc: FirstViewController())
        setupTabBar(vc: SecondViewController())
        setTabBarItems()
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        massive.append(item.tag)
        if item.tag == 2{
            //var count = massive.count
            //print(massive[count - 2])
            //setupTabBar(vc: FirstViewController())
            //setTabBarItems()
            //setupTabBar(vc: viewControllers![massive[count - 2]])
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
            let myTabBarItem1 = (self.tabBar.items?[item])! as UITabBarItem
            myTabBarItem1.tag = item
            //tag = item
        }

    }
    
    
    func setupTabBar(vc: UIViewController){
        let mainViewController = createNavController(vc: FirstViewController())
        let secondViewController = createNavController(vc: SecondViewController())
        let thirdViewController = SignUpPopUpView()
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
    
    func third() -> UIViewController{
        let child = SignUpPopUpView()
        child.transitioningDelegate = transition   // 2
        child.modalPresentationStyle = .custom  // 3
        height = view.frame.height * 0.60
        transition.height = height
        //self.present(child, animated: true)
        return child
    }
}

extension MainTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let tabbarIndex = tabBarController.viewControllers!.firstIndex(of: viewController)!
                if  tabbarIndex == 2 {
                    let getCurrentView = tabBarController.selectedViewController!.view!


                    return false
                } else {
                    return true
                }
        }
}
