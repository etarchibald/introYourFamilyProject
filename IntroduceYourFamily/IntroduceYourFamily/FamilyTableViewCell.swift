//
//  FamilyTableViewCell.swift
//  IntroduceYourFamily
//
//  Created by Ethan Archibald on 10/25/23.
//

import UIKit

class FamilyTableViewCell: UITableViewCell {

    @IBOutlet weak var familyMemberNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
