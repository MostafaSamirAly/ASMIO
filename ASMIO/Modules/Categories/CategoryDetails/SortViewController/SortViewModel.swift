//
//  SortViewModel.swift
//  ASMIO
//
//  Created by Mostafa Samir on 20/11/2021.
//

import Foundation

enum SortOptions: String {
    case popularity = "Popularity"
    case highToLow = "Price: High to Low"
    case lowToHigh = "Price: Low to High"
}

class SortViewModel: NSObject {
    let sortOptions: [SortOptions] = [.popularity, .highToLow, .lowToHigh]
    var selectedOption = SortOptions.popularity
}
