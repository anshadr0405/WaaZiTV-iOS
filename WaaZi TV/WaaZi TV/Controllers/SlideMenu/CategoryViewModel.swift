////
////  MenuViewModel.swift
////  WaaZi TV
////
////  Created by Akhil P.K on 06/05/18.
////  Copyright © 2018 test. All rights reserved.
////
//
import Foundation
import UIKit
import SDWebImage
protocol CategoryViewModelDelegate: class {
    func didSelectCategory(category:Category,atIndexPath:IndexPath)
    func didSelectSection(menuItem:HeaderModel,atSection:Int)
    
    
}
class  HeaderModel:MenuModel {
    var categories: [Category]?
    required init?(dictionary: NSDictionary) {
        super.init(dictionary: dictionary)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CategoryViewModel: NSObject {
    var items = [HeaderModel]()
    weak var delegate: CategoryViewModelDelegate?

    var reloadSections: ((_ section: Int) -> Void)?
    
    override init() {
        super.init()
         let menuItems = WTUtils.getMenuJsonArrayWithFileName(filename: "slide_menu")
        for item in menuItems{
            let headerModel:HeaderModel = HeaderModel.init(dictionary: item.dictionaryRepresentation())!
            if (item.isCollapsible! && item.title == "Live TV"){
                headerModel.categories = HomeManager.sharedInstance.LiveTVCategories
            }
            items.append(headerModel)
        }
    }

    
    
}

extension CategoryViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = items[section]
        guard item.isCollapsible! else {
            return 0
        }
        
        if item.isCollapsed! {
            return 0
        } else {
            return (item.categories?.count) ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]

       let cell = tableView.dequeueReusableCell(withIdentifier: ChannelCell.identifier, for: indexPath) as? ChannelCell
        let category = item.categories![indexPath.row]
          cell?.nameLabel?.text = category.title
        cell?.pictureImageView?.sd_setImage(with: URL.init(string: category.hd_image!), completed: nil)
       
         return cell!
        
        
    }
}
extension CategoryViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView {
            let item = items[section]
            headerView.item = item 
            headerView.section = section
            headerView.delegate = self
            headerView.rightArrow?.isHidden = !item.isCollapsible!
            
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let item = items[indexPath.section]
        let category = item.categories![indexPath.row]
        delegate?.didSelectCategory(category:category , atIndexPath: indexPath)
    }
}

extension CategoryViewModel: HeaderViewDelegate {
    func toggleSection(header: HeaderView, section: Int) {
        let item = items[section]
        if item.isCollapsible! {
            item.categories = HomeManager.sharedInstance.LiveTVCategories
            // Toggle collapse
            let collapsed = !item.isCollapsed!
            item.isCollapsed = collapsed
            header.setCollapsed(collapsed: collapsed)
            // Adjust the number of the rows inside the section
            reloadSections?(section)
        }
        delegate?.didSelectSection(menuItem: item, atSection: section)
        
    }
    
    
}



