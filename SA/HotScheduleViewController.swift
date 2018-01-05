//
//  HotScheduleViewController.swift
//  SA
//
//  Created by 輔仁大學 on 2017/12/30.
//  Copyright © 2017年 Seafood. All rights reserved.
//

import UIKit

class HotScheduleViewController: UIViewController {

    
    @IBOutlet var cityButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        cityButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Citys : String{
        case place1 = "北部"
        case place2 = "中部"
        case place3 = "南部"
        case place4 = "東部"
    }
    
    @IBAction func cityTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle , let city = Citys(rawValue:title) else{
            return
            }
        switch city{
        case .place1 : print("北部")
        case .place2 : print("中部")
        case .place3 : print("南部")
        case .place4 : print("東部")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
