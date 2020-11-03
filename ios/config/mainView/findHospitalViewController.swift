//
//  findHospitalViewController.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class findHospitalViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tstbtnPressed(_ sender: UIButton) {
        navigationController?.pushViewController(printMapViewController(), animated: true)
    }
    @IBAction func mapPressed(_ sender: UIButton) {
        navigationController?.pushViewController(pharmacyHospitalViewController(), animated: true)
    }
    
    @IBAction func gyungkiAPI(_ sender: UIButton) {
        navigationController?.pushViewController(gyungkiAPITestViewController(), animated: true)
    }
    
    @IBAction func hosTest(_ sender: UIButton) {
        navigationController?.pushViewController(hospitalAPITestViewController(), animated: true)
    }
    
    

}
