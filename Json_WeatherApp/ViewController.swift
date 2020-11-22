//
//  ViewController.swift
//  Json_WeatherApp
//
//  Created by Berker Vergi on 20.11.2020.
//

import UIKit
import Foundation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var locationLBL: UILabel!
    @IBOutlet weak var ımage: UIImageView!
    @IBOutlet weak var dereceLbl: UILabel!
    @IBOutlet weak var yuzdeNem: UILabel!
    @IBOutlet weak var yuzdeYagmur: UILabel!
    @IBOutlet weak var informaitionLbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
   
    
    var locationManager = CLLocationManager()
   
    let client = DarkSkyApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        
        self.locationManager.delegate = self
        //uygulama açıldığında kullanıcıdan konum bilgisini paylaşmayı isteyecek
        self.locationManager.requestWhenInUseAuthorization()
        
        
        // konum servisi cihazda açık mı ?
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            //konum bilgisini almaya başlayacak
            locationManager.startUpdatingLocation()
        }

    }
   
    //konum bilgisi değişirse bu kod bloğu çalışır.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locationValue : CLLocationCoordinate2D = manager.location!.coordinate
        let clientCoordinate = Coordinate(latitude: locationValue.latitude, longitude: locationValue.longitude)
        print("Latitude : \(clientCoordinate.latitude), Longitude : \(clientCoordinate.longitude)")
        updateWeather(coordinate: clientCoordinate)
        
        
    }
    
    func updateWeather(coordinate : Coordinate) {
        client.getCurrentWeather(at: coordinate) { currentWeather, error in
            
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherModel(data: currentWeather)
                
                
                DispatchQueue.main.sync {
                    self.showWeather(model: viewModel)
                }
                
            }
            
            
        }
        
        
    }
    
    
    func showWeather (model : CurrentWeatherModel){
        informaitionLbl.text = model.summary
        yuzdeNem.text = model.humidity
        dereceLbl.text = model.temperature
        yuzdeYagmur.text = model.precipatitonProbability
        ımage.image = model.icon
        indicator.stopAnimating()
    }
    
    @IBAction func refresh(_ sender: Any) {
        indicator.startAnimating()
        locationManager(locationManager, didUpdateLocations: [])
    }
    
    
    
    
}

