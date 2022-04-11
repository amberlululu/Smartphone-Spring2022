//
//  ViewController.swift
//  StockPrice
//
//  Created by Lu Bai on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendStockDelegate {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    

    
    var stocksModel: [StockQuote]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksModel = initializeStocks()
        getAAPLPrice()
    }
    

        
    func initializeStocks() ->[StockQuote]{
        let FBStock = StockQuote("FB", "Facebook")
        let AAPLStock = StockQuote("AAPL","Apple")
        let GOOGStock = StockQuote("GOOG","Google")
        let MSFTStock = StockQuote("MSFT","Microsoft")
        let AMZNStock = StockQuote("AMZN","Amazon")

        var modelArr = [StockQuote]()
        
        modelArr.append(FBStock)
        modelArr.append(AAPLStock)
        modelArr.append(GOOGStock)
        modelArr.append(MSFTStock)
        modelArr.append(AMZNStock)
        
        return modelArr
        

    }
    
    func sendStockData(_ currentStockModel: StockQuote) {
        lblName.text = currentStockModel.name
        lblSymbol.text = currentStockModel.symbol
        lblPrice.text = "Price:\(currentStockModel.price) $"
        lblDayHigh.text = "High:\(currentStockModel.DayHigh) $"
        lblDayLow.text = "Low:\(currentStockModel.DayLow) $"
    
        
    }
    
    func getAAPLPrice(){
        let currentURL = getCurrentStockURL("AAPL")
        
        getCurrentStockData(currentURL)
            .done{ currentStockModel in
            
                self.sendStockData(currentStockModel)
        }
        .catch{ error in
            print(error.localizedDescription)
        }
    }
    

    @IBAction func addStock(_ sender: Any) {
    
//        var txtField: UITextField?
        
        
        let alertController = UIAlertController(title: "Sample Alert Controller", message: "Add Stock", preferredStyle: .alert)
    
       
        let OKButton = UIAlertAction(title: "OK", style: .default) { action in
            
            print("OK Button pressed")
            

        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancel Button Pressed")
        }
        

        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField { lblTextField in
            lblTextField.placeholder = "Type Stock Symbol"
//            txtField = lblTextField
           

        }
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

