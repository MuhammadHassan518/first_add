//
//  PharmacyVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 26/07/2024.
//

import UIKit

class PharmacyVC: UIViewController {

    @IBOutlet weak var vuPromotion: UIView!
    @IBOutlet weak var imgPromotion: UIImageView!
    @IBOutlet weak var btnYploadPromotions: UIButton!
    @IBOutlet weak var lblTitleOfPromotions: UILabel!
    @IBOutlet weak var selProductColView: UICollectionView!
    @IBOutlet weak var PopularPrdColView: UICollectionView!
    
    let pharmProdCells = CellIdentifiers.pharmacyCell
    var medicians = [MedicionsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setData()
        registerCell()
        
    }
    
    func setUI() {
        vuPromotion.layer.cornerRadius = 15
        imgPromotion.layer.cornerRadius = 15
        btnYploadPromotions.layer.cornerRadius = 10
        
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
        selProductColView.register(UINib(nibName: pharmProdCells, bundle: nil), forCellWithReuseIdentifier: pharmProdCells)
        PopularPrdColView.register(UINib(nibName: pharmProdCells, bundle: nil), forCellWithReuseIdentifier: pharmProdCells)
    }

    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onBtnSaleProducts(_ sender: Any) {
    }
    
    @IBAction func onBtnPopularProducts(_ sender: Any) {
    }
    
    @IBAction func onCart(_ sender: Any) {
    }
    
}

//MARK: Collection view Delegates and DataSource
extension PharmacyVC : UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == PopularPrdColView {
            return medicians.count
        } else {
            return medicians.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == PopularPrdColView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pharmProdCells, for: indexPath) as? PharmacyCell
            let data = medicians[indexPath.row]
            cell?.setData(data: data)
            cell?.lbldicscountPrice.isHidden = true
            return cell ?? UICollectionViewCell()
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pharmProdCells, for: indexPath) as? PharmacyCell
            let data = medicians[indexPath.row]
            cell?.setData(data: data)
            cell?.lbldicscountPrice.isHidden = false
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 2.5 - 5, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "DrugsDetailVC") as? DrugsDetailVC else { return }
        vc.medicians = medicians[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
