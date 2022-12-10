//
//  RestaurantQuery.swift
//  matbooking
//
//  Created by 황경원 on 2022/12/09.
//

import Foundation
import Combine
import Alamofire

class RestaurantQuery: ObservableObject {
    var restaurantVM: RestaurantViewModel
    var subscriptions: Set<AnyCancellable> = []
    
    @Published var query = GetRestaurantsFilters()
    
    init(restaurantVM: RestaurantViewModel) {
        self.restaurantVM = restaurantVM
        
        $query
        // 우리는 사용자가 입력을 마칠 때까지 기다리기 원할 것이므로 이를 위해 우리는 디바운스 연산자를 사용
        // 디바운스를 700밀리초로 설정
        // 이 경우 Runloop를 사용하여 메인스레드에서 디바운스 결과를 수신 함
        // 이것은 마치 GCD처럼 작동하지만 사용자 상호작용에 영향을 미칠 수 있는 약간 다른 방식으로 작업을 수행하는 기초 호출임
        // 자세한 내용은 작성.자 노트의 링크를 확인??
        .debounce(for: .milliseconds(700), scheduler: RunLoop.main)
        // 중복 제거 -> 동일한 값이 계속해서 Publish되는 것은 방지할 수 있음
        .removeDuplicates()
        // flatMap으로 getRestaurantList을 호출 함
        .flatMap(self.getRestaurantList)
        // 메인 스레드에서 데이터를 수신
        .receive(on: DispatchQueue.main)
        // 검색결과에 할당
        // AnyCancellable을 반환 -> Cancel을 할 수 있는 key를 반환
        .assign(to: \.restaurantVM.restaurantList, on: self)
        .store(in: &subscriptions) // 구독을 저장 -> AnyCancellable타입으로 Key를 저장하고 나중에 원할 경우 cancel()을 호출 할 수 있음

    }
    
    func getRestaurantList(query: GetRestaurantsFilters) -> AnyPublisher<[Restaurant], Never> {
//        print("cuisine: \(query.cuisine)")
        print("RestaurantViewModel - getRestaurantList() called")
        return RestaurantsApiService.getRestaurants(query: query)
            .flatMap { restaurantList -> AnyPublisher<RestaurantResponse, Never> in
                restaurantList.publisher.eraseToAnyPublisher()
            }.flatMap({
                // RestaurantResponse -> Restaurant
                self.restaurantVM.getImageForRestaurant(restaurant: $0.convertToRestaurant())
            }).collect()
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
