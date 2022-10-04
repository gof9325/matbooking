//
//  UserDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct UserDetailView: View {
    @Binding var user: User
    
    var body: some View {
        Text(user.id)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: .constant(User(id: "asdf", email: "asdf", picture: "ff")))
    }
}
