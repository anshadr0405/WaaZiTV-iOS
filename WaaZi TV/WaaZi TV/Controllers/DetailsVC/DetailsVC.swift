//
//  DetailsVC.swift
//  WaaZi TV
//
//  Created by anshad on 04/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import AVKit
class DetailsVC: BaseVC,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,PlayerDelegate {
    var manager:HomeManager = HomeManager()
    var channelDetailsModel:ChannelDetailsModel?
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var videoPlayerView:VideoPlayerView?
    var selectedChannel:ChannelCategory?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
        getChannelDetails()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
       }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoPlayerView?.reset()
    }
    func getChannelDetails() {
        manager.getChannelService(categoryId:selectedChannel?.id ?? "" ) { (status,response,errorMessage) in
            if status == .loading{
                APP_DELEGATE.showFullScreenLoadingIndicator()
            }
            else if status == .success{
                DispatchQueue.main.async {
                    self.channelDetailsModel = response as? ChannelDetailsModel
                    let channel = self.channelDetailsModel?.feed?.item?.first
                     self.setUpPlayer(chanelModel: channel)
                    self.collectionView.isHidden = false
                     self.playerView.isHidden = false
                    self.collectionView.reloadData()
                    APP_DELEGATE.hideFullScreenLoadingIndicator()
                }
                
            }
            else{
                APP_DELEGATE.hideFullScreenLoadingIndicator()
                
                
                
            }
            
        }
    }
    func setupViews(){
        
      let rect = CGRect.init(x: self.playerView.frame.origin.x, y: self.playerView.frame.origin.y, width: self.view.frame.size.width, height: self.playerView.frame.size.height)
        videoPlayerView = VideoPlayerView.init(frame: rect)
        videoPlayerView?.delegate  = self
        self.playerView.addSubview(videoPlayerView!)
        self.collectionView.isHidden = true
       self.playerView.isHidden = true
    }
   
    func setUpPlayer(chanelModel:Item?) {
        let url:URL = URL.init(string:(chanelModel?.hls_url)!)!
        videoPlayerView?.setVideo(url)
        videoPlayerView?.play()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.layoutIfNeeded()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fullScreenButtonClicked() {
//        videoPlayerView?.frame = self.view.frame
//        self.view.layoutSubviews()

        
    let value = UIInterfaceOrientation.landscapeRight.rawValue
       UIDevice.current.setValue(value, forKey: "orientation")
        videoPlayerView?.layoutIfNeeded()
        self.playerView.layoutSubviews()
    }
    func setupCollectionView() {
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return (self.channelDetailsModel?.feed?.item?.count) ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let item = self.channelDetailsModel?.feed?.item?[indexPath.row]
        cell.titleLabel.text = item?.title
        cell.thumbNailImageView.sd_setImage(with: URL.init(string: (item?.hd_image)!), completed: nil)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //self.navigate(identifier: "DetailsVC")
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
