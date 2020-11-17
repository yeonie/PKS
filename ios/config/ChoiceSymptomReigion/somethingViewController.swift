//
//  somethingViewController.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class somethingViewController: BaseViewController {
    
    var select = false

    @IBOutlet weak var whtSymptomYouHaveLable: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var symptomView: UIView!
    @IBOutlet weak var symptomBTN: UIView!
    @IBOutlet weak var symptomBTNBTM: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whtSymptomYouHaveLable.alpha = 0
        UIView.animate(withDuration: 1.0, animations: ({
            self.whtSymptomYouHaveLable.alpha  = 1;
        }))

        selectBtn.layer.cornerRadius = 16
        symptomView.layer.cornerRadius = 15
        symptomView.isHidden = true
        symptomBTN.layer.cornerRadius = 15
        symptomBTNBTM.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem?.image = UIImage(named: "dismissBtn")
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0/255, green: 155/255, blue: 230/255, alpha: 1.0)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

    @IBAction func mainBtnPressed(_ sender: UIButton) {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController = MainTabbarViewController()
    }
    
    @IBAction func symptomBtn(_ sender: UIButton) {
        
        if select{
            self.symptomView.isHidden = false
        }
        else{
            self.symptomView.isHidden = true
        }
        select = !select
    }
    
    @IBAction func COVIDBtnPressed(_ sender: UIButton) {
        navigationController?.pushViewController(coronaClinicViewController(), animated: true)
        
    }
    
    

}
