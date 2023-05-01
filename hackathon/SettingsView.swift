//
//  SettingsView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI
import FirebaseAuth


struct SettingsView: View {
    @EnvironmentObject var userAuth: UserAuth //Para Cerrar
    @State private var toggleValue = true
    
    @State private var selectedTheme = "Claro"
    private let themes = ["Claro", "Oscuro", "Automático"]

    var body: some View {
        VStack {
            Text("Configuración")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            Form {
                Section(header: Text("Opciones Generales")) {
                    Toggle("Activar Notificaciones", isOn: $toggleValue)
                    Picker("Tema", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }
                }
                .padding(.top)
            }
            
            Spacer()
            
            Button(action: {userAuth.signOut() } ) { //Para Cerrar Sesión
                        Text("Cerrar sesión")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                              }
                    .padding(.top)
        }
        .padding(.top)
        .navigationBarTitle("", displayMode: .inline)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

