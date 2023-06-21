//
//  DayForcastTableViewCell.swift
//  Forecast_Codable
//
//  Created by Karl Pfister on 2/6/22.
//

import UIKit

class DayForcastTableViewCell: UITableViewCell {

    @IBOutlet weak var dayValidDateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var forcastedHighLabel: UILabel!
    
    func updateViews(day: Day) {
        dayValidDateLabel.text = day.validDate
        iconImageView.image = UIImage(named: day.weather.iconString)
        forcastedHighLabel.text = "\(day.highTemp)F"
    }
}
