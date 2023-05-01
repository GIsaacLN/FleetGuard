//
//  TripView.swift
//  hackathon
//
//  Created by iOS Lab on 30/04/23.
//

import SwiftUI
import MapKit
//No se de donde jalar esta info
struct TripInfo {
    let ruta: String
    let kilometrosRecorridos: Double
    let empresa: String
    let eta: String
    let almacen: String
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: String { "\(latitude)-\(longitude)" }
}

struct TripView: View {
    @State private var showAlert = false
    @State private var showFinalizeConfirmation = false
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var location: CLLocationCoordinate2D?
    @State private var tripInfo: TripInfo = TripInfo(ruta: "Ruta 1", kilometrosRecorridos: 50, empresa: "Hackathon Inc.", eta: "12:30 PM", almacen: "Almacen A")
    
    var body: some View {
        
        ZStack{
            Image("back general")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("TRIP")
                    .font(.largeTitle)
                    .bold()
                
                Map(coordinateRegion: $mapRegion, annotationItems: location.map { [CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)] } ?? []) { location in
                    MapMarker(coordinate: location)
                }
                .frame(width: 300,height: 250)
                
                Text("Información del viaje")
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading) {
                    VStack{
                        Text("Ruta:")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text(tripInfo.ruta)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Kilómetros recorridos:")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text("\(tripInfo.kilometrosRecorridos) km")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Empresa:")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text(tripInfo.empresa)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("ETA:")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text(tripInfo.eta)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Almacén:")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text(tripInfo.almacen)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)

                    }
                    .padding()
                }
                .padding(.top)
                .padding(.horizontal)
                .padding(.horizontal)
                
                Spacer()
                
                
                Button(action: {
                    showAlert.toggle()
                }) {
                    Text("Finalizar viaje")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Confirmar"),
                          message: Text("¿Estás seguro de que deseas finalizar el viaje?"),
                          primaryButton: .default(Text("Finalizar"), action: {
                        showFinalizeConfirmation.toggle()
                    }),
                          secondaryButton: .cancel(Text("Cancelar")))
                }
                .actionSheet(isPresented: $showFinalizeConfirmation) {
                    ActionSheet(title: Text("Finalizar viaje"),
                                message: Text("¿Deseas cancelar o finalizar el viaje?"),
                                buttons: [
                                    .default(Text("Finalizar")),
                                    .destructive(Text("Cancelar")),
                                    .cancel()
                                ])
                }
                HStack {
                    ForEach(0..<5) { index in
                        Button(action: {
                            // Acción para cada botón
                        }) {
                            // Contenido visual para cada botón
                            Image(systemName: index < 3 ? "circle.fill" : "circle")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
                .padding(.bottom)
                
                
            }
        }
    }
}
struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
