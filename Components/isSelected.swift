//
//  isSelected.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 9.10.2023.
//

import SwiftUI

struct isSelected: View {
    var body: some View {
      
                ZStack {
                    Circle()
                        .fill(Color("Solanagreen"))
                        .frame(width: 30, height: 30)
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            
    }
}

#Preview {
    isSelected()
}
