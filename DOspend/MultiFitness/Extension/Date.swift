//
//  Date.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import Foundation


extension Date{
    init(appDate:String)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: appDate) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    private var shortFomatter:DateFormatter{
        let fomatter = DateFormatter()
        fomatter.dateStyle = .short
        return fomatter
    }
    func asShortDateString() -> String{
        return shortFomatter.string(from: self)
    }
}
