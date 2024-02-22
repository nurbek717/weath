//
//  ViewController.swift
//  water
//
//  Created by Macbook pro  on 2/21/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var weatheLable: UILabel!
    @IBOutlet var weaterButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        weaterButton.addTarget(self, action: #selector(didTabweaterButton), for: .touchUpInside)
    }
    @objc func didTabweaterButton() {
        let userString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true"
        let url = URL(string: userString)!
        let requarse = URLRequest(url: url )
        let task = URLSession.shared.dataTask(with: requarse) { data, response, error in
            if let data, let weather = try? JSONDecoder().decode(WeatherData.self,from: data){
                
                DispatchQueue.main.async{
                    self.weatheLable.text = "\(weather.currentWeather.temperature) °C"
                }
            }else {
                print("Feal!")
            }
            
        }
        
        task.resume()
    }
   
}

