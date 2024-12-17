import MapKit
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @Published var pins: [ProjectPin] = []
    
    func fetchPins(for location: String) {
        // Simulate API Call
        pins = [
            ProjectPin(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), title: "Project A"),
            ProjectPin(coordinate: CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4094), title: "Project B")
        ]
    }
}

struct ProjectPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
