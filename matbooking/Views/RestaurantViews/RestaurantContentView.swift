//
//  RestaurantItem.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct RestaurantContentView: View {
    let restaurant: Restaurant
    
    var cuisineBadgeColor: Color {
        switch restaurant.storeInfo.cuisine {
        case Cuisine.korean.query:
            return Color.matPeach
        case Cuisine.italian.query:
            return Color.matNature
        case Cuisine.japanese.query:
            return Color.matSkin
        default:
            return Color.clear
        }
    }
    
    var body: some View {
        HStack(alignment: .center) {
            if restaurant.imagesData.isEmpty {
                if let uiImage = UIImage(named: "noImage") {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(maxWidth: 120, maxHeight: 120)
                        .scaledToFit()
                        .cornerRadius(25)
                }
            }
            else {
                if let firstImageData = restaurant.imagesData.first {
                    if let uiImage = UIImage(data: firstImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(maxWidth: 120, maxHeight: 120)
                            .scaledToFit()
                            .cornerRadius(25)
                    } else {
                        Text("이미지 로드에 실패했습니다.")
                    }
                }
            }
            VStack(alignment: .leading) {
                Text("\(restaurant.storeInfo.cuisine)")
                    .padding(5)
                    .background(cuisineBadgeColor)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("\(restaurant.storeInfo.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,  -3)
                }
                Text("\(restaurant.storeInfo.description)")
            }
            .frame(maxHeight: 130)
        }
    }
}

//struct RestaurantItem_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantContentView(restaurant: Restaurant(id: "", reservationRestrictions: ReservationRestrictions(paxMin: 0, paxMax: 10, slotGapMinutes: 120, daysReservableInFuture: 30, openingHours: ["" : ReservationRestrictions.OpeningHours(start: "", end: "")]), storeInfo: StoreInfo(name: "", subtitle: <#T##String#>, picturesFolderId: <#T##String?#>, pictures: <#T##[ImageResponse]?#>, description: <#T##String#>, address: <#T##String#>, phone: <#T##String#>, openingHours: <#T##String#>, city: <#T##String#>, cuisine: <#T##String#>)))
//            .previewLayout(.sizeThatFits)
//            .frame(width: 500)
//    }
//}
