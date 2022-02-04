//
//  MapViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 18.10.2021.
//

import Foundation
import UIKit
import MapKit
import Alamofire

class MapViewController: UIViewController {
    
    var headers: HTTPHeaders = []
    var massiveWithStreets: [String] = []
    var massiveWithCities: [String] = []
    var url2 = "salons_mobile/get"
    
    var city = ""
    
    lazy var tableView = UITableView(frame: CGRect.zero)
    
    let locationManager = CLLocationManager()
    var annotationsArray = [MKPointAnnotation]()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Выберите студию"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let segmentedControl : UISegmentedControl = {
        var segmented = UISegmentedControl(items: ["На карте","Списком"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = #colorLiteral(red: 0.9606898427, green: 0.9608504176, blue: 0.9606687427, alpha: 1)
        segmented.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    let topView : UIView = {
        var label = UIView()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = false
        label.layer.shadowOffset = CGSize(width: -15, height: 10)
        label.layer.shadowRadius = 3
        label.layer.shadowOpacity = 0.1
        return label
    }()
    
    var mapView = MKMapView()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        return v
    }()
    
    
    let stackView : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.distribution = .fillEqually
        v.spacing = 10.0
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(topView)
        view.addSubview(segmentedControl)
        view.addSubview(mapView)
        view.addSubview(tableView)
        setConstraints()
        network()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    
    func setConstraints(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: 0),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor ,multiplier: 0.044),
            
            segmentedControl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            segmentedControl.leadingAnchor.constraint(equalTo: topView.leadingAnchor ,constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: topView.trailingAnchor ,constant: -20),
            
            mapView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            tableView.removeFromSuperview()
            view.addSubview(mapView)
            setConstraints()
        case 1:
            mapView.removeFromSuperview()
            self.view.addSubview(tableView)
            self.view.addSubview(scrollView)
            self.scrollView.addSubview(stackView)
            setupTableView()
            setConstraintsTwo()
        default:
            break
        }
    }
    func setConstraintsTwo(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -8.0),
        ])
    }
    
}

extension MapViewController: CLLocationManagerDelegate{
    
    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAutorization()
    }
    
    func checkAutorization(){
        switch CLLocationManager.authorizationStatus(){
        case.authorizedAlways:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case.authorizedWhenInUse:
            break
        case.denied:
            showAlertLocation(title: "Вы запретили использование местоположения", message: "Хотите это изменить", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func showAlertLocation(title: String,message: String?,url:URL?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
            if let url = url{
                UIApplication.shared.open(url, options: [:],completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert,animated: true,completion: nil)
    }
    
    func checkLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            checkAutorization()
            setupManager()
        } else {
            showAlertLocation(title: "У вас выключена служба геолокации", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func creatingPoints(){
        for i in 0 ... self.massiveWithCities.count - 1{
            print(self.massiveWithCities[i])
            setupPlacemark(adressPlace: self.massiveWithCities[i] + " " + self.massiveWithStreets[i])
        }
//        print(self.massiveWithCities)
//        for i in 0 ...  self.massiveWithCities.count - 1{
//            if city == massiveWithCities[i]{
//                print("Улица" + massiveWithStreets[i])
//                city = city + " " + massiveWithStreets[i]
//            }
//        }
//        setupPlacemark(adressPlace: city)
    }
    
    func setupPlacemark(adressPlace: String){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(adressPlace) { [self] (placemark, error) in
            guard let placemarks = placemark else { return }
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = "\(adressPlace)"
            guard let placemarkLocation = placemark?.location else { return }
            annotation.coordinate = placemarkLocation.coordinate
            
            annotationsArray.append(annotation)
            mapView.showAnnotations(annotationsArray, animated: true)
        }
    }
}

extension MapViewController: UITableViewDelegate,UITableViewDataSource {
    
    private func setupTableView(){
        tableView.register(StudiosTableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massiveWithStreets.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! StudiosTableViewCell
        //        cell.selectionStyle = .none
        //        cell.textLabel!.numberOfLines = 0
        //        cell.textLabel!.lineBreakMode = .byWordWrapping
        //        cell.balanceLabel.text = massive[indexPath.row]
        //        cell.textLabel?.text = massive[indexPath.row]
        cell.titleLabel.text = massiveWithStreets[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
    func creatingButtons(){
        for _ in 0...self.massiveWithStreets.count {
            
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.backgroundColor = .white
            b.layer.cornerRadius = 10
            b.backgroundColor = UIColor.white
            b.layer.shadowColor = UIColor.black.cgColor
            b.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            b.layer.shadowOpacity = 0.4
            b.layer.shadowRadius = 2
            b.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
            b.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
            
            
            
            let nameLabel: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 12)
                label.textColor = .gray
                label.text = "Доступно услуг: 12"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            
        }
    }
}


extension MapViewController {
    func network(){
        headers = [.authorization(bearerToken: token)]
        let parameters: Parameters = ["client_id": 1]
        
        AF.request(baseURL + url2, method: .get,parameters: parameters).validate().responseJSON{ responseJSON in
            switch responseJSON.result {
            case .success(let value):
                guard let jsonArray = value as? Array<[String: Any]> else { return }
                //print(jsonArray)
                var disallows: [Certificate] = []
                
                for jsonObject in jsonArray {
                    guard
                        let address = jsonObject["address"] as? String
                    else {
                        return
                    }
                    guard
                        let city_name = jsonObject["city_name"] as? String
                    else {
                        return
                    }
                    let certificate = MapStudio(address: address, city_name: city_name)
                    self.massiveWithStreets.append(certificate.address)
                    self.massiveWithCities.append(certificate.city_name)
                }
                
            case .failure(let error):
                //print("V")
                print(error)
            }
            //print(self.massiveWithStreets[0])
            //print(self.massiveWithCities)
            self.tableView.reloadData()
            self.creatingPoints()
        }
        
    }
}
struct MapStudio{
    var address: String
    var city_name: String
}
