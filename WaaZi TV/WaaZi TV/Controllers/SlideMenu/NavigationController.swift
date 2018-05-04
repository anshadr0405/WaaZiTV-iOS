//
//  NavigationController.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 03/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Title"
        
        self.navigationBar.tintColor = UIColor.getAppThemeColor()
        
        let leftButton =  UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.plain, target: self, action: #selector(toggleLeftView(_:)))
        let navigationItem :UINavigationItem = UINavigationItem()
        navigationItem.leftBarButtonItem = leftButton
        self.navigationBar.setItems([navigationItem], animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var prefersStatusBarHidden : Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == .phone
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        return sideMenuController!.isRightViewVisible ? .slide : .fade
    }


   

}
