//
//  Holiday.swift
//  MVC1
//
//  Created by Mac on 8.09.2019.
//  Copyright © 2019 Varol. All rights reserved.
//

import Foundation

struct HolidayResponse:Decodable {
    var response:Holidays
}

struct Holidays:Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail:Decodable {
    var name:String
    var date: DateInfo
}

struct DateInfo:Decodable {
    var iso : String
}
