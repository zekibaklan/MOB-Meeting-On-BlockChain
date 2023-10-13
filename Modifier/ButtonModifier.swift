//
//  ButtonModifier.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 6.10.2023.
//

import SwiftUI
import PhantomConnect

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.callout, design: .rounded))
            .fontWeight(.heavy)
            .padding()
            .frame(minWidth: 0,maxWidth: 200)
            .background(
                Capsule().fill(Color("Colorpurple"))
                    .shadow(color: .black, radius: 8)
            )
            .foregroundColor(.white)
            .lineLimit(1)
            
    }
}

