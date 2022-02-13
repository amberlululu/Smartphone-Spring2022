//
//  ViewController.swift
//  TableViewXIBFileAssignment
//
//  Created by Lu Bai on 2/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    let images = ["Boston1","Boston2","Boston3","Boston4","Boston5","Boston6"]
    let imageLabel = ["Boston1","Boston2","Boston3","Boston4","Boston5","Boston6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImg.text = imageLabel[indexPath.row]
        return cell
    }
    
}

