//
//  ContentView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 10.03.2024.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    let serverURL: URL
    let client: Client

    init() {
        do {
            serverURL = try Servers.server1()
        } catch {
            preconditionFailure("Cannot obtain server URL")
        }
        client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport(),
            middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Resources.apiKey)]
        )
    }

    var body: some View {
        VStack {
            Button("getNearestStations") {
                nearestStations()
            }
            .padding()
            Button("getCopyright") {
                copyright()
            }
            .padding()
            Button("getSchedules") {
                schedules()
            }
            .padding()
            Button("getSearches") {
                Searches()
            }
            .padding()
            Button("getThreads") {
                Threads()
            }
            .padding()
            Button("getNearestSettlement") {
                nearestSettlement()
            }
            .padding()
            Button("getCarriers") {
                Carriers()
            }
            .padding()
            Button("getStationsList") {
                StationsList()
            }
            .padding()
        }
//        .padding()

    }
    
}

private extension ContentView {
    func nearestStations() {
        let service = NearestStationsService(client: client)
        Task{
            do {
                let response = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
                guard let stations = response.stations,
                      let total = response.pagination?.total,
                      let limit = response.pagination?.limit else { return }
                print(stations, "\n pagination.total:", total, "\n pagination.limit:", limit, "\n stations.count:",stations.count)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func copyright() {
        let service = CopyrightService(client: client)
        Task{
            do {
                let response = try await service.getCopyright()
//                guard let response else { return }
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func schedules() {
        let service = SchedulesService(client: client)
        Task{
            do {
                let response = try await service.getSchedules(station: "s9600213", date: nil)
                guard let schedules = response.schedule,
                      let total = response.pagination?.total,
                      let limit = response.pagination?.limit else { return }
                print(response, "\n pagination.total:", total, "\n pagination.limit:", limit, "\n schedules.count:",schedules.count)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func Searches() {
        let service = SearchService(client: client)
        Task{
            do {
                let response = try await service.getSearches(from: "s9623561", to: "s9600213")
                guard let segments = response.segments,
                      let intervalSegments = response.interval_segments,
                      let total = response.pagination?.total,
                      let limit = response.pagination?.limit else { return }
                print(response, "\n pagination.total:", total, "\n pagination.limit:", limit, "\n segments.count:",segments.count, "\n intervalSegments.count:",intervalSegments.count)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func Threads() {
        let service = ThreadService(client: client)
        Task{
            do {
                let response = try await service.getThread(uid: "UJ-615_240316_c1764_12")
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func nearestSettlement() {
        let service = NearestSettlementService(client: client)
        Task{
            do {
                let response = try await service.getNearestSettlement(lat: 59.864177, lng: 30.319163, distance: 50)
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func Carriers() {
        let service = CarriersService(client: client)
        Task{
            do {
                let response = try await service.getCarriers(code: "SU", system: .iata)
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func StationsList() {
        let service = StationsListService(client: client)
        Task{
            do {
                let response = try await service.getStationsList()
                print("I have response ", response)
                let data = try await Data(collecting: response, upTo: 1024*1024*40)
                print("I have data ", data)
                let stations = try JSONDecoder().decode(Components.Schemas.StationsList.self, from: data)
                guard let countries = stations.countries else { return }
                print(countries.count)
//                print(stations)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
