//
//  ImageView.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 6.10.2023.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
                
            Image("nextevent")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .foregroundColor(Color("Colorpurple"))
                .shadow(color: Color("Solanagreen"), radius: 5)
            Text("Account 1")
                .font(.system(.callout, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(Color("Colorpurple"))


            
          
     }
        
    }
     
}

#Preview {
    ImageView()
}
