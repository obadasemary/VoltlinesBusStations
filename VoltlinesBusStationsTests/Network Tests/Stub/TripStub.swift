//
//  TripStub.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import Foundation
@testable import VoltlinesBusStations

extension Trip {

    static let stub: Trip = .init(
        busName: "UK-20",
        id: 20010,
        time: "7:01 AM"
    )
}
