//
//  Decoration.swift
//  PawCus
//
//  Created by STDC_32 on 10/08/2024.
//

import UIKit

struct Decorations{
    let photo: UIImage?
    let name: String
}

extension Decorations {
    static func sampleDecoData() -> [Decorations]{
        let photo1 = UIImage(named: "Clear")
        let photo2 = UIImage(named: "Modern")
        let photo3 = UIImage(named: "Natural")
        let photo4 = UIImage(named: "Sugary")
        let photo5 = UIImage(named: "Zen")
        let deco1 = Decorations(photo: photo1, name: "Clear")
        let deco2 = Decorations(photo: photo2, name: "Modern")
        let deco3 = Decorations(photo: photo3, name: "Natural")
        let deco4 = Decorations(photo: photo4, name: "Sugary")
        let deco5 = Decorations(photo: photo5, name: "Zen")
        
        return[deco1, deco2, deco3, deco4, deco5]
    }
}
