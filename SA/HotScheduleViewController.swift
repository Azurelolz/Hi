//
//  HotScheduleViewController.swift
//  SA
//
//  Created by 張昕暉 on 2018/1/6.
//  Copyright © 2018年 Seafood. All rights reserved.
//

import UIKit

 class HotScheduleViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    

    @IBOutlet weak var companyTableView: UITableView!
    
    let companyName = ["Apple" , "Banana" , "Amazon"]
    let share = [99.99 , 87.89 , 12.34]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        companyTableView.delegate = self
        companyTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = companyTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = companyName[indexPath.row]
        cell?.detailTextLabel?.text = "\(share[indexPath.row])"
        
        return cell!
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
