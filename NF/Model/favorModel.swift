//
//  favorModel.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/12/22.
//

import Foundation


class favorModel {
    
    let favorid: Int?
    let favortitle: String?
    let favordetail: String?
    let favorlistedby: Int?
    let favorlistedphone: String?
    let favoriscompleted: Bool?
    let favorcompletedby: String?
    
    init(favorid: Int?, favortitle: String?, favordetail: String?, favorlistedby: Int?, favorlistedphone: String?, favoriscompleted: Bool?, favorcompletedby:String?) {
        self.favorid = favorid
        self.favortitle = favortitle
        self.favordetail = favordetail
        self.favorlistedby = favorlistedby
        self.favorlistedphone = favorlistedphone
        self.favoriscompleted = favoriscompleted
        self.favorcompletedby = favorcompletedby
    }
    
}
