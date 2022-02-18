//
//  GetDetailsViewController.swift
//  ProtocolDelegateAssignment
//
//  Created by Lu Bai on 2/17/22.
//

import UIKit
protocol SendFirstAndLastNameColorDelegate{
    func setFirstAndLastNameColor(firstName: String, lastName: String, favoriteColor: String)
    func setHelloText(helloText: String)
}

class GetDetailsViewController: UIViewController {
    var firstName: String?
    var lastName: String?
    var favoriteColor: String?
    
    var sendFirstAndLastNameColorDelegate : SendFirstAndLastNameColorDelegate?

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFavoriteColor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let firstName = firstName else{return}
        guard let lastName = lastName else{return}
        guard let favoriteColor = favoriteColor else{return}
        
        txtFirstName.text = firstName
        txtLastName.text = lastName
        txtFavoriteColor.text = favoriteColor
    }

        
    

    @IBAction func saveDatails(_ sender: Any) {
        guard let first = txtFirstName.text else{return}
        guard let last = txtLastName.text else{return}
        guard let color = txtFavoriteColor.text else{return}
        
        sendFirstAndLastNameColorDelegate?.setFirstAndLastNameColor(firstName: first, lastName: last, favoriteColor: color)
        sendFirstAndLastNameColorDelegate?.setHelloText(helloText: "Hello \(color) \(first) \(last)!")
        self.navigationController?.popViewController(animated: true)
    }
    
}
