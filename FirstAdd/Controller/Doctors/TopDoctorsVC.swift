//
//  TopDoctorsVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit

class TopDoctorsVC: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    
    let doctorIdentifier = CellIdentifiers.topDoctorsTbCell
    var doctorData  = [DoctorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        registerCell()
    }
    
    func registerCell() {
        tbView.register(UINib(nibName: doctorIdentifier, bundle: nil), forCellReuseIdentifier: doctorIdentifier)

    }
    
    func setData() {
        
        doctorData = [
            DoctorModel(image: "Dr. John Smith top",
                        name: "Dr. John Smith",
                        specilist: "Chardiologist",
                        distance: "800m away",
                        rating: "4.7"),
            DoctorModel(image: "Dr. Sarah Davis top",
                        name: "Dr. Sarah Davis",
                        specilist: "Psychologist",
                        distance: "1,5km away",
                        rating: "4.9"),
            DoctorModel(image: "Dr. Laura Martinez top",
                        name: "Dr. Jennifer Lee",
                        specilist: "Orthopedist",
                        distance: "2km away",
                        rating: "4.8"),
            DoctorModel(image: "Dr. Elizabeth Clark top",
                        name: "Dr. David Anderson",
                        specilist: "Chardiologist",
                        distance: "800m away",
                        rating: "4.2"),
            DoctorModel(image: "Dr. David Anderson",
                        name: "Dr. David Anderson",
                        specilist: "Psychologist",
                        distance: "800m away",
                        rating: "4.2"),
            DoctorModel(image: "Dr. Jennifer Brown top",
                        name: "Dr. Jennifer Brown",
                        specilist: "Orthopedist",
                        distance: "800m away",
                        rating: "4.9")
        ]
    }
    

    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: Table view Delegates and DataSource
extension TopDoctorsVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        doctorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: doctorIdentifier, for: indexPath) as? topDoctors
        cell?.setDoctorsData(data: doctorData[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "FindDoctorsVC") as? FindDoctorsVC else {return}
        vc.doctorData = doctorData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
