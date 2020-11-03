//
//  MainTabbarViewController.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.

import UIKit

class MainTabbarViewController: UITabBarController {
    
    
    //아이폰 6,7,8 경우인듯.
    private var device: CGFloat {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136, 1334, 1920:
                return 10.5
            default:
                return 50
            }
        }
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.backgroundImage = UIImage()
        
        tabBar.shadowImage = UIImage()
        //        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        //        self.tabBar.layer.shadowOffset = CGSize(width: 1, height: 2)
        //        self.tabBar.layer.shadowOpacity = 1
        //        self.tabBar.layer.shadowRadius = 100
        UITabBar.appearance().tintColor = UIColor.darkGray
        
        
        let tabbarBackgroundView = RoundShadowView(frame: tabBar.frame)
        tabbarBackgroundView.layer.cornerRadius = 25
        tabbarBackgroundView.backgroundColor = .white
        tabbarBackgroundView.frame = CGRect(x: tabBar.frame.origin.x, y: tabBar.frame.origin.y - device, width: tabBar.frame.width, height: 100)
        view.addSubview(tabbarBackgroundView)
        
        let fillerView = UIView()
        fillerView.frame = tabBar.frame
        fillerView.layer.cornerRadius = 25
        view.addSubview(fillerView)
        view.bringSubviewToFront(tabBar)
        
        let putSymptomHomeVC = putSymptomViewController()
        let putSymptomHomeNaviVC = UINavigationController(rootViewController: putSymptomHomeVC)
        putSymptomHomeNaviVC.tabBarItem.image = UIImage(named: "bottomTapBarHomeBtn")
        putSymptomHomeNaviVC.tabBarItem.title = "증상입력"
        
        let findHospitalVC = findHospitalViewController()
        let findHospitalNaviVC = UINavigationController(rootViewController: findHospitalVC)
        findHospitalNaviVC.tabBarItem.image = UIImage(named: "findingbottomTabbar")
        findHospitalNaviVC.tabBarItem.title = "병원찾기"
        
        
        viewControllers = [putSymptomHomeNaviVC, findHospitalNaviVC]
        
        
    }
    
}
