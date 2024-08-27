//
//  HomeVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var vuPromotions: UIView!
    @IBOutlet weak var btnLearnMre: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var categaryCollView: UICollectionView!
    @IBOutlet weak var doctorCollView: UICollectionView!
    @IBOutlet weak var healthArticleTbView: UITableView!
    
    var categarData = [TutorialModel]()
    var doctorData  = [DoctorModel]()
    var healthData  = [HealthModel]()
    
    let categIdentifier  = CellIdentifiers.CategaryCell
    let doctorIdentifier = CellIdentifiers.DoctorsCell
    let healthIdentifier = CellIdentifiers.HealthArtCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        registerCells()
    }
    
    @IBAction func onBtnSeeAllDoctors(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TopDoctorsVC") as? TopDoctorsVC else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onBtnSeeAllArticles(_ sender: Any) {
        
    }
    
    func setUI() {
        btnLearnMre.layer.cornerRadius = 15
        vuPromotions.layer.cornerRadius = 10
    }
    
    func setData() {
        categarData = [
            TutorialModel(title: "Doctor", image: "Doctor"),
            TutorialModel(title: "Pharmacy", image: "Pharmacy"),
            TutorialModel(title: "Hospital", image: "Hospital"),
            TutorialModel(title: "Ambulance", image: "Ambulance")
        ]
        
        doctorData = [
            DoctorModel(image: "Dr. John Smith",
                        name: "Dr. John Smith",
                        specilist: "Chardiologist",
                        distance: "800m away",
                        rating: "4.7"),
            DoctorModel(image: "Dr. Sarah Davis",
                        name: "Dr. Sarah Davis",
                        specilist: "Psychologist",
                        distance: "1,5km away",
                        rating: "4.9"),
            DoctorModel(image: "Dr. Jennifer Lee",
                        name: "Dr. Jennifer Lee",
                        specilist: "Orthopedist",
                        distance: "2km away",
                        rating: "4.8"),
            DoctorModel(image: "Dr. David Anderson",
                        name: "Dr. David Anderson",
                        specilist: "Chardiologist",
                        distance: "800m away",
                        rating: "4.2")
        ]
        
        
        healthData = [
        HealthModel(title: "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
                    image: "medisons",
                    date: "Jun 9, 2021 ",
                    redTim: "6 min read", discri: ""),
        HealthModel(title: "Traditional Herbal Medicine Treatments for COVID-19",
                    image: "health1",
                    date: "Jun 5, 2021",
                    redTim: "10 min read", discri: ""),
        HealthModel(title: "Beauty Tips For Face: 10 Dos and Don'ts for Naturally Beautiful Skin",
                    image: "health2",
                    date: "Jun 8, 2021",
                    redTim: "8 min read", discri: ""),
        HealthModel(title: "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
                    image: "health3",
                    date: "Jun 7, 2021",
                    redTim: "12 min read", discri: "")
        
        
        ]
    }
    
    func registerCells() {
        categaryCollView.register(UINib(nibName: categIdentifier, bundle: nil), forCellWithReuseIdentifier: categIdentifier)
        doctorCollView.register(UINib(nibName: doctorIdentifier, bundle: nil), forCellWithReuseIdentifier: doctorIdentifier)
        healthArticleTbView.register(UINib(nibName: healthIdentifier, bundle: nil), forCellReuseIdentifier: healthIdentifier)
    }
    
}

//MARK: Collection view Delegates and DataSource
extension HomeVC : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categaryCollView {
            return categarData.count
        } else {
            return doctorData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categaryCollView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categIdentifier, for: indexPath) as? CatagaryCell
            let data = categarData[indexPath.row]
            cell?.img.image = UIImage(named: data.image)
            cell?.lblTitle.text = data.title
            return cell ?? UICollectionViewCell()
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: doctorIdentifier, for: indexPath) as? DoctorsCell
            let data = doctorData[indexPath.row]
            cell?.setDoctorsData(data: data)
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categaryCollView {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            if indexPath.row == 0 {
                guard let vc = storyboard.instantiateViewController(withIdentifier: "ArticlesVC") as? ArticlesVC else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 1 {
                guard let vc = storyboard.instantiateViewController(withIdentifier: "PharmacyVC") as? PharmacyVC else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                guard let vc = storyboard.instantiateViewController(withIdentifier: "AmbulanceVC") as? AmbulanceVC else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}

//MARK: Table view Delegates and DataSource
extension HomeVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        healthData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: healthIdentifier, for: indexPath) as? HealthArticleCell
        cell?.setData(data: healthData[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
    
}
