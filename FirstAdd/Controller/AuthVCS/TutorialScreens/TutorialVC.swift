//
//  TutorialVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 12/07/2024.
//

import UIKit

class TutorialVC: UIViewController {

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var collectView: UICollectionView!
    @IBOutlet weak var imgSlider: UIImageView!
    
    
    var doctorData = [TutorialModel]()
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setData()
        setUI()
    }

    func registerCell() {
        collectView.register(UINib(nibName: CellIdentifiers.tutorialCell, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.tutorialCell)
    }
    
    
    func setData() {
        doctorData = [
        TutorialModel(title: "The Importance of Healthcare Access", image: "doctor1"),
        TutorialModel(title: "Access Quality Healthcare at Your Fingertips with Paramedic", image: "doctor2"),
        TutorialModel(title: "Stay Connected to Your Health with Our Mobile App", image: "doctor3")
        ]
    }
    
    func setUI(){
        imgSlider.image = UIImage(named: "slider1")
    }
    
    @IBAction func onBtnSkip(_ sender: Any) {
        navigateToNextItem()
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        navigateToPreviousItem()
    }
    
    @IBAction func onBtnNext(_ sender: Any) {
        navigateToNextItem()
    }
    
    func navigateToNextItem() {
         if selectedIndex < doctorData.count - 1 {
             selectedIndex += 1
             let indexPath = IndexPath(item: selectedIndex, section: 0)
             collectView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
             updateUI(for: indexPath)
         }else {
             let storyBoard = UIStoryboard(name: "Main", bundle: nil)
             guard let onBordVC = storyBoard.instantiateViewController(identifier: "OnBoardingVC") as? OnBoardingVC else { return  }
             self.navigationController?.pushViewController(onBordVC, animated: true)
         }
     }
     
     func navigateToPreviousItem() {
         if selectedIndex > 0 {
             selectedIndex -= 1
             let indexPath = IndexPath(item: selectedIndex, section: 0)
             collectView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
             updateUI(for: indexPath)
         }else {
             
         }
     }
     
     func updateUI(for indexPath: IndexPath) {
         imgSlider.image = UIImage(named: "slider\(indexPath.row + 1)")
         lblTitle.text = doctorData[indexPath.row].title
     }
    
}


extension TutorialVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tutorialCell, for: indexPath) as? TutorialColVCell
        cell?.img.image = UIImage(named: doctorData[selectedIndex].image)
//        selectedIndex = indexPath.row
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectView.frame.size.width - 10, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        imgSlider.image = UIImage(named: "slider\(indexPath.row + 1)")
        lblTitle.text = doctorData[indexPath.row].title
        selectedIndex = indexPath.row
    }
    
}
