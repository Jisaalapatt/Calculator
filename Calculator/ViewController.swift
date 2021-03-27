//
//  ViewController.swift
//  Calculator
//
//  Created by Jisa Gigi on 5/11/20.
//  Copyright © 2020 Jisa Gigi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var numberOnScreen: Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    var op = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: Any) {
        if performingMath == true {
            label.text = String((sender as AnyObject).tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }else{
            label.text = label.text! + String((sender as AnyObject).tag-1)
            numberOnScreen = Double(label.text!)!
            
            
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag == 11 {
            label.text = "0"
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0
        }
        if label.text != "" && sender.tag != 16 {

            previousNumber  = Double(label.text!)!
            if sender.tag == 12 {//Divide
                op = "/";
            }
            if sender.tag == 13 {//Multiply
                op = "X";
            }
            if sender.tag == 14 {//Subtract
                op = "-";
            }
            if sender.tag == 15 {//Add
                op = "+";
            }
            //label.text = String(previousNumber) + "" + op + " "
            label.text =  op

            operation = sender.tag;
            performingMath  = true;
            
        }
        else if sender.tag == 16 {
            if operation == 12 { //Divide
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 { //Multiply
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 { //Subtract
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 { //Add
                label.text = String(previousNumber + numberOnScreen)
            }
            
        }
        
    }//function
    
}//class

