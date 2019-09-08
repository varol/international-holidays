//
//  SearchbarExtensions.swift
//  MVC1
//
//  Created by Mac on 8.09.2019.
//  Copyright © 2019 Varol. All rights reserved.
//

import Foundation
import UIKit
extension HolidayTableViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        let holidayRequest = HolidayRequest.init(countryCode: searchBarText)
        holidayRequest.getHoliday { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let holidays):
                self?.listOfHoliday = holidays
            }
        }
    }
}
