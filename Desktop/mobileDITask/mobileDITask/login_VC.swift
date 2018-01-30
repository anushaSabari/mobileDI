//
//  login_VC.swift
//  mobileDITask
//
//  Created by anusha sabari on 1/24/18.
//  Copyright © 2018 sabarianusabari. All rights reserved.
//

import UIKit

class login_VC: UIViewController ,Alerts,UITextFieldDelegate{
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(_ sender: UIButton) {
        if userName.text == ""
        {
            self.showError(title: "", message: "enter UserName")
            //then do something
            
        }
        else if passWord.text == ""{
            self.showError(title: "", message: "enter PassWord")
        }
            
        else if(userName.hasText||passWord.hasText){
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "productList_VC") as! productList_VC
            self.present(loginVC, animated: true, completion: nil)
    }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        userName.resignFirstResponder()
        passWord.resignFirstResponder()
        return true;
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
