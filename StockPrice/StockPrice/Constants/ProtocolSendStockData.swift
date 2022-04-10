//
//  ProtocolSendStockData.swift
//  StockPrice
//
//  Created by Lu Bai on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ currentStockModel : StockQuote)
}
