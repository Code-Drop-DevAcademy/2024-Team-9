//
//  WifiSpeed.swift
//  PoCaJeong
//
//  Created by Seoyeon Choi on 6/15/24.
//

import Foundation
import Combine
import Network

class NetworkSpeedTest: ObservableObject {
    @Published var downloadSpeed: Double?
    
    private var monitor: NWPathMonitor
    private var queue: DispatchQueue
    
    init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        startMonitoring()
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.testDownloadSpeed()
            } else {
                DispatchQueue.main.async {
                    //self.downloadSpeed = "No connection"
                }
            }
        }
        monitor.start(queue: queue)
    }
    
    private func testDownloadSpeed() {
        let url = URL(string: "http://ipv4.download.thinkbroadband.com/1MB.zip")!
        let startTime = Date()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    //self.downloadSpeed = "Error: \(error?.localizedDescription ?? "Unknown error")"
                }
                return
            }
            
            let elapsed = Date().timeIntervalSince(startTime)
            let speed = Double(data.count) / elapsed / 1024.0 / 1024.0
            DispatchQueue.main.async {
                self.downloadSpeed = speed
                print(String(format: "Download Speed: %.2f Mbps", speed))
            }
        }.resume()
    }
}
