//
//  DoctorDetailsView.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 19/07/2024.
//

import UIKit

class DoctorDetailsView: UIViewController {
    @IBOutlet weak var imgDoctor: UIImageView!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblSpecilist: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var daysCollView: UICollectionView!
    @IBOutlet weak var timeCollView: UICollectionView!
    @IBOutlet weak var lblDiscrption: UILabel!
    @IBOutlet weak var btnBookAppointment: UIButton!

    var doctorData  : DoctorModel?
    let daysdentifier  = CellIdentifiers.daysCell
    let timeCellIdentifier = CellIdentifiers.timeCell
    let r: CGFloat = 232 / 255.0
    let g: CGFloat = 243 / 255.0
    let b: CGFloat = 241 / 255.0
    let a: CGFloat = 1.0
    var days = [String]()
    var dates = [String]()
    let times = ["11:00 AM", "11:30 PM", "12:00 AM", "12:30 PM", "01:30 PM", "02:00 AM", "02:30 PM", "03:00 AM", "03:30 PM", "04:00 PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        registerCells()
        setDoctorsData(data: doctorData!)
    }
    
    func registerCells() {
        daysCollView.register(UINib(nibName: daysdentifier, bundle: nil), forCellWithReuseIdentifier: daysdentifier)
        timeCollView.register(UINib(nibName: timeCellIdentifier, bundle: nil), forCellWithReuseIdentifier: timeCellIdentifier)
        
    }
    
    func setDoctorsData(data: DoctorModel) {
        self.imgDoctor.image = UIImage(named: data.image)
        self.lblDistance.text = data.distance
        self.lblName.text = data.name
        self.lblSpecilist.text = data.specilist
    }
    
    
    func setUI() {
        
        btnBookAppointment.layer.cornerRadius = 25
        
        generateCurrentWeekDates()
        selectTodayDate()
        
        let readmoreFont = UIFont(name: "Helvetica-Oblique", size: 11.0)
        let readmoreFontColor = UIColor.blue
        DispatchQueue.main.async {
            self.lblDiscrption.addTrailing(with: "... ", moreText: "Readmore", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
        }
    }
    
    func generateCurrentWeekDates() {
            let calendar = Calendar.current
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "E"
            guard let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: today)?.start else { return }
            
            for i in 0..<7 {
                if let date = calendar.date(byAdding: .day, value: i, to: startOfWeek) {
                    formatter.dateFormat = "E"
                    days.append(formatter.string(from: date))
                    formatter.dateFormat = "d"
                    dates.append(formatter.string(from: date))
                }
            }
        }
    
    func selectTodayDate() {
        let today = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "d"
        let todayDateString = formatter.string(from: today)
        
        if let todayIndex = dates.firstIndex(of: todayDateString) {
            let indexPath = IndexPath(item: todayIndex, section: 0)
            daysCollView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            daysCollView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnchate(_ sender: Any) {

    }
    
    @IBAction func onBtnBookAppointment(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AppointmentVC") as? AppointmentVC else {return}
        vc.doctorData = doctorData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DoctorDetailsView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == daysCollView {
            return days.count
        } else {
            return times.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == daysCollView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: daysdentifier, for: indexPath) as! DayCollectionViewCell
            cell.dayLabel.text = days[indexPath.item]
            cell.dateLabel.text = dates[indexPath.item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timeCellIdentifier, for: indexPath) as! TimeCollectionViewCell
            cell.timeLabel.text = times[indexPath.item]
            cell.vuBackground.layer.cornerRadius = 10.5
            cell.vuBackground.layer.borderColor = UIColor.blue.cgColor
            cell.vuBackground.layer.borderWidth = 1.0
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == daysCollView {
            print("Selected day: \(days[indexPath.item])")
        } else {
            print("Selected time: \(times[indexPath.item])")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == daysCollView {
            print("Deselected day: \(days[indexPath.item])")
        } else {
            print("Deselected time: \(times[indexPath.item])")
        }
    }
}
