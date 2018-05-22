//
//  HomeVC.swift
//  WaaZi TV
//
//  Created by anshad on 04/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class HomeVC: BaseVC,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var channelCategories:[ChannelCategory]?
    var category:Category?
    var manager:HomeManager = HomeManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
     searchBar.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        if self.category == nil{
         category = manager.LiveTVCategories?.first
        }
          getChannelsFromApi()
        
    }
    func getChannelsFromApi() {
        manager.getChannelsService(categoryId:self.category?.id ?? "" ) { (status,response,errorMessage) in
            if status == .loading{
               APP_DELEGATE.showFullScreenLoadingIndicator()
            }
            else if status == .success{
                DispatchQueue.main.async {
                    let channelsResponse = response as! ChannelsResponseModel
                    self.channelCategories = channelsResponse.categories?.category
                    self.collectionView.isHidden = false
                    self.collectionView.reloadData()
                    APP_DELEGATE.hideFullScreenLoadingIndicator()
                }
    
            }
            else{
               APP_DELEGATE.hideFullScreenLoadingIndicator()
              
              
                
            }
            
        }
    }
    
    
    func setupCollectionView() {
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        self.messageLabel.isHidden = true
        self.collectionView.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  (self.channelCategories != nil) {
            return (self.channelCategories?.count)!
        }
        else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
         let channelCategory = self.channelCategories?[indexPath.row]
         cell.titleLabel.text = channelCategory?.title
        cell.thumbNailImageView.sd_setImage(with: URL.init(string: (channelCategory?.hd_image)!), completed: nil)
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC:DetailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        let channelCategory = self.channelCategories?[indexPath.row]
        detailsVC.selectedChannel = channelCategory
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    @available(iOS 11.0, *)
    func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/3.0
  
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        if (searchText.characters.count>2){
            self.channelCategories = manager.searchChannels(searchText, self.channelCategories!)
            self.collectionView.reloadData()
            
        }
        
    }
}
