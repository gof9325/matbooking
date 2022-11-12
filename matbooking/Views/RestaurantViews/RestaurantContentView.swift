//
//  RestaurantItem.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct RestaurantContentView: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack(alignment: .top) {
            if restaurant.imagesData.isEmpty {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(maxWidth: 120, maxHeight: 120)
                    .scaledToFit()
                    .background(.green)
                    .cornerRadius(25)
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
                        Text("text")
                    }
                }
            }
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("\(restaurant.storeInfo.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,  -3)
                }
                Text("\(restaurant.storeInfo.description)")
            }
            .frame(maxHeight: 130)
            .padding(.leading, 3)
        }
        .padding()
    }
}

//struct RestaurantItem_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantContentView()
//            .previewLayout(.sizeThatFits)
//            .frame(width: 500)
//    }
//}