//
//  RowListView.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 7.10.2023.
//

import SwiftUI

struct RowEventView: View {
    

   
    
    private var nextEvent = [
        "nextevent",
        "nextevent",
        "nextevent",
        "nextevent",
        "nextevent",
        "nextevent"
    ]
    
    
    var body: some View {
        VStack(alignment : .leading) {
            
            Text("Next Event")
                
                .font(.system(.body, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(Color("Colorwhite"))
                .foregroundStyle(.black)
                .frame(alignment: .leading)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(nextEvent, id: \.self) { item in
                        Image(item)
                            .resizable()
                            .scaledToFit()
                        
                            .frame(width: 80, height: 80)
                            .cornerRadius(16)
                        
                        
                        
                    }
                    
                }
                .background(Color("Colorblack"))
                
            }
            
            
            .shadow(color: .black, radius: 2, x: 0, y: 0)
        }
       
}
}

struct RowListView_Previews: PreviewProvider {
    static var previews: some View {
        RowEventView()
            .previewLayout(.sizeThatFits)
    }
}
