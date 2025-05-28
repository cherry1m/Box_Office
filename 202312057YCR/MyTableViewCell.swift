//
//  MyTableViewCell.swift
//  202312057YCR
//
//  Created by 윤채림 on 5/28/25.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var audiAccumulate: UILabel!
    
    @IBOutlet weak var audiCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
