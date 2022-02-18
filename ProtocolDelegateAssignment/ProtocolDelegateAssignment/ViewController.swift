//
//  ViewController.swift
//  ProtocolDelegateAssignment
//
//  Created by Lu Bai on 2/17/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameColorDelegate {

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFavoriteColor: UILabel!
    @IBOutlet weak var lblHello: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDetails(_ sender: Any) {
        performSegue(withIdentifier: "segueGetDeatils", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetDeatils"{
            let getDetailsVC = segue.destination as! GetDetailsViewController
            
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else{return}
            guard let favoriteColor  = lblFavoriteColor.text else{return}
            
            getDetailsVC.firstName = firstName
            getDetailsVC.lastName = lastName
            getDetailsVC.favoriteColor = favoriteColor
            
            getDetailsVC.sendFirstAndLastNameColorDelegate = self
        }
    }
    func setFirstAndLastNameColor(firstName: String, lastName: String, favoriteColor: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
        lblFavoriteColor.text = favoriteColor
    }
    
    func setHelloText(helloText: String) {
        lblHello.text = helloText
    }
    
}

