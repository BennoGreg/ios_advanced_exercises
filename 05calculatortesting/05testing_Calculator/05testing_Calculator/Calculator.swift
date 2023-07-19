//
//  Calculator.swift
//  05testing_Calculator
//
//  Created by Benedikt Langer on 07.06.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import Foundation

class Calculator: ObservableObject {
    
    var prevNumber: Double?
    var tempForDotCalc: Double?
    var prevOperator: ButtonTag
    var prevPrevOperator: ButtonTag?
    var lastKey: ButtonTag
    var resultString = ""
    
    init() {
        prevOperator = .enter
        lastKey = .zero
    }
    
    func doMath(button: ButtonTag, curNumber: Double, completion: ((_ data: Double) -> Void)?){
        
        if prevOperator == .enter{
            self.prevNumber = curNumber
            prevOperator = button
            lastKey = button
            return
        }
        var result: Double = 0
        
        
        
        if let prevNumber = self.prevNumber{
            
            switch button {
            case .enter, .plus, .minus:
                switch prevOperator {
                case .plus:
                    result = prevNumber + curNumber
                case .minus:
                    result = prevNumber - curNumber
                case .multiply:
                    result = prevNumber * curNumber
                case .divide:
                    result = prevNumber / curNumber
                case .modulo:
                    result = Double(Int(prevNumber) % Int(curNumber))
                default:
                    print("")
                }
                if let prevPrevOp = prevPrevOperator, let operand = tempForDotCalc {
                    if prevPrevOp == .plus{
                        result += operand
                    }else{
                        result = operand - result
                    }
                    prevPrevOperator = nil
                }
                
            default:
                switch prevOperator {
                case .plus, .minus:
                    tempForDotCalc = self.prevNumber
                    self.prevNumber = curNumber
                    prevPrevOperator = prevOperator
                    result = curNumber
                case .multiply:
                    result = prevNumber * curNumber
                case .divide:
                    result = prevNumber / curNumber
                default:
                    print(0)
                }
            
            }
            
            prevOperator = button
            self.prevNumber = result
            
        }
        lastKey = button
        resultString = "\(result)"
        if let completion = completion{
            completion(result)
        }
    }
    
    func getPrevOperator() ->ButtonTag{
        return self.prevOperator
    }
    func getPrevNumber() ->Double?{
        return self.prevNumber
    }
    func getLastKey() -> ButtonTag{
        return self.lastKey
    }
    func getTempForDotCalc() ->Double?{
        return self.tempForDotCalc
    }
    func getPrePrevOperator() ->ButtonTag?{
        return self.prevPrevOperator
    }
    
    
    
    
}
