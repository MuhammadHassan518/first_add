//
//  MyCartVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 29/07/2024.
//

import UIKit
import SwiftMessages

class MyCartVC: UIViewController {
    
    @IBOutlet weak var CartCollView: UICollectionView!
    @IBOutlet weak var btnCheckOut: UIButton!
    @IBOutlet weak var lblSubtotalPrice: UILabel!
    @IBOutlet weak var lblTaxes: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    
    let cartCell = CellIdentifiers.cartCell
    var medicians = [MedicionsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        registerCell()
    }
    
    func setUI() {
        btnCheckOut.layer.cornerRadius = 20
    }
    
    func setData() {
        medicians = [
            MedicionsModel(name: "Panadol",
                           price: "15.99",
                           images: "Panadol",
                           tablets: "20pcs"),
            
            MedicionsModel(name: "Bodrex Herbal",
                           price: "7.99",
                           images: "BodrexHerbal",
                           tablets: "100ml"),
            
            MedicionsModel(name: "Konidin",
                           price: "$5.99",
                           images: "Konidin",
                           tablets: "3pcs"),
            
            MedicionsModel(name: "OBH Combi",
                           price: "9.99",
                           images: "Panadol",
                           tablets: "75ml"),
            
            MedicionsModel(name: "Betadine",
                           price: "7.99",
                           images: "BodrexHerbal",
                           tablets: "100ml")
            
        ]
    }
    
    func registerCell() {
        self.CartCollView.register(UINib(nibName: cartCell, bundle: nil), forCellWithReuseIdentifier: cartCell)
    }
    
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnChangePaymentMethod(_ sender: Any) {
    }
    
    @IBAction func onBtnCheckout(_ sender: Any) {
        showSuccessAlert(title: "Payment Success", message: "your payment has been successsful you can have a consultation sessio with your trusted doctor", btnTitle: "Back to Home")
    }
    
}


//MARK: Collection view Delegates and DataSource
extension MyCartVC : UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return medicians.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cartCell, for: indexPath) as? CartCell
        let data = medicians[indexPath.row]
        cell?.setData(data: data)
        cell?.btnDelete.tag = indexPath.row
        cell?.btnAddQuantity.tag = indexPath.row
        cell?.btnReduceQuantity.tag = indexPath.row
        
        cell?.btnDelete.addTarget(self, action: #selector(deleteProductFromCart(_:)), for: .touchUpInside)
        cell?.btnAddQuantity.addTarget(self, action: #selector(addProductQuantity(_:)), for: .touchUpInside)
        cell?.btnReduceQuantity.addTarget(self, action: #selector(subtractProductQuantity(_:)), for: .touchUpInside)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 1 - 5, height: 150)
    }
    
    @objc func deleteProductFromCart(_ sender: UIButton) {
        self.medicians.remove(at: sender.tag)
        CartCollView.reloadData()
    }
    
    @objc func addProductQuantity(_ sender: UIButton) {
        print(#function)
    }
    
    @objc func subtractProductQuantity(_ sender: UIButton) {
        print(#function)
    }
    
    
    
}

extension MyCartVC {
    func showSuccessAlert(title:String, message:String, btnTitle: String ) -> Void{
        let successAlert = Bundle.main.loadNibNamed("SuccessAlert", owner: self, options: nil)![0] as! SuccessAlert
        successAlert.lblMessage.text = message
        successAlert.lblTitle.text = title
        successAlert.btnLogin.layer.cornerRadius = 20
        successAlert.vuBack.layer.cornerRadius = 20
        successAlert.btnLogin.setTitle(btnTitle, for: .normal)
        successAlert.btnLogin.addTarget(self, action:#selector(self.confirm(_:)), for: .touchUpInside)
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .center
        config.duration = .forever
        config.interactiveHide = true
        config.dimMode = .blur(style: .dark, alpha: 1, interactive: false)
        config.presentationContext = .viewController(self)
        SwiftMessages.show(config: config, view: successAlert)
        
    }
    
    @objc func dismissAlert(_ sender: UIButton){
        SwiftMessages.hide()
    }
    @objc func confirm(_ sender: UIButton){
        SwiftMessages.hide()
//        self.navigationController?.popToViewController(MainTabBarController(), animated: true)
        guard let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
