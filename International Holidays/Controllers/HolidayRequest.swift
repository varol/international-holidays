//
//  HolidayRequest.swift
//  MVC1
//
//  Created by Mac on 8.09.2019.
//  Copyright © 2019 Varol. All rights reserved.
//

import Foundation

enum HolidayError:Error{
    case noDataAvailable
    case canNotProcessData
}

struct HolidayRequest {
    let resourceURL : URL
    let API_KEY = "64b55fc9776af18b24a13bb69cbc6441db45804c"
    
    init(countryCode: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        
        let resourceString = "https://calendarific.com/api/v2/holidays?&api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
   
    func getHoliday(completion: @escaping(Result<[HolidayDetail], HolidayError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let holidayResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidayResponse.response.holidays
                completion(.success(holidayDetails))
            }catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}
