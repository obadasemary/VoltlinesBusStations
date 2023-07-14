//
//  TripsPresenter.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import Foundation
import UIKit

protocol TripsPresenterDelegate: AnyObject {
    func showIndicator()
    func hideIndicator()
    func showsuccessBooking()
    func showError()
    var presenter: TripsPresenter? { get set }
    func presentTrips(with trips: [Trip])
}

protocol TripsCellDelegate: AnyObject {
    func displayBusName(value: String)
    func displayBusTime(value: String)
}

class TripsPresenter {

    private weak var delegate: TripsPresenterDelegate?
    var service: StationsServiceable = StationsService()
    var station: Station?
    let router: TripsVCRouter

    init(
        delegate: TripsPresenterDelegate,
        router: TripsVCRouter,
        station: Station
    ) {
        self.delegate = delegate
        self.router = router
        self.station = station
    }

    func viewDidLoad() {
        guard let newStation = station,
              let trips = newStation.trips else { return }
        delegate?.presentTrips(with: trips)
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
            let stationId = String(station?.id ?? 0)
            let tripId = String(trip?.id ?? 0)

            delegate?.showIndicator()

            self.bookTrip(staionId: stationId, tripId: tripId) { [weak self] result in
                guard let self = self else { return }
                self.delegate?.hideIndicator()
                switch result {
                case .success:
                    self.delegate?.showsuccessBooking()
                case .failure:
                    self.delegate?.showError()
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

    func popView(view: TripsViewController) {
        router.popTripsVC(view: view)
    }
}
