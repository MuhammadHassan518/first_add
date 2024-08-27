//
//  TutorialModel.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 12/07/2024.
//

import Foundation


struct TutorialModel {
    
    let title : String
    let image : String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
}


struct DoctorModel {
    let image : String
    let name : String
    let specilist : String
    let distance : String
    let rating : String

    init(image: String, name: String, specilist: String, distance: String, rating: String) {
        self.image = image
        self.name = name
        self.specilist = specilist
        self.distance = distance
        self.rating = rating
    }
    
}


struct HealthModel {
    
    let title : String
    let image : String
    let date  : String
    let redTim: String
    let discri: String?
    init(title: String, image: String, date: String, redTim: String, discri: String?) {
        self.title = title
        self.image = image
        self.date  = date
        self.redTim = redTim
        self.discri = discri
    }
    
}

struct MessagesModel {
    let image : String
    let name : String
    let time : String
    let status : Bool
    let message : String
    let isDoctor: Bool
    init(image: String, name: String, time: String, status: Bool, message: String, isDoctor: Bool) {
        self.image = image
        self.name = name
        self.time = time
        self.status = status
        self.message = message
        self.isDoctor = isDoctor
    }
    
}

enum schedule {
    case upcoming
    case completed
    case cancel
    
}


struct scheduleModel {
    let image : String
    let name : String
    let time : String
    let status : Bool
    let date : String
    let specil : String
    let scheduleStatus: schedule
    
    init(image: String, name: String, time: String, status: Bool, date: String, special: String ,scheduleStatus: schedule) {
        self.image = image
        self.name = name
        self.time = time
        self.status = status
        self.date = date
        self.specil = special
        self.scheduleStatus = scheduleStatus
    }
}


struct MedicionsModel {
    let name : String
    let price : String
    let image : String
    let tablets : String
    
    init(name: String, price: String, images: String, tablets: String) {
        self.name = name
        self.price = price
        self.image = images
        self.tablets = tablets
    }
}
