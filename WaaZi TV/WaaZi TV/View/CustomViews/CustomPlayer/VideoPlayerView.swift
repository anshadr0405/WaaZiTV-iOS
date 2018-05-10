

import UIKit
import AVFoundation
protocol PlayerDelegate: class {
    func fullScreenButtonClicked()
}
class VideoPlayerView: NibView {

    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var toolBarView: UIView!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var fullScreenButton: UIButton!
    @IBOutlet weak var seekBar: UISlider!
    @IBOutlet weak var watchedTimeLabel: UILabel!
    typealias PlayerStatusCallback = (_ status: String) -> Void
     var delegate: PlayerDelegate?
    var onVideoEnded: (() -> Void)? = nil
    
    var videoPlayer: AVPlayer? = nil
    var videoPlayerLayer: AVPlayerLayer! = nil

    var playbackEndedCallback: PlayerStatusCallback? = nil
    var paused = false
    var secondPlayer: Bool!{
        didSet {

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
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()

    }
    
    
    func initialize() {
        Bundle.main.loadNibNamed("VideoPlayerView", owner: self, options:nil)
      
        videoPlayer = AVPlayer()
        videoPlayer?.actionAtItemEnd = .pause
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        videoPlayerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.playerView.frame.size.height)
        videoPlayerLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(videoPlayerLayer!)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        self.addGestureRecognizer(gestureRecognizer)
    }
    
        
    override func layoutSubviews() {
         super.layoutSubviews()
      videoPlayerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.playerView.frame.size.height)
        
    }
    
    func deleteVideoPlayer(){
        videoPlayer = nil
    }
    
    
    @objc func handleTapGesture(_ gesture:UITapGestureRecognizer) {
//        if isPlaying() {
//            videoPlayer?.pause()
//        } else {
//            videoPlayer?.play()
//        }
    }
    
    func setVideo(_ videoUrl: URL) {
        videoPlayer?.pause()
        videoPlayer?.replaceCurrentItem(with: AVPlayerItem(url: videoUrl))
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
     self.videoPlayer?.pause()
        self.videoPlayer?.seek(to: kCMTimeZero)
    }
    
    func deAllocPlayer(){
        self.videoPlayerLayer.removeFromSuperlayer()
        self.videoPlayer = nil
    }

    //Controls
    @IBAction func fullscreenButtonClicked(_ sender: Any) {
        delegate?.fullScreenButtonClicked()
        
    }
    @IBAction func playButtonClicked(_ sender: Any) {
        if isPlaying() {
            videoPlayer?.pause()

        }
        else{
            videoPlayer?.play()

        }
        
    }
    
    @IBAction func seekBarValueChange(_ sender: Any) {
    }
    
   
}
