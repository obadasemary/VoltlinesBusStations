//
//  TripsPresenter.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import Foundation
import UIKit

protocol TripsPresenterDelegate: AnyObject {
    var presenter: TripsPresenter? { get set }
    func presentStations(station: Station)
}

protocol TripsCellDelegate {
    func displayBusName(value: String)
    func displayBusTime(value: String)
}

class TripsPresenter {

    private weak var delegate: TripsPresenterDelegate?
    var service: StationsServiceable = StationsService()
    var station: Station?

    init(delegate: TripsPresenterDelegate, station: Station) {
        self.delegate = delegate
        self.station = station
    }

    func viewDidLoad() {
        guard let newStation = station else { return }
        delegate?.presentStations(station: newStation)
    }

    func getTripsCount() -> Int {
        return station?.tripsCount ?? 0
    }

    func configure(cell: TripsCellDelegate, for index: Int) {
        let trip = station?.trips?[index]
        cell.displayBusName(value: trip?.busName ?? "")
        cell.displayBusTime(value: trip?.time ?? "")
    }

    func didTap(cell: TripsTableViewCell, for index: Int) {
        cell.didBookTrip = { [unowned self] in
            let trip = station?.trips?[index]
            print(trip)
            let stationId = String(station?.id ?? 0)
            let tripId = String(trip?.id ?? 0)

            self.bookTrip(staionId: stationId, tripId: tripId) { [weak self] result in

                guard let self = self else { return }
                switch result {
                case .success(let response):
                    print("response", response)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

    func bookTrip(
        staionId: String,
        tripId: String,
        completionHanlder: @escaping (Result<Trip, RequestError>) -> Void
    ) {
        Task(priority: .background) {
            let result = await service.bookTrip(stationId: staionId, tripId: tripId)
            completionHanlder(result)
        }
    }
}
