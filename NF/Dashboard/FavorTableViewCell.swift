//
//  FavorTableViewCell.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/12/22.
//

import UIKit

class FavorTableViewCell: UITableViewCell {

    @IBOutlet weak var favorTitleLbl: UILabel!
    
    @IBOutlet weak var favorDetail: UILabel!
    
    @IBOutlet weak var phoneNumLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
