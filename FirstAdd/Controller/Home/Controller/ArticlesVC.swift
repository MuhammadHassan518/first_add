//
//  ArticlesVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 26/07/2024.
//

import UIKit

class ArticlesVC: UIViewController {
    
    @IBOutlet weak var popularArticColView: UICollectionView!
    @IBOutlet weak var trendingArticColView: UICollectionView!
    @IBOutlet weak var relatedArticTable: UITableView!

    
    let papolarArticleIdentif = CellIdentifiers.populaArticleBtn
    let trendingArticleIdentif = CellIdentifiers.trendingArticleCell
    let relatedArticleIdentif = CellIdentifiers.HealthArtCell
    
    var healthData  = [HealthModel]()
    var popularArticle = ["Covid-19", "Diet", "Fitness"]
    var relaArticleImages = ["health3", "health1", "health2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        registerCell()
    }
    
    func setUI() {
//        btnUpComing.layer.cornerRadius = 10
//        btnCancel.layer.cornerRadius = 10
//        btnCompleted.layer.cornerRadius = 10
    }
    
    func registerCell() {
        popularArticColView.register(UINib(nibName: papolarArticleIdentif, bundle: nil), forCellWithReuseIdentifier: papolarArticleIdentif)
        trendingArticColView.register(UINib(nibName: trendingArticleIdentif, bundle: nil), forCellWithReuseIdentifier: trendingArticleIdentif)
        relatedArticTable.register(UINib(nibName: relatedArticleIdentif, bundle: nil), forCellReuseIdentifier: relatedArticleIdentif)
    }
    
    
    func setData() {
        
        
        healthData = [
        HealthModel(title: "Covid - 19 ",
                    image: "covid-19-Article1",
                    date: "Jun 9, 2021 ",
                    redTim: "6 min read", 
                    discri: "Comparing the AstraZeneca and Sinovac COVID - 19 Vaccines"),
        HealthModel(title: "Covid - 19 ",
                    image: "covid-19-Article2",
                    date: "Jun 5, 2021",
                    redTim: "10 min read",
                    discri: "Comparing the AstraZeneca and Sinovac COVID - 19 Vaccines"),
        HealthModel(title: "Covid - 19 ",
                    image: "covid-19-Article1",
                    date: "Jun 8, 2021",
                    redTim: "8 min read",
                    discri: "Comparing the AstraZeneca and Sinovac COVID - 19 Vaccines")
        ]
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK: Table view Delegates and DataSource
extension ArticlesVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        healthData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: relatedArticleIdentif, for: indexPath) as? HealthArticleCell
        cell?.setData(data: healthData[indexPath.row])
        cell?.img.image = UIImage(named: relaArticleImages[indexPath.row])
        cell?.lblTitle.text = healthData[indexPath.row].discri
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100
    }
}



//MARK: Collection view Delegates and DataSource
extension ArticlesVC : UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularArticColView {
            return popularArticle.count
        } else {
            return healthData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularArticColView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: papolarArticleIdentif, for: indexPath) as? PopuarArticlCell
            cell?.btnArticle.setTitle(popularArticle[indexPath.row], for: .normal)
            return cell ?? UICollectionViewCell()
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingArticleIdentif, for: indexPath) as? TrendingArticlesCell
            cell?.setData(data: healthData[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == popularArticColView {
            return CGSize(width: self.view.frame.size.width / 3 - 10, height: 80)
        }else{
            return CGSize(width: self.view.frame.size.width / 2.5 - 10, height: 220)
        }
    }
    
}
