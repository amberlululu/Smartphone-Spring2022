//
//  ViewController.swift
//  SegueAssignment
//
//  Created by Lu Bai on 2/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFavorColor: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "SegueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToSecondVC"{
            let secondVC = segue.destination as! SecondViewController
            secondVC.welcomeStr = "Hi, \(txtFavorColor.text!) \(txtFirstName.text!) \(txtLastName.text!)"
        }
    }
    
    
}

