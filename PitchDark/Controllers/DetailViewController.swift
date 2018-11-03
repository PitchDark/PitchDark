//
//  DetailViewController.swift
//  Instagram
//
//  Created by Sanaz Khosravi on 10/3/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import Parse
import MapKit

class DetailViewController: UIViewController {

    
    @IBAction func shareButton(_ sender: Any) {
        let text = detailCaptionLabel.text
        let image = UIImagePNGRepresentation(detailImageView.image!)
        let shareAll = [text , image!] as [Any]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    @IBOutlet var timeStampLabel: UILabel!
    @IBOutlet var detailCaptionLabel: UILabel!
    @IBOutlet var detailImageView: UIImageView!
    var post : Post?
    
    @IBAction func getDirectionButton(_ sender: Any) {
        let address = locationLabel.text
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address!) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    
                    return
            }
            
            if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
                UIApplication.shared.openURL(NSURL(string:
                    "comgooglemaps://?saddr=&daddr=\(location.coordinate.latitude),\(location.coordinate.longitude)&directionsmode=driving")! as URL)
                
            } else {
                NSLog("Can't use comgooglemaps://");
                let coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
                mapItem.name = self.locationLabel.text
                mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
            }
        }
        
    }
    
    
    @IBOutlet var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImageView.image = UIImage(named: "image_placeholder.png")!
        loadPostDetail()
    }
    
    func loadPostDetail() {
        if let imageFile : PFFile = post?.media {
            imageFile.getDataInBackground { (data, error) in
                if (error != nil) {
                    self.detailImageView.image = UIImage(named: "image_placeholder.png")!
                }
                else {
                    self.detailImageView.image = UIImage(data: data!)
                }
            }
            if (post?.caption == ""){
               detailCaptionLabel.text = "No caption is set for this post."
            }else{
                detailCaptionLabel.text = post?.caption
            }
            timeStampLabel.text = formatDateString((post?.createdAt)!)
            locationLabel.text = post?.location
        }
    }
    
    func formatDateString(_ date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        let result = formatter.string(from: date)
        return result
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "weatherSegue"){
            let weatherInfo = segue.destination as! WeatherViewController
            let address = locationLabel.text
            
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address!) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        
                        return
                }
                weatherInfo.lat = location.coordinate.latitude
                weatherInfo.long = location.coordinate.longitude
            }
        }
        
    }

}
