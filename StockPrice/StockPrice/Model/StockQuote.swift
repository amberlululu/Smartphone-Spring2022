//
//  StockQuote.swift
//  StockPrice
//
//  Created by Lu Bai on 4/10/22.
//

import Foundation


class StockQuote{
    init(_ symbol : String, _ name : String){
        self.symbol = symbol
        self.name = name
       
    }
    
    var name : String = ""
    var symbol : String = ""
    var price : Double = 0.0
    var DayHigh : Double = 0.0
    var DayLow : Double = 0.0
}
