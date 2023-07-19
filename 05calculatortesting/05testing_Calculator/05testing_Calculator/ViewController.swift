//
//  ViewController.swift
//  05testing_Calculator
//
//  Created by Benedikt Langer on 03.06.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var moduloButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonComma: UIButton!
    @IBOutlet weak var buttonEnter: UIButton!
    
    let calculator = Calculator()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setLabel()
        for view in self.view.subviews as [UIView]{
            if let button = view as? UIButton{
                
                button.layer.cornerRadius = 40
                
                if button.tag < 10{
                    button.addTarget(self, action: #selector(number), for: .touchUpInside)
                }else{
                    button.addTarget(self, action: #selector(functionClick), for: .touchUpInside)
                }
            }
        }
        
    }
    
    
    func setLabel(){
        displayLabel.text = ""
    }
    
    @objc func number(sender: UIButton){
        
        if !(displayLabel.text == "0") && (calculator.lastKey.rawValue < 10 || calculator.lastKey == .comma){
            displayLabel.text?.append("\(sender.tag)")
            calculator.lastKey = ButtonTag(rawValue: sender.tag)!
        }else{
            displayLabel.text = "\(sender.tag)"
            calculator.lastKey = ButtonTag(rawValue: sender.tag)!
        }
        
        
    }
    
    @objc func functionClick(sender: UIButton){
        guard let tag = ButtonTag(rawValue: sender.tag) else {
            return
        }
        switch tag {
        case .ac:
            displayLabel.text = ""
            calculator.prevNumber = nil
            calculator.prevOperator = .enter
        case .comma:
            if !(displayLabel.text?.contains(",") ?? true){
                if displayLabel.text == "" {
                    displayLabel.text?.append("0,")
                }else{
                    displayLabel.text?.append(",")
                }
            }
        case .plusMinus:
            if let string = displayLabel.text{
                if string.first == "-" {
                    displayLabel.text?.remove(at: string.startIndex)
                }else{
                    displayLabel.text?.insert("-", at: string.startIndex)
                }
            }
        case .plus, .minus, .multiply, .divide, .enter, .modulo:
            var numberStr = displayLabel.text ?? ""
            if numberStr != ""{
                if numberStr.contains(","){
                    numberStr = numberStr.replacingOccurrences(of: ",", with: ".")
                }
                let value = Double(numberStr) ?? 0
                calculator.doMath(button: tag, curNumber: value){ [weak self] (data) in
                    if let strongself = self {
                        strongself.displayLabel.text = "\(data)"
                    }
                }
                
            }
            
        default:
            print("No function specified")
        }
    }
    
    
    
}



enum ButtonTag: Int,CaseIterable{
    case zero, one, two, three, four, five, six, seven, eight, nine,
    ac, plusMinus, modulo, divide, multiply, minus, plus, enter, comma
    
}


