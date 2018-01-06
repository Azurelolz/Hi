//
//  AttractionsViewController.swift
//  SA
//
//  Created by 輔仁大學 on 2017/12/30.
//  Copyright © 2017年 Seafood. All rights reserved.
//

import UIKit

class AttractionsViewController: UIViewController, UIPickerViewDelegate , UIPickerViewDataSource {
    
    @IBOutlet var vehicle: UIPickerView!

    let vehicles = ["汽車" , "機車" , "大眾交通工具", "腳踏車", "步行"]
    
    func numberOfComponents(in vehicle: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ vehicle: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vehicles[row]
    }
    
    func pickerView(_ vehicle: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vehicles.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
