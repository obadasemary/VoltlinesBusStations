//
//  MapViewController.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 6.07.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Init

    weak var coordinator: Coordinator?
    var locationManger: CLLocationManager?
    var presenter: MapPresenter!
    var annotationView: MKAnnotationView!

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = MapPresenter(delegate: self)
        presenter.viewDidLoad()

        setupLocationManger()
        setupMapUI()
    }

    // MARK: Methods

    func setupLocationManger() {

        locationManger = CLLocationManager()
        locationManger?.delegate = self

        locationManger?.requestWhenInUseAuthorization()
        locationManger?.requestAlwaysAuthorization()
        locationManger?.requestLocation()
    }

    func setupMapUI() {

        mapView.overrideUserInterfaceStyle = .light
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        mapView.center = view.center
        mapView.mapType = .standard
        mapView.isScrollEnabled = true
        mapView.delegate = self
    }

    func setupMap(
        name: String,
        lat: CLLocationDegrees,
        long: CLLocationDegrees,
        tripCount: Int
    ) {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long
        let latitudeDelta: CLLocationDegrees = 0.5
        let longitudeDelta: CLLocationDegrees = 0.5
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = name
        annotation.subtitle = "\(tripCount) Trips"
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }

    func checkLocationAuthorization() {
        guard let locationManger = locationManger,
        let location = locationManger.location else {
            return
        }

        switch locationManger.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            let region = MKCoordinateRegion(
                center: location.coordinate,
                latitudinalMeters: 750,
                longitudinalMeters: 750
            )
            mapView.setRegion(region, animated: true)
        case .denied:
            print("Location services has been denied.")
        case .notDetermined, .restricted:
            print("Location services can't be determined or restricted.")
        default:
            print("Unkonwn error. Unable to get location.")
        }
    }
}
