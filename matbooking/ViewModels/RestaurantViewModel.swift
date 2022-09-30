//
//  RestaurantViewModel.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import Foundation
import RxSwift

class RestaurantViewModel: ObservableObject {
    @Published var RestaurantList: [RestaurantModel] = []
    
    init() {
        RestaurantList = [
            RestaurantModel(name: "감자탕", isOpen: true, introduction: "존맛탱이다"),
            RestaurantModel(name: "떡볶이", isOpen: false, introduction: "맵다매워")
        ]
    }
    
    //MARK: intant functions
    
}
