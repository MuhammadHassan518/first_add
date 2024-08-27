//
//  DrugsDetailVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 29/07/2024.
//

import UIKit

class DrugsDetailVC: UIViewController {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnLiked: UIButton!
    @IBOutlet weak var btnBuyNow: UIButton!
    @IBOutlet weak var btnAddQuantity: UIButton!
    @IBOutlet weak var btnReduceQuantity: UIButton!
    @IBOutlet weak var lblProPrice: UILabel!
    @IBOutlet weak var lblProName: UILabel!
    @IBOutlet weak var lblProRating: UILabel!
    @IBOutlet weak var lblProQuantity: UILabel!
    @IBOutlet weak var lblProCounts: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
       
    
    var medicians : MedicionsModel?
    var productCounts = 1
    var price = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitPrice()
        setUI()
    }
    
    func splitPrice() {
        let priceString = medicians?.price ?? "1.0"
        price = Double(priceString) ?? 1.0
    }
    
    func setUI() {
        btnBuyNow.layer.cornerRadius = 20
        self.imgProduct.image = UIImage(named: medicians?.image ?? "")
        self.lblProQuantity.text = medicians?.tablets
        self.lblProPrice.text = medicians?.price
        self.lblProName.text = medicians?.name
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onBtnAddProducts(_ sender: Any) {
        productCounts += 1
        self.lblProCounts.text = String(productCounts)
        self.lblProPrice.text =  "$" + String(Double(productCounts) *  price)
    }
    
    @IBAction func onBtnReduceProducts(_ sender: Any) {
        if productCounts >= 1 {
            productCounts -= 1
        }
        self.lblProCounts.text = String(productCounts)
        self.lblProPrice.text = "$" + String(Double(productCounts) * price)
    }
    
    @IBAction func onAddToCart(_ sender: Any) {
    }
    
    @IBAction func onCart(_ sender: Any) {
    }
    
    @IBAction func onBuyNow(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "MyCartVC") as? MyCartVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onAddToLike(_ sender: Any) {
        btnLiked.isSelected.toggle()
        if btnLiked.isSelected {
            btnLiked.setImage(UIImage(named: "whiteheart"), for: .normal)
        }else {
            btnLiked.setImage(UIImage(named: "redHeart"), for: .selected)
        }
    }
}
