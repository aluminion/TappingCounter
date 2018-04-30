//
//  History.swift
//  TappingCounter
//
//  Created by Lam Le on 4/29/18.
//  Copyright © 2018 Allen. All rights reserved.
//

import Foundation

class History: NSObject, NSCoding {
    var id: Int?
    var period: String?
    var count: Int?
    var from: Date?
    var to: Date?
    
    init(id: Int?, period: String?, count: Int?, from: Date?, to: Date?) {
        self.id = id
        self.period = period
        self.count = count
        self.from = from
        self.to = to
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeInteger(forKey: "id")
        let period = aDecoder.decodeObject(forKey: "period") as? String
        let count = aDecoder.decodeInteger(forKey: "count")
        var from = aDecoder.decodeObject(forKey: "from") as? Date
        var to = aDecoder.decodeObject(forKey: "to") as? Date
        
        self.init(id: id, period: period, count: count, from: from, to: to)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(count, forKey: "count")
        aCoder.encode(period, forKey: "period")
        aCoder.encode(from, forKey: "from")
        aCoder.encode(to, forKey: "to")
    }
}
