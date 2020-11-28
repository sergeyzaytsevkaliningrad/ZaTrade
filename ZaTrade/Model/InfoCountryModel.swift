import Foundation


class InfoCountryModel  {
    
    var title1 : String = ""
    var generalInfo: String = ""
    var title2 : String = ""
    var title3 : String = ""
    var firstStep: String  =  ""
    var title4 : String = ""
    var secondStep: String = ""
    var title5 : String = ""
    var thirdStep: String = ""
    var title6 : String = ""
    var lon: Double
    var lat: Double

    init(title1 : String, generalInfo: String,title2 : String , title3 : String, firstStep: String, title4 : String,  secondStep: String, title5 : String, thirdStep: String, title6 : String, lon: Double, lat: Double) {
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.title4 = title4
        self.title5 = title5
        self.title6 = title6
        self.generalInfo = generalInfo
        self.firstStep = firstStep
        self.secondStep = secondStep
        self.thirdStep = thirdStep
        self.lon = lon
        self.lat = lat
    }
    
}
