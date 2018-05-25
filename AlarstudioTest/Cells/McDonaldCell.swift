//
//  McDonaldTableViewCell.swift
//  AlarstudioTest
//
//  Created by 123 on 25.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class McDonaldCell: UITableViewCell {
    
    @IBOutlet weak var logoImgView: CustomImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var contryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func configure(for mcDonald: McDonald) {
        nameLbl.text = mcDonald.name
        contryLbl.text = mcDonald.country
        
        let urlStr = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ52CfqTQVqRTmvIUPHU9SmZuGTGZSmezolWrGo-eMccFIjBrvlQ"
        
        logoImgView.loadImage(urlString: urlStr)
 

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
