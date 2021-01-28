



//

import UIKit

protocol LikeButtonDelegate: class {
    func likesChanged(index: Int, likes: UInt, likedByMe: Bool)
}

@IBDesignable class LikeButtonView: UIControl {
    var likes: UInt = 0 {
        didSet {
            updateLikesLabel()
        }
    }
    var likedByMe = false {
        didSet {
            updateLikeButton()
        }
    }
    var index: Int = -1
    
    weak var delegate: LikeButtonDelegate?
    
    private var stackView: UIStackView!
    private var likeButton: UIButton!
    private var likesLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    func setupView() {
        likeButton = UIButton(type: .system)
        likeButton.setTitle("🤍", for: .normal)
        likeButton.addTarget(self, action: #selector(likeClicked(_:)), for: .touchUpInside)
        
        likesLabel = UILabel()
        likesLabel.text = "0"
        
        stackView = UIStackView(arrangedSubviews: [likeButton, likesLabel])
        self.addSubview(stackView)
        
        self.isOpaque = false
        self.backgroundColor = .clear
    
        //self.addSubview(likeButton)
        //self.addSubview(likesLabel)
    }
    
    @objc private func likeClicked(_ sender: UIButton) {
        likedByMe = !likedByMe
        if likedByMe {
            likes += 1
        } else {
            likes -= 1
        }
        updateLikeButton()
        updateLikesLabel()
        self.sendActions(for: .valueChanged)
        delegate?.likesChanged(index: index, likes: likes, likedByMe: likedByMe)
    }
    
    private func updateLikeButton() {
        likeButton.setTitle(likedByMe ? "❤️" : "🤍", for: .normal)
    }
    
    private func updateLikesLabel() {
        likesLabel.text = String(likes)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
}
