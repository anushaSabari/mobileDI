//
//  productList_VC.swift
//  mobileDITask
//
//  Created by anusha sabari on 1/24/18.
//  Copyright © 2018 sabarianusabari. All rights reserved.
//

import UIKit
import Alamofire
var imageArray = Array<Any>()
var selectedRec=String()
var rowNo = NSInteger()
var selcetedImg=UIImageView()
class productList_VC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    class StoreListModel: NSObject {
        
        var name : String?
    var image : Array<String>?
        
        override init() {
            super.init()
        }
        
        init(dictionary:Dictionary<String,Any>)
        {
            self.name = dictionary["name"] as? String
            self.image = dictionary["image"] as? Array<String>
            
        }
    }
    var storeListArray = [StoreListModel]()
    var storeListImages = 0
    @IBOutlet weak var productCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
getStoreList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeListArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! productCell
        cell.backgroundColor = UIColor.green
        cell.productLabel.text = storeListArray[indexPath.row].name
        imageArray = storeListArray[indexPath.row].image!
        
       cell.productImage.setImageFromURl(stringImageUrl:"\(imageArray[0])")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
         //
        //NSLog(@"%li %li",(long)indexPath.section,indexPath.row);
       // rowNo = collectionView.indexPathsForSelectedItems
        selectedRec = storeListArray[indexPath.row].name!
        selcetedImg.setImageFromURl(stringImageUrl:"\(imageArray[0])")
        // Add the selected item into the array
       // selectedRecepies.append(selectedRec)
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailList_VC") as! detailList_VC
        self.present(loginVC, animated: true, completion: nil)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


func getStoreList(){
    let spinnerActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
    
    let parameters: [String: Any] = [
        "email": "chitra@techinflo.com"
    ]
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    Alamofire.request("http://www.budmates.com/storelist.php", method:.post, parameters:parameters,encoding: JSONEncoding.default, headers:headers).responseJSON { response in
        switch response.result {
        case .success:
            print(response)
            var responseDict = response.result.value as? [String: Any]
            
            if  let storeArray = responseDict!["service_provider"] as? Array<Dictionary<String,Any>>
            {
                
                self.storeListArray = storeArray.map{StoreListModel.init(dictionary: $0)}
                
                DispatchQueue.main.async
                    {
                        self.productCollection.reloadData()
                        spinnerActivity.hide(animated: true)
                }
            }
            
            
        case .failure(let error):
            print(error)
        }
    }
    
    
    
}
}
extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
