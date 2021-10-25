//
//  InsideViewController.swift
//  UITableView
//
//  Created by Sarath P on 24/10/21.
//

import UIKit

class InsideViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var callBtn: UIButton!
    var name = ""
    var phoneNum = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        labelName.text = name
        phoneLabel.text = phoneNum
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
