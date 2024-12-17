import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        VStack {
            Map(
                coordinateRegion: $viewModel.region,
                annotationItems: viewModel.pins
            ) { pin in
                MapAnnotation(coordinate: pin.coordinate) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                        Text(pin.title)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}
#Preview {
    MapView()
}
