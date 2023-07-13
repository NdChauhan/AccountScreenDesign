//
//  ProfileModule.swift
//  CreativeHustlePractical
//
//  Created by Nidhi Chauhan on 13/07/23.
//

import Foundation

//MARK: Profile Class

class Profile {
    var title:String
    var id:Int
    var isSelected: Bool
    var imgName: String
    
    init(title: String, id: Int, isSelected: Bool, imgName: String) {
        self.title = title
        self.id = id
        self.isSelected = isSelected
        self.imgName = imgName
    }
}
