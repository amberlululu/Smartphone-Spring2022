//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by Lu Bai on 4/10/22.
//

import Foundation
import SwiftyJSON
import Alamofire
import PromiseKit


func getCurrentStockURL(_ symbol : String) -> String{
    
    let url = "\(shortQuoteURL)\(symbol.uppercased())?apikey=\(apiKey)"
    return url
}


func getCurrentStockData(_ url : String) -> Promise<StockQuote>{

        return Promise<StockQuote> { seal -> Void in

            AF.request(url).responseJSON { response in

                if response.error != nil {

                    seal.reject(response.error!)

                }

                let currentStockModel = StockQuote("", "")

                let currentStockArray = JSON(response.data!).arrayValue
                
                guard let currentStock = currentStockArray.first else {return seal.fulfill(currentStockModel)}

                    currentStockModel.symbol = currentStock["symbol"].stringValue
                    currentStockModel.name = currentStock["name"].stringValue
                    currentStockModel.price = currentStock["price"].doubleValue
                    currentStockModel.DayHigh = currentStock["dayHigh"].doubleValue
                    currentStockModel.DayLow = currentStock["dayLow"].doubleValue
                
                    seal.fulfill(currentStockModel) 

            }

        }
}
