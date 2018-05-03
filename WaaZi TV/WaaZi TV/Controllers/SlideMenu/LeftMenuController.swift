//
//  LeftMenuController.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 03/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import LGSideMenuController
class LeftMenuController: BaseVC,UITableViewDelegate,UITableViewDataSource {
    var menuItems : [MenuModel] = [MenuModel]()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = WTUtils.getMenuJsonArrayWithFileName(filename: "slide_menu")
    
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table view delegates and datasources
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuItem = menuItems[indexPath.row]
        self.navigateToItem(item: menuItem)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
         let menuItem = menuItems[indexPath.row]
            cell.textLabel?.text = menuItem.title
            cell.imageView?.image = UIImage(named: "logo")
        
        return cell
    }
 
 
    
    func navigateToItem(item:MenuModel) {
        sideMenuController!.hideLeftViewAnimated()
        let navigationController:UINavigationController =  sideMenuController!.rootViewController as! UINavigationController
      if item.id == 0 {
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: item.destination_id!) as! UITabBarController
        destinationVC.title = item.title
        navigationController.setViewControllers([destinationVC], animated: false)

      }
       else{
        let destinationVC:BaseVC = self.storyboard?.instantiateViewController(withIdentifier: item.destination_id!) as! BaseVC
         destinationVC.title = item.title
         navigationController.setViewControllers([destinationVC], animated: false)
        //sideMenuController!.rootViewController = destinationVC
          //self.navigationController?.setViewControllers([destinationVC], animated: false)

       }

//        let destinationVC:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: item.destination_id!) as! UINavigationController
//        destinationVC.title = item.title
//        sideMenuController!.rootViewController = destinationVC

    }
    
}
