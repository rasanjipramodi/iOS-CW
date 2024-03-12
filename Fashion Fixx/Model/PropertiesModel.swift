//
//  PropertiesModel.swift
//  Fashion Fixx
//
//  Created by Tharaka Mohotti on 2024-03-12.
//

import Foundation

struct PropertiesModel: Identifiable, Equatable {
    
    var id: Int = 0
    var propertyName: String = ""
    var propertyValue: String = ""
    
    
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "property_id") as? Int ?? 0
        self.propertyName = dict.value(forKey: "property_name") as? String ?? ""
        self.propertyValue = dict.value(forKey: "property_value") as? String ?? ""
       
    }
    
    static func == (lhs: PropertiesModel, rhs: PropertiesModel) -> Bool {
        return lhs.id == rhs.id
    }
}
