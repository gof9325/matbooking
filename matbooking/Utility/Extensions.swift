//
//  Extension.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/10.
//

import Foundation
import SwiftUI

// MARK: String validation
extension String {
    public func validatePhone(number: String) -> Bool {
        let regex = "^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$"
        return NSPredicate(format: "SELF MATCHES %@", regex)
            .evaluate(with: number)
    }
    
    public var withHypen: String {
        var stringWithHypen: String = self
        
        stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.startIndex, offsetBy: 3))
        stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.endIndex, offsetBy: -4))
        
        return stringWithHypen
    }
}

// MARK: Button Style
extension Button {
    func matbookingButtonStyle(width: CGFloat) -> some View {
        self
            .padding()
            .frame(width: width)
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct ImageSlider: View {

    @State var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { item in
                 Image(systemName: item)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
