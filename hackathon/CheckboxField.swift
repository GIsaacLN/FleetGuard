//
//  CheckboxField.swift
//  hackathon
//
//  Created by iOS Lab on 30/04/23.
//

import SwiftUI

struct CheckboxField: View {
    @State private var isChecked: Bool = false
    
    let id: Int
    let label: String
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                Text(label)
            }
            .foregroundColor(isChecked ? .green : .primary)
        }
    }
}

//struct CheckboxField_Previews: PreviewProvider {
    //static var previews: some View {
        //CheckboxField()
    //}
//}
