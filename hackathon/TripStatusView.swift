//
//  TripStatusView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//
import SwiftUI

struct TripStatusView: View {
    @State private var tripStatus = "Activo"
    @State private var comments = ""
    
    var body: some View {
        ZStack{
            //Image("back general")
                //.resizable()
                //.scaledToFill()
                //.edgesIgnoringSafeArea(.all)
            VStack {
                VStack{
                    Text("Estatus del viaje")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                        .frame(maxWidth: .infinity)
                }
                .background(
                    Image("fondo secundario")
                        .resizable()
                        .scaledToFill()
                )
                .frame(maxWidth: .infinity)
                .padding(.top,41)
                
                Text(tripStatus)
                    .padding(.top, 50)
                    .font(.title2)
                    .padding(.bottom, 100)
                
                VStack{
                    Text("Encuesta")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                        .frame(maxWidth: .infinity)
                }
                .background(
                    Image("fondo secundario")
                        .resizable()
                        .scaledToFill()
                )
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("¿Cómo calificarías el servicio?").font(.headline)
                        .padding(.top,30)
                        .padding(.bottom)
                    HStack {
                        CheckboxField(id: 1, label: "Excelente")
                        CheckboxField(id: 2, label: "Bueno")
                        CheckboxField(id: 3, label: "Regular")
                        CheckboxField(id: 4, label: "Malo")
                    }
                    .padding(.bottom)
                    
                    Text("¿Recomendarías nuestro servicio?").font(.headline)
                        .padding(.bottom)
                    HStack {
                        CheckboxField(id: 5, label: "Sí")
                        CheckboxField(id: 6, label: "No")
                    }
                    .padding(.bottom)
                }
                .padding(.top)
                
                Text("Comentarios")
                    .font(.title3)
                    .padding(.bottom)
                
                TextEditor(text: $comments)
                    .padding()
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                
                Spacer()
                
                HStack {
                    ForEach(0..<5) { index in
                        Button(action: {
                            // Acción para cada botón
                        }) {
                            // Contenido visual para cada botón
                            Image(systemName: "circle.fill")
                        }
                        .padding()
                    }
                }
            }
            .padding(.top)
        }
    }
}

struct TripStatusView_Previews: PreviewProvider {
    static var previews: some View {
        TripStatusView()
    }
}
