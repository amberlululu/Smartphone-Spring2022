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
    }
    

        
    func initializeStocks() ->[StockQuote]{
        let currentStock = StockQuote("AAPL", "Apple")
        let FBStock = StockQuote("FB", "Facebook")
        let AAPLStock = StockQuote("AAPL","Apple")
        let GOOGStock = StockQuote("GOOG","Google")
        let MSFTStock = StockQuote("MSFT","Microsoft")
        let AMZNStock = StockQuote("AMZN","Amazon")

        
        var modelArr = [StockQuote]()
        
        modelArr.append(currentStock)
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
        lblDayHigh.text = "High:\(currentStockModel.price) $"
        lblDayLow.text = "Low:\(currentStockModel.DayHigh) $"
    
        
    }
    


}

