//
//  PhoneView.swift
//  Assignment2
//
//  Created by Benedikt Langer on 04.04.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class PhoneView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var numberView = UIView()
    var contentView = UIView()
    var buttonOne = UIButton(type: .system)
    var buttonTwo = UIButton(type: .system)
    var buttonThree = UIButton(type: .system)
    var buttonFour = UIButton(type: .system)
    var buttonFive = UIButton(type: .system)
    var buttonSix = UIButton(type: .system)
    var buttonSeven = UIButton(type: .system)
    var buttonEight = UIButton(type: .system)
    var buttonNine = UIButton(type: .system)
    var buttonZero = UIButton(type: .system)
    var buttonDial = UIButton(type: .system)
    var buttonStar = UIButton(type: .system)
    var buttonHashtag = UIButton(type: .system)
    let numberTextField = UITextField()
    var buttonBack = UIButton()
    
    var font = UIFont.boldSystemFont(ofSize: 30)
    
    let spacingUp = 12
    let spacingDown = -12
    let size = 80
    let spaceLeft = 20
    let spaceRightBetween = -30
    let spaceRight = -20
    let spaceLeftBetween = 30
    
    
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
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
        styleUI()
        
    }
    
    func setupUI(){
        
        self.addSubview(contentView)
        //contentView.backgroundColor = .blue
        contentView.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.trailing.greaterThanOrEqualToSuperview().offset(-20)
            maker.leading.greaterThanOrEqualToSuperview().offset(20)
            maker.width.lessThanOrEqualTo(374)
            maker.height.greaterThanOrEqualTo(450)
            maker.bottom.equalTo(0)
            
            //maker.top.greaterThanOrEqualTo(180)
        }
        
        self.addSubview(numberView)
        numberView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.trailing.greaterThanOrEqualToSuperview().offset(-20)
            make.leading.greaterThanOrEqualToSuperview().offset(20)
            make.top.equalToSuperview()
            make.bottom.equalTo(contentView.snp.top)
        }
        
        numberTextField.font = UIFont.systemFont(ofSize: 35)
        numberView.addSubview(numberTextField)
        numberTextField.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.leading.greaterThanOrEqualTo(numberView.snp.leading).offset(20)
            make.trailing.lessThanOrEqualTo(numberView.snp.trailing).offset(-20)
            
        }
        
        
        setupButtons()
        
    }
    
    func styleUI(){
        let width = CGFloat(size)
        buttonTwo.layer.cornerRadius = width/2
        buttonEight.layer.cornerRadius = width/2
        buttonFive.layer.cornerRadius = width/2
        buttonOne.layer.cornerRadius = width/2
        buttonThree.layer.cornerRadius = width/2
        buttonZero.layer.cornerRadius = width/2
        buttonDial.layer.cornerRadius = width/2
        buttonFour.layer.cornerRadius = width/2
        buttonSeven.layer.cornerRadius = width/2
        buttonSix.layer.cornerRadius = width/2
        buttonNine.layer.cornerRadius = width/2
        buttonStar.layer.cornerRadius = width/2
        buttonHashtag.layer.cornerRadius = width/2

        
        buttonZero.titleLabel?.font = font
        buttonOne.titleLabel?.font = font
        buttonTwo.titleLabel?.font = font
        buttonThree.titleLabel?.font = font
        buttonFour.titleLabel?.font = font
        buttonFive.titleLabel?.font = font
        buttonSix.titleLabel?.font = font
        buttonSeven.titleLabel?.font = font
        buttonEight.titleLabel?.font = font
        buttonNine.titleLabel?.font = font
        buttonStar.titleLabel?.font = font
        buttonHashtag.titleLabel?.font = font
        
        buttonZero.tintColor = .white
        buttonOne.tintColor = .white
        buttonTwo.tintColor = .white
        buttonThree.tintColor = .white
        buttonFour.tintColor = .white
        buttonFive.tintColor = .white
        buttonSix.tintColor = .white
        buttonSeven.tintColor = .white
        buttonEight.tintColor = .white
        buttonNine.tintColor = .white
        buttonStar.tintColor = .white
        buttonHashtag.tintColor = .white
        buttonDial.tintColor = .white
    }
    
    func localizeUI(){
        
    }
    
    @objc func buttonAction(sender: UIButton!){
        sender.isHighlighted = true
        if numberTextField.text?.count == 0 {
            buttonBack.isHidden = false
        }
        
        numberTextField.text?.append(sender.titleLabel?.text ?? "")
    }
    
    @objc func pressedHighlight(sender: UIButton!){
        sender.isHighlighted = false
    }
    
    
    func setupButtons(){
        
        //buttonEight
        buttonEight.setTitle("8", for: .normal)
        buttonEight.backgroundColor = .myColor()
        contentView.addSubview(buttonEight)
        buttonEight.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.centerX.centerY.equalToSuperview()
            //make.bottom.equalTo(buttonZero.snp.top).offset(-20)
        }
        buttonEight.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        
        
        
        buttonZero.setTitle("0", for: .normal)
        buttonZero.backgroundColor = .myColor()
        contentView.addSubview(buttonZero)
        buttonZero.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.width.height.equalTo(size)
            make.top.greaterThanOrEqualTo(buttonEight.snp.bottom).offset(spacingUp)
            //make.top.lessThanOrEqualTo(buttonEight.snp.bottom).offset(20)
            //make.bottom.equalTo(buttonDial.snp.top).offset(-20)
        }
        buttonZero.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        //buttonDial.setTitle("D", for: .normal)
        
        let phoneSymbol = UIImage(systemName: "phone.fill")
        buttonDial.setImage(phoneSymbol, for: .normal)
        buttonDial.imageView?.snp.makeConstraints({ (make) in
            make.height.width.equalTo(40)
        })
        buttonDial.tintColor = .white
        buttonDial.imageView?.contentMode = .scaleToFill
        buttonDial.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        buttonDial.backgroundColor = .green
        contentView.addSubview(buttonDial)
        buttonDial.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.centerX.equalTo(contentView)
            make.top.greaterThanOrEqualTo(buttonZero.snp.bottom).offset(spacingUp)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-20)
        }
        
        
        buttonFive.setTitle("5", for: .normal)
        buttonFive.backgroundColor = .myColor()
        contentView.addSubview(buttonFive)
        buttonFive.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.centerX.equalToSuperview()
            
            make.bottom.lessThanOrEqualTo(buttonEight.snp.top).offset(spacingDown)
        }
        buttonFive.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        //buttonTwo
        buttonTwo.setTitle("2", for: .normal)
        buttonTwo.backgroundColor = .myColor()
        contentView.addSubview(buttonTwo)
        buttonTwo.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualTo(buttonFive.snp.top).offset(spacingDown)
            make.top.lessThanOrEqualTo(contentView.snp.top).offset(20)
            //make.top.equalTo(contentView.snp.top).offset(30)
            
            //make.top.lessThanOrEqualTo(contentView.snp.top).offset(20)
        }
        buttonTwo.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonSeven.setTitle("7", for: .normal)
        buttonSeven.backgroundColor = .myColor()
        contentView.addSubview(buttonSeven)
        buttonSeven.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(size)
            make.trailing.greaterThanOrEqualTo(buttonTwo.snp.leading).offset(spaceRightBetween)
            make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(20)
        }
        buttonSeven.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonFour.setTitle("4", for: .normal)
        buttonFour.backgroundColor = .myColor()
        contentView.addSubview(buttonFour)
        buttonFour.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.bottom.greaterThanOrEqualTo(buttonSeven.snp.top).offset(spacingDown)
            make.trailing.greaterThanOrEqualTo(buttonFive.snp.leading).offset(spaceRightBetween)
            make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(spaceLeft)
        }
        buttonFour.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonOne.setTitle("1", for: .normal)
        buttonOne.backgroundColor = .myColor()
        contentView.addSubview(buttonOne)
        buttonOne.snp.makeConstraints { (make) in
            //make.leading.lessThanOrEqualTo(contentView.snp.leading).offset(25)
            make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(spaceLeft)
            make.width.height.equalTo(size)
            make.trailing.greaterThanOrEqualTo(buttonTwo.snp.leading).offset(-30)
            make.top.lessThanOrEqualTo(contentView.snp.top).offset(20)
            make.bottom.greaterThanOrEqualTo(buttonFour.snp.top).offset(spacingDown)
            
        }
        buttonOne.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonNine.setTitle("9", for: .normal)
        buttonNine.backgroundColor = .myColor()
        contentView.addSubview(buttonNine)
        buttonNine.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.centerY.equalTo(contentView)
            make.leading.lessThanOrEqualTo(buttonEight.snp.trailing).offset(spaceLeftBetween)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(spaceRight)
        }
        buttonNine.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonSix.setTitle("6", for: .normal)
        buttonSix.backgroundColor = .myColor()
        contentView.addSubview(buttonSix)
        buttonSix.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(spaceRight)
            make.leading.lessThanOrEqualTo(buttonFive.snp.trailing).offset(spaceLeftBetween)
            make.bottom.greaterThanOrEqualTo(buttonNine.snp.top).offset(spacingDown)
        }
        buttonSix.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonThree.setTitle("3", for: .normal)
        buttonThree.backgroundColor = .myColor()
        contentView.addSubview(buttonThree)
        buttonThree.snp.makeConstraints { (make) in
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(0)
            make.leading.lessThanOrEqualTo(buttonTwo.snp.trailing).offset(spaceLeftBetween)
            make.width.height.equalTo(size)
            make.top.lessThanOrEqualTo(contentView.snp.top).offset(20)
            make.bottom.greaterThanOrEqualTo(buttonSix.snp.top).offset(spacingDown)
        }
        buttonThree.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonStar.setTitle("*", for: .normal)
        buttonStar.backgroundColor = .myColor()
        contentView.addSubview(buttonStar)
        buttonStar.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(spaceLeft)
            make.trailing.greaterThanOrEqualTo(buttonZero.snp.leading).offset(spaceRightBetween)
            make.top.lessThanOrEqualTo(buttonSeven.snp.bottom).offset(-spacingDown)
        }
        buttonStar.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        buttonHashtag.setTitle("#", for: .normal)
        buttonHashtag.backgroundColor = .myColor()
        contentView.addSubview(buttonHashtag)
        buttonHashtag.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.leading.lessThanOrEqualTo(buttonZero.snp.trailing).offset(spaceLeftBetween)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(spaceRight)
            make.top.lessThanOrEqualTo(buttonNine.snp.bottom).offset(-spacingDown)
        }
        buttonHashtag.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        
        buttonBack.backgroundColor = .clear
        buttonBack.setImage(UIImage(systemName: "delete.left.fill"), for: .normal)
        buttonBack.tintColor = .myColor()
        buttonBack.imageView?.snp.makeConstraints({ (make) in
            make.height.equalTo(25)
            make.width.equalTo(30)
        })
        contentView.addSubview(buttonBack)
        buttonBack.snp.makeConstraints { (make) in
            make.width.height.equalTo(size)
            make.leading.lessThanOrEqualTo(buttonDial.snp.trailing).offset(spaceLeftBetween)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-spaceRight)
            make.top.lessThanOrEqualTo(buttonHashtag.snp.bottom).offset(-spacingDown)
        }
        buttonBack.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        buttonBack.isHidden = true
    }
    
    @objc func backPressed(sender: UIButton!){
        if numberTextField.text?.count == 1{
            sender.isHidden = true
        }
        numberTextField.text?.removeLast()
    }
}
extension UIColor{
    static func myColor() ->UIColor {
        if #available(iOS 13, *){
            return UIColor.init { (trait) -> UIColor in
                return trait.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.lightGray
            }
        }
        else{
            return UIColor.lightGray
        }
    }
}



