//
//  TourIntroView.swift
//  MyTrips
//
//  Created by Benedikt Langer on 03.04.20.
//  Copyright © 2020 EasySolutions GmbH. All rights reserved.
//

import UIKit


@IBDesignable
class TourIntroView: UIView {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBInspectable var color: UIColor?
    
    @IBInspectable var welcomeTitle: String? {
        didSet{
            self.welcomeLabel.text = self.welcomeTitle
        }
    }
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var startButtonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var friendsLabelBottomConstraint: UIImageView!
    var contentView: UIView?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        styleUI()
        localizeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        styleUI()
        localizeUI()
    }
    
    func updateUI(welcomeTitle: String){
        self.welcomeTitle = welcomeTitle
    }
    
    func setupUI(){
        guard let contentview = loadViewFromNib()else{
            return
        }
        contentview.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.isHidden = true
        contentview.backgroundColor = .green
        addSubview(contentview)
        contentview.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        contentview.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contentview.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contentview.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        self.contentView = contentview
        
        
    }
    
    func styleUI(){
        self.startButton.layer.cornerRadius = 10
    }
    
    func localizeUI(){
        
    }
    
    
    func loadViewFromNib() -> UIView?{
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
        styleUI()
        self.welcomeLabel.text = self.welcomeTitle
        contentView?.prepareForInterfaceBuilder()
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
//        self.startButtonBottomConstraint.constant = -100
//        UIView.animate(withDuration: 1) { [weak self] in
//            if let strongSelf = self{
//                strongSelf.friendsLabel.alpha = 0.0
//                strongSelf.layoutIfNeeded()
//            }
//        }
        
        UIView.animate(withDuration: 0.2, animations: {[weak self] in
            if let strongSelf = self{
                strongSelf.friendsLabel.alpha = 0.0
            }
        }) {[weak self] (finished) in
            if let strongSelf = self, finished{
                strongSelf.startButtonBottomConstraint.constant = -100
                UIView.animate(withDuration: 0.2) {
                    strongSelf.layoutIfNeeded()
                }
            }
        }
    }
    

}
