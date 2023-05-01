//
//  VehicleView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//
import SwiftUI

struct VehicleView: View {
    @State private var vehicleData: [String: Double] = [
        "Combustible": 0.75,
        "Temperatura de la caja": 0.6,
        "Presion de las llantas": 0.9,
        "Velocidad del vehículo": 0.5,
        "Distancia recorrida": 0.3
    ]
    let cargaMercanciaData = [
          (name: "Tipo de carga:", value: "Electrodomésticos"),
          (name: "Peso total de la carga:", value: "2500 kg"),
          (name: "Cuidados:", value: "Frágil"),
          (name: "Especificaciones:", value: "Laptops y Monitores"),
          (name: "Fecha de entrega:", value: "01/05/2023"),
      ]

    var body: some View {
        VStack {
            Text("Vehículo")
                .font(.largeTitle)
                .bold()

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(vehicleData.sorted(by: <), id: \.key) { key, value in
                    CircularProgressBar(
                        percentage: value,
                        label: key
                    )
                }
            }
            .padding(.top)

            Text("Carga/Mercancía")
                .font(.largeTitle)
                .bold()
                .padding(.bottom)
                .padding(.top, 30)

            VStack {
                ForEach(cargaMercanciaData, id: \.name) { data in
                                    VStack(alignment: .leading) {
                                        Text(data.name)
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                        Text(data.value)
                                            .font(.subheadline)
                    }
                }
            }
            .padding(.top)

            Spacer()
        }
        .padding(.top)
    }
}

struct CircularProgressBar: View {
    var percentage: Double
    var label: String

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.percentage, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                
                Text(label)
                    .font(.system(size: 12, weight: .semibold, design: .default))
            }
            .frame(width: 90, height: 100)
        }
    }
}
struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
