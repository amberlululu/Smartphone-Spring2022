//
//  StockViewController.swift
//  CompanyRating
//
//  Created by Lu Bai on 2/23/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {
    
    @IBOutlet weak var txtStockSymbol: UITextField!

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblStockRating: UILabel!
    @IBOutlet weak var lblStockRatingScore: UILabel!    
    @IBOutlet weak var lblStockRecommendation: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockRating(_ sender: Any) {
        let symbol = txtStockSymbol.text!
        let url = "\(CompanyRatingURL)\(symbol)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Rating for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil{
                print(response.error!)
                return
            }
            let stocks = JSON(response.data!).array
            guard let stock = stocks!.first else{return}
            print(stock)
            
            let rating = Rating()
            rating.symbol = stock["symbol"].stringValue
            rating.date = stock["date"].stringValue
            rating.rating = stock["rating"].stringValue
            rating.ratingScore = stock["ratingScore"].intValue
            rating.ratingRecommendation = stock["ratingRecommendation"].stringValue
            self.lblDate.text = "Date: \(rating.date)"
            self.lblStockRating.text = "Stock Rating:\(rating.rating)"
            self.lblStockRatingScore.text = "Rating Score: \(rating.ratingScore)"
            self.lblStockRecommendation.text = "Recommendation: \(rating.ratingRecommendation)"
        }
    }
    

}
