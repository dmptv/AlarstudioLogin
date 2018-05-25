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
    
    var urlStr: String {
        return getImgStr()
    }
    
    public func configure(for mcDonald: McDonald) {
        nameLbl.text = mcDonald.name
        contryLbl.attributedText = setCountry(mcDonald.country)
        logoImgView.loadImage(urlString: urlStr)
    }
    
    private func setCountry(_ country: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Available in: ", attributes: [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)])
        
        attributedText.append(NSMutableAttributedString(string: "\(country)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        let length = attributedText.string.count
        attributedText.addAttributes([NSAttributedStringKey.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: length))
        
        return attributedText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        logoImgView.layer.masksToBounds = true
        
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
        selectedBackgroundView = selectedView
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func getImgStr() -> String{
        let url1 = "https://hips.hearstapps.com/del.h-cdn.co/assets/18/10/480x652/gallery-1520452195-delish-mcdonalds-arches-upside-down.jpeg?resize=768:*"
        return url1
    }

}













