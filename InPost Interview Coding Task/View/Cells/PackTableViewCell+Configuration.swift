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

        self.packInfoView.packImageView.image = UIImage(named: pack.shipmentType.imageName)
        self.packInfoView.packNumberLabel.text = pack.id
        self.packStatusView.packStatusLabel.text = pack.status.text
        self.packSenderLabel.text = pack.sender
        
        if pack.status == .delivered || pack.status == .confirmed,
            let date = pack.pickUpDate {
            
            self.pickUpDateConfiguration(date)
        }
        
        if pack.status == .readyToPickUp,
            let date = pack.storedDate {
            
            self.storedDateConfiguration(date)
        }
    }
}

// MARK: - Private
private extension PackTableViewCell {
    
    private enum DateSectionConstants {
        
        static let pickUpDateTitle = "CZEKA NA ODBIÓR DO"
        static let storedUpDateTitle = "ODEBRANA"
        
        static let dateFormatter = DateFormatter()
        static let dateFormat = "EE|yy.MM.dd|HH:mm"
    }

    func pickUpDateConfiguration(_ date: Date) {
        
        self.packStatusView.packDateTitleLabel.text = DateSectionConstants.pickUpDateTitle
        self.dateConfiguration(date)
    }
    
    func storedDateConfiguration(_ date: Date) {
        
        self.packStatusView.packDateTitleLabel.text = DateSectionConstants.storedUpDateTitle
        self.dateConfiguration(date)
    }
    
    func dateConfiguration(_ date: Date) {
        
        DateSectionConstants.dateFormatter.dateFormat = DateSectionConstants.dateFormat
        self.packStatusView.packDateLabel.text = DateSectionConstants.dateFormatter.string(from: date)
    }
}
