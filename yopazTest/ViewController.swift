//
//  ViewController.swift
//  yopazTest
//
//  Created by HoangDucAnh on 10/12/2022.
//

import UIKit

class ViewController: UIViewController {
    // Outlet
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number0: UIButton!
    
    var firstNumber : Int = 0
    var checkDot : Bool = false
    var result : String = ""
    var currentNumber : String = ""
    var firstNum : String = ""
    var secondNum : String = ""
    var currentOperation : String = ""
    override func viewDidLoad() {
        resultLabel.text = "0"
        settitle()
        super.viewDidLoad()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if resultLabel.text == "0"{
            currentNumber = sender.currentTitle!
            resultLabel.text = currentNumber
        }else if currentNumber.count <= 9 {
            currentNumber += String(sender.currentTitle!)
            resultLabel.text = currentNumber
            
        }
        print(sender.currentTitle!)
    }
    @IBAction func cong(_ sender: UIButton) {
        tinhtoan(operation: "cong")
        
    }
    @IBAction func tru(_ sender: UIButton) {
        tinhtoan(operation: "tru")
    }
    @IBAction func nhan(_ sender: UIButton) {
        tinhtoan(operation: "nhan")
    }
    @IBAction func chia(_ sender: UIButton) {
        tinhtoan(operation: "chia")
    }
    
    
    @IBAction func dotButton(_ sender: UIButton) {
        if checkDot == false {
            currentNumber += "."
            resultLabel.text = currentNumber
            checkDot = true
        }
        
    }
    
    @IBAction func removePressed(_ sender: UIButton) {
        print("remove")
        let newNum : String = String(currentNumber.dropLast())
        if newNum.count == 0 {
            currentNumber = "0"
            resultLabel.text = currentNumber
        } else {
            resultLabel.text = newNum
            currentNumber = newNum

        }
            }
    @IBAction func clearPressed(_ sender: Any) {
        currentNumber = ""
        resultLabel.text = "0"
        checkDot = false
        result = ""
        firstNum = ""
        secondNum = ""
        currentOperation = ""
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        tinhtoan(operation: currentOperation)
        currentOperation = ""
    }
    
    func tinhtoan(operation : String){
        
        if currentOperation != "" {
            if currentNumber != "" {
                secondNum = currentNumber
                currentNumber = ""
                switch currentOperation {
                case "cong":
                    result = "\(Double(firstNum)! + Double(secondNum)!)"
                case "tru":
                    result = "\(Double(firstNum)! - Double(secondNum)!)"
                case "nhan":
                    result = "\(Double(firstNum)! * Double(secondNum)!)"
                case "chia":
                    result = "\(Double(firstNum)! / Double(secondNum)!)"
                default:
                    result = ""
                }
                
                firstNum = result
                resultLabel.text = result
                currentOperation = operation
            }
            
            
            
        } else {
            firstNum = currentNumber
            currentNumber = ""
            currentOperation = operation
        }
    }
    
    
    
    func settitle(){
        number0.setTitle("0", for: .normal)
        number1.setTitle("1", for: .normal)
        number2.setTitle("2", for: .normal)
        number3.setTitle("3", for: .normal)
        number4.setTitle("4", for: .normal)
        number5.setTitle("5", for: .normal)
        number6.setTitle("6", for: .normal)
        number7.setTitle("7", for: .normal)
        number8.setTitle("8", for: .normal)
        number9.setTitle("9", for: .normal)
    }
}

