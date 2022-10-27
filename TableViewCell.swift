//
//  TableViewCell.swift
//  Notes
//
//  Created by Jomms on 20/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var lbltitle: UILabel!
    
    @IBOutlet var lbldescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
