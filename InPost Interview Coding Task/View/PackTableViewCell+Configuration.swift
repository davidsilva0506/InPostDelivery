//
//  PackTableViewCell+Configuration.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 12/10/2023.
//

import UIKit

// MARK: - Cell Configure
extension PackTableViewCell {

    func configure(pack: Pack, for indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            self.topDivider.isHidden = true
        }

        self.packImageView.image = UIImage(named: pack.shipmentType.imageName)

        self.packNumberLabel.text = pack.id
        self.packStatusLabel.text = pack.status.text
        self.packSenderLabel.text = pack.sender
        
        if pack.status == .delivered || pack.status == .confirmed,
            let date = pack.pickupDate {
            
            self.packDateTitleLabel.text = "ODEBRANA"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE|yy.MM.dd|HH:mm"

            let currentDateString: String = dateFormatter.string(from: date)

            self.packDateLabel.text = currentDateString
        }
        
        if pack.status == .readyToPickUp,
            let date = pack.storedDate {
            
            self.packDateTitleLabel.text = "CZEKA NA ODBIÓR DO"
            
            self.packDateTitleLabel.text = "ODEBRANA"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE|yy.MM.dd|HH:mm"

            let currentDateString: String = dateFormatter.string(from: date)

            self.packDateLabel.text = currentDateString
        }
    }
}
