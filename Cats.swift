//
//
//
//
//
//  StoreItems.swift
//  PawCus
//
//  Created by STDC_32 on 09/08/2024.
//

import UIKit

struct Cats {
    let photo: UIImage?
    let name: String
}

extension Cats {
    static func sampleTeamData() -> [Cats]{
        let photo1 = UIImage(named: "Bandit")
        let photo2 = UIImage(named: "Callie")
        let photo3 = UIImage(named: "Patches")
        let photo4 = UIImage(named: "Pepper")
        let photo5 = UIImage(named: "Pumpkin")
        let photo6 = UIImage(named: "Shadow")
        let photo7 = UIImage(named: "Smokey")
        let photo8 = UIImage(named: "Snowball")
        let photo9 = UIImage(named: "Spots")
        let photo10 = UIImage(named: "Tabitha")
        let cat1 = Cats(photo: photo1, name: "Bandit")
        let cat2 = Cats(photo: photo2, name: "Callie")
        let cat3 = Cats(photo: photo3, name: "Patches")
        let cat4 = Cats(photo: photo4, name: "Pepper")
        let cat5 = Cats(photo: photo5, name: "Pumpkin")
        let cat6 = Cats(photo: photo6, name: "Shadow")
        let cat7 = Cats(photo: photo7, name: "Smokey")
        let cat8 = Cats(photo: photo8, name: "Snowball")
        let cat9 = Cats(photo: photo9, name: "Spots")
        let cat10 = Cats(photo: photo10, name: "Tabitha")
        
        return[cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10]
    }
}
