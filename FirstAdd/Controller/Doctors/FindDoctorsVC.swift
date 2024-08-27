//
//  FindDoctorsVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 19/07/2024.
//

import UIKit

class FindDoctorsVC: UIViewController {
    @IBOutlet weak var imgDoctor: UIImageView!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblSpecilist: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var categaryCollView: UICollectionView!
    @IBOutlet weak var doctorCollView: UICollectionView!

    var doctorData  : DoctorModel?
    var recentDoctorData  = [DoctorModel]()
    var categarData = [TutorialModel]()
    let categIdentifier  = CellIdentifiers.CategaryCell
    let recentDocIdentifier = CellIdentifiers.recentDoctorsCell

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        registerCells()
    }
    func registerCells() {
        categaryCollView.register(UINib(nibName: categIdentifier, bundle: nil), forCellWithReuseIdentifier: categIdentifier)
        doctorCollView.register(UINib(nibName: recentDocIdentifier, bundle: nil), forCellWithReuseIdentifier: recentDocIdentifier)

    }
    
    func setUI() {
        imgDoctor.layer.cornerRadius = 40
        setDoctorsData(data: doctorData!)
    }
    
    func setData() {
        categarData = [
            TutorialModel(title: "Doctor", image: "Doctor"),
            TutorialModel(title: "Lungs Specialist", image: "lungs"),
            TutorialModel(title: "Dentist", image: "dentist"),
            TutorialModel(title: "Psychiatrist", image: "brain"),
            TutorialModel(title: "Covid-19", image: "virus"),
            TutorialModel(title: "Surgeon", image: "surgeon"),
            TutorialModel(title: "Cardiologist", image: "heart"),
        ]
                
        recentDoctorData = [
            DoctorModel(image: "Dr. James Anderson",
                        name: "Dr. James Anderson",
                        specilist: "Chardiologist",
                        distance: "800m away",
                        rating: "4.7"),
            DoctorModel(image: "Dr.Dipika",
                        name: "Dr.Dipika",
                        specilist: "Psychologist",
                        distance: "1,5km away",
                        rating: "4.9"),
            DoctorModel(image: "Dr. Daniel Mitchell",
                        name: "Dr. Daniel Mitchell",
                        specilist: "Orthopedist",
                        distance: "2km away",
                        rating: "4.8"),
            DoctorModel(image: "Dr. Sarah Davis 1",
                        name: "Dr. Sarah Davis",
                        specilist: "Chardiologist",
                        distance: "800m away",
                        rating: "4.2")
        ]
    }
    
    func setDoctorsData(data: DoctorModel) {
        self.imgDoctor.image = UIImage(named: data.image)
        self.lblDistance.text = data.distance
        self.lblName.text = data.name
        self.lblSpecilist.text = data.specilist
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: Collection view Delegates and DataSource
extension FindDoctorsVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categaryCollView {
            return categarData.count
        } else {
            return recentDoctorData.count
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recentDocIdentifier, for: indexPath) as? recentDoctorsCell
            let data = recentDoctorData[indexPath.row]
            cell?.setDoctorsData(data: data)
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DoctorDetailsView") as? DoctorDetailsView else {return}
        vc.doctorData = doctorData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
