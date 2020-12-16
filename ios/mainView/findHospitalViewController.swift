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

    @IBAction func mapConfirmBtn(_ sender: UIButton) {
        navigationController?.pushViewController(printMapViewController(), animated: true)
        
    }
    
    

}
