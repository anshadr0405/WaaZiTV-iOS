//
//  HomeVC.swift
//  WaaZi TV
//
//  Created by anshad on 04/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class HomeVC: BaseVC,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var manager:HomeManager = HomeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCollectionView()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        // authenticateUserAndGetGroups()
    }
    

    func authenticateUserAndGetGroups(){
        manager.userAuthentiationService { (status, response, errorMessage) in
            if status == .loading{
                Constant.init().APP_DELEGATE.showFullScreenLoadingIndicator()
            }
            else if status == .success{
                
                self.manager.getGroupsService(completion: { (status, response, errorMessage) in
                    if status == .loading{
                    }
                    else if status == .success{
                        Constant.init().APP_DELEGATE.hideFullScreenLoadingIndicator()
                        self.messageLabel.isHidden = true
                        self.collectionView.isHidden = false
                    }
                    else{
                        Constant.init().APP_DELEGATE.hideFullScreenLoadingIndicator()
                    }
                })
            }
            else{
                  Constant.init().APP_DELEGATE.hideFullScreenLoadingIndicator()
                  self.messageLabel.text = "User authentication failed"
                self.messageLabel.isHidden = false
                self.collectionView.isHidden = true

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
        
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.navigate(identifier: "DetailsVC")
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
}
