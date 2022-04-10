//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Lu Bai on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    
    var name = ""
    var symbol = ""
    
    var sendStockDelegate : SendStockDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func getPrice(_ sender: Any) {
        
        let currentURL = getCurrentStockURL(symbol)
        
        getCurrentStockData(currentURL).done{ currentStockModel in
            
            self.sendStockDelegate?.sendStockData(currentStockModel)
        }
        .catch{ error in
            print(error.localizedDescription)
        }
    }
}
