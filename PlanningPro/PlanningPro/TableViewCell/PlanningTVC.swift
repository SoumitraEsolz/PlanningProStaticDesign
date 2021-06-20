//
//  PlanningTVC.swift
//  PlanningPro
//
//  Created by Soumitra MacBook on 19/06/21.
//

import UIKit

class PlanningTVC: UITableViewCell {

    @IBOutlet weak var roleSelectView: UIView!
    @IBOutlet weak var headerRoleLbl: UILabel!
    @IBOutlet weak var roleLblFooterView: UIView!
    @IBOutlet weak var btnHeaderSelect: UIButton!
    
    @IBOutlet weak var objectiveView: UIView!
    @IBOutlet weak var objectiveLbl: UILabel!
    @IBOutlet weak var keyResultView: UIView!
    @IBOutlet weak var btnRowSelect: UIButton!
    
    @IBOutlet weak var keyResultFirstView: UIView!
    @IBOutlet weak var keyResultSecondView: UIView!
    @IBOutlet weak var keyResultThirdView: UIView!
    
    @IBOutlet weak var keyResultFirstLbl: UILabel!
    @IBOutlet weak var keyResultSecondLbl: UILabel!
    @IBOutlet weak var keyResultThirdLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
