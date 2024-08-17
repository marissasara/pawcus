//
//  Cats.swift
//  PawCus
//
//  Created by STDC_32 on 09/08/2024.
//

import UIKit

struct Foods{
    let photo: UIImage?
    let name: String
}

extension Foods {
    static func sampleFoodData() -> [Foods]{
        let photo1 = UIImage(named: "Bonito")
        let photo2 = UIImage(named: "Frisky")
        let photo3 = UIImage(named: "Ritzy")
        let photo4 = UIImage(named: "Sashimi Boat")
        let photo5 = UIImage(named: "Sashimi")
        let photo6 = UIImage(named: "Thrifty")
        let photo7 = UIImage(named: "Tuna")
        let food1 = Foods(photo: photo1, name: "Bonito")
        let food2 = Foods(photo: photo2, name: "Frisky")
        let food3 = Foods(photo: photo3, name: "Ritzy")
        let food4 = Foods(photo: photo4, name: "Sashimi Boat")
        let food5 = Foods(photo: photo5, name: "Sashimi")
        let food6 = Foods(photo: photo6, name: "Thrifty")
        let food7 = Foods(photo: photo7, name: "Tuna")
        
        return[food1, food2, food3, food4, food5, food6, food7]
    }
}
