//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2
    var tip = 0.10
    var billTotal = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        //get current title of the button that was passed
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) fromt the title then turn it back into a String
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
         //turn the string into a double
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)
        
        
        tip = buttonTitleAsANumber ?? 100 / 100

                
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format:"%.0f",sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    //get the text  the user typed in the text field
        let bill = billTextField.text!
        
        
        if bill != ""{
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            let resultToDecimalPlaces = String(format: "%.2f", result)
        }
       
    }
    
    
}

