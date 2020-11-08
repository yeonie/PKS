//
//  gyungkiAPITestViewController.swift
//  ios
//
//  Created by 이동연 on 02/11/2020.
//  Copyright © 2020 litong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

class gyungkiAPITestViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var valueSelected = "과천시"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Area.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return Area[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valueSelected = Area[row] as String
        return 
    }
    
    
   
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        
        navigationController?.pushViewController(ggDentistViewController(), animated: true)
    }
    
    
    var Area = ["과천시", "용인시", "안양시", "수원시", "안산시"]
    
    @IBOutlet weak var PositonPicerView: UIPickerView!
    
    

    
    override func viewDidLoad() {
        
        PositonPicerView.delegate = self
        PositonPicerView.dataSource = self
        
        print(valueSelected)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(valueSelected)
    }
}
