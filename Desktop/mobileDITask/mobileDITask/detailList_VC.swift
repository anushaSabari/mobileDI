//
//  detailList_VC.swift
//  mobileDITask
//
//  Created by anusha sabari on 1/24/18.
//  Copyright © 2018 sabarianusabari. All rights reserved.
//

import UIKit

class detailList_VC: UIViewController {

    @IBOutlet weak var deatailName: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
deatailName.text=selectedRec
       // let imge = selcetedImg
       detailImage.setImageFromURl(stringImageUrl:"\(imageArray[0])")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
