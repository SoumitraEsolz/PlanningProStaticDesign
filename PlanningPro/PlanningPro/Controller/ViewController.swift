//
//  ViewController.swift
//  PlanningPro
//
//  Created by Soumitra MacBook on 19/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var objectiveHeaderLbl: UILabel!
    @IBOutlet weak var planningTableView: UITableView!
    
    var hideShowArr = [Int]()
    var rowSelectDict = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planningTableView.estimatedRowHeight = 300
        objectiveHeaderLbl.text = "Objective and Key\nResults(quater)"
    }


}

//MARK: - UITableView Deleagate and Datasource

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hCell: PlanningTVC = planningTableView.dequeueReusableCell(withIdentifier: "hCell") as! PlanningTVC
        
        if hideShowArr.contains(section){
            hCell.roleLblFooterView.isHidden = true
            hCell.roleSelectView.isHidden = false
        }else{
            hCell.roleLblFooterView.isHidden = false
            hCell.roleSelectView.isHidden = true
        }
        
        hCell.btnHeaderSelect.tag = section
        hCell.btnHeaderSelect.addTarget(self, action: #selector(hideShowClicked(_ :)), for: .touchUpInside)
        return hCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if hideShowArr.contains(section) {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rCell = planningTableView.dequeueReusableCell(withIdentifier: "rCell", for: indexPath) as! PlanningTVC
        rCell.keyResultView.isHidden = true
        
        if (rowSelectDict["\(indexPath.section)"] != nil) {
            if rowSelectDict["\(indexPath.section)"] == "\(indexPath.row)" {
                rCell.keyResultView.isHidden = false
            }else{
                rCell.keyResultView.isHidden = true
            }
        }
        
        return rCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        planningTableView.deselectRow(at: indexPath, animated: false)
        
        rowSelectDict.updateValue("\(indexPath.row)", forKey: "\(indexPath.section)")
        print(rowSelectDict)
        planningTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50.0/667.0 * UIScreen.main.bounds.height
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func hideShowClicked(_ sender: UIButton){
        print(sender.tag)
        hideShowArr = [Int]()
        rowSelectDict = [String: String]()
        if !hideShowArr.contains(sender.tag) {
            hideShowArr.append(sender.tag)
            print("arrHideShow\(hideShowArr)")
            
        }
    
        self.planningTableView.reloadData()
    }
}
