//
//  MapViewController.swift
//  Project
//
//  Created by yukti sarwadia on 5/9/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Location Delegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center  = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: ",  error.localizedDescription)
        
    }
    
    
    // MARK: - Taking screen shot of the location
    
    @IBAction func screenShotButtonPressed(sender: AnyObject) {
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let sourceImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(sourceImage, nil, nil, nil)
        
        UIGraphicsBeginImageContext(view.frame.size)
        sourceImage.drawAtPoint(CGPointMake(-25, -100))
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(croppedImage, nil, nil, nil)

        displayMyAlertMessage("Your screen shot has been saved to device library");
     
}

func displayMyAlertMessage(userMessage: String){
    
    let myAlert = UIAlertController(title: "Success", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
    let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
    
    myAlert.addAction(okAction)
    
    self.presentViewController(myAlert, animated: true, completion: nil);
}

}
