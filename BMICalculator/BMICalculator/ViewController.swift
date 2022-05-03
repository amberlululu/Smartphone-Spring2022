//
//  ViewController.swift
//  BMICalculator
//
//  Created by Lu Bai on 5/2/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtInches: UITextField!
    
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight1: UILabel!
    @IBOutlet weak var lblHeight2: UILabel!
    
    @IBOutlet weak var pickView: UIPickerView!
    
    let choices = ["Formula1","Formula2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblBMI.text = ""
        lblMessage.text = ""
    
        pickView.delegate = self
        pickView.dataSource = self
    }

    @IBAction func calculateBMI(_ sender: Any) {

        if(lblWeight.text == "pounds"){
            let weight = (txtWeight.text! as NSString).doubleValue
            let heightFeet = (txtFeet.text! as NSString).doubleValue

            let heightInches = (txtInches.text! as NSString).doubleValue

            // convert feet to inches and get total inches
            let totalHeight = heightFeet * 12 + heightInches
            let bmi = weight/pow(totalHeight,2)*703

            lblBMI.text = String(format: "%.2f", bmi)

            if bmi  < 18.5{
                lblMessage.text = "Underweight"
            }else if bmi < 24.9{
                lblMessage.text = "Healthy Weight"
            }else if bmi < 29.9{
                lblMessage.text = "Overweight"
            }else if bmi >= 29.9{
                lblMessage.text = "Obesity"
            }else {
                lblBMI.text = ""
                lblMessage.text = "No empty input, other characters (numbers only)"
            }


        }else if(lblWeight.text == "kg"){
            let weight = (txtWeight.text! as NSString).doubleValue
            let heightM = (txtFeet.text! as NSString).doubleValue
            let heightCm = (txtInches.text! as NSString).doubleValue

            //convert cm to m
            let totalHeight = heightCm/100 + heightM
            let bmi = weight/pow(totalHeight,2)

            lblBMI.text = String(format: "%.2f", bmi)

            if bmi  < 18.5{
                lblMessage.text = "Underweight"
            }else if bmi < 24.9{
                lblMessage.text = "Healthy Weight"
            }else if bmi < 29.9{
                lblMessage.text = "Overweight"
            }else if bmi >= 29.9{
                lblMessage.text = "Obesity"
            }else{
                lblBMI.text = ""
                lblMessage.text = "No empty input,other characters (numbers only)"
            }
        }
        
    }
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return choices[row]
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return choices.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if(choices[row] == "Formula1"){
            txtWeight.placeholder = "weight in lbs"
            txtFeet.placeholder = "feet"
            txtInches.placeholder = "inches"
            lblWeight.text =  "pounds"
            lblHeight1.text = "Feet"
            lblHeight2.text = "Inches"
            txtWeight.text = ""
            txtFeet.text = ""
            txtInches.text = ""
        
        }else{
            txtWeight.placeholder = "weight in kg"
            txtFeet.placeholder = "m"
            txtInches.placeholder = "cm"
            lblWeight.text = "kg"
            lblHeight1.text = "m"
            lblHeight2.text = "cm"
            txtWeight.text = ""
            txtFeet.text = ""
            txtInches.text = ""
        }
        
        
    }
}

