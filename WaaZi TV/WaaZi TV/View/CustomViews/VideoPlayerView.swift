

import UIKit
import AVFoundation

class VideoPlayerView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    typealias PlayerStatusCallback = (_ status: String) -> Void

    var onVideoEnded: (() -> Void)? = nil
    
    var videoPlayer: AVPlayer? = nil
    var videoPlayerLayer: AVPlayerLayer! = nil

    var playbackEndedCallback: PlayerStatusCallback? = nil
    var paused = false
    var secondPlayer: Bool!{
        didSet {
//                SFUtility.printToConsole(message: "secondPlayerValue: " + secondPlayer.description)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    func initialize() {
     

        videoPlayer = AVPlayer()
        videoPlayer?.actionAtItemEnd = .pause
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        videoPlayerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        videoPlayerLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(videoPlayerLayer!)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(gestureRecognizer)
    }
    
        
    override func layoutSubviews() {
         super.layoutSubviews()
        videoPlayerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
    }
    
    func deleteVideoPlayer(){
        videoPlayer = nil
    }
    
    
    @objc func handleTapGesture(_ gesture:UITapGestureRecognizer) {
        if isPlaying() {
            videoPlayer?.pause()
        } else {
            videoPlayer?.play()
        }
    }
    
    func setVideo(_ videoUrl: URL) {
        videoPlayer?.pause()
        videoPlayer?.replaceCurrentItem(with: AVPlayerItem(url: videoUrl))
   
        // Set player status callbacks
        addPlaybackStatusCallbacks()
    }
    
    func addPlaybackStatusCallbacks() {
        let playerItem = videoPlayer?.currentItem
        if playerItem != nil {
            // Subscribe to the AVPlayerItem's DidPlayToEndTime notification.
            NotificationCenter.default.addObserver(self, selector: #selector(playbackEnded), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
            
        }
    }
    
    @objc func playbackEnded() {
        if playbackEndedCallback != nil {
            playbackEndedCallback!("Ended")
        }
        reset()
        if let onVideoEnded = self.onVideoEnded{
            onVideoEnded()
        }
    }
    
    func isPlaying() -> Bool {
        if (videoPlayer?.rate != 0 && videoPlayer?.error == nil) {
            return true
        }
        return false
    }
    
    func play() {
        self.videoPlayer?.play()
        paused = false
    }
    
    func pause() {
        if self.isPlaying(){
            self.videoPlayer?.pause()
            paused = true
        }
    }
    
    func isVideoStarted() -> Bool{
        let currentTime: CMTime = (videoPlayer?.currentTime())!
        if currentTime.value > 0{
            return true
        }else{
            return false
        }
    }
    func isAtZero() -> Bool{
        let currentTime: CMTime = (videoPlayer?.currentTime())!
        if currentTime.value == 0{
            return true
        }else{
            return false
        }
    }
    
    func reset() {
        self.videoPlayer?.seek(to: kCMTimeZero)
    }
    
    func deAllocPlayer(){
        self.videoPlayerLayer.removeFromSuperlayer()
        self.videoPlayer = nil
    }

}
