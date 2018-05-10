//
//  LeftMenuController.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 03/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import LGSideMenuController
class LeftMenuController: BaseVC,CategoryViewModelDelegate {
    
    
    var menuItems : [MenuModel] = [MenuModel]()
    let viewModel = CategoryViewModel()
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        menuItems = WTUtils.getMenuJsonArrayWithFileName(filename: "slide_menu")
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
        viewModel.delegate = self
        viewModel.reloadSections = { [weak self] (section: Int) in
            self?.tableView?.beginUpdates()
            self?.tableView?.reloadSections([section], with: .fade)
            self?.tableView?.endUpdates()
        }
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.sectionHeaderHeight = 70
        tableView?.separatorStyle = .none
       
        tableView?.register(ChannelCell.nib, forCellReuseIdentifier: ChannelCell.identifier)
          tableView?.register(HeaderView.nib, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func didSelectCategory(category: Category, atIndexPath: IndexPath) {
        sideMenuController!.hideLeftViewAnimated()
        let navigationController:UINavigationController =  sideMenuController!.rootViewController as! UINavigationController
        let destinationVC:HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        destinationVC.category = category
        destinationVC.title = category.title
        navigationController.setViewControllers([destinationVC], animated: false)
    }
    
    func didSelectSection(menuItem: HeaderModel, atSection: Int) {
        if(!menuItem.isCollapsible!){
            self.navigateToItem(item: menuItem)

        }
        
    }
 
    
    func navigateToItem(item:HeaderModel) {
        sideMenuController!.hideLeftViewAnimated()
        let navigationController:UINavigationController =  sideMenuController!.rootViewController as! UINavigationController
        let destinationVC:BaseVC = self.storyboard?.instantiateViewController(withIdentifier: item.destination_id!) as! BaseVC
        destinationVC.title = item.title
        navigationController.setViewControllers([destinationVC], animated: false)
        
    }
    
}
