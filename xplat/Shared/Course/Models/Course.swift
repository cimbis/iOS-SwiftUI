//
//  Course.swift
//  xplat
//
//  Created by JC on 05/12/2020.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var color: Color
}

var courseList: [Course] = [
    Course(title: "SwiftUI", subtitle: "20 sections", image: "Illustration 1", color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))),
    Course(title: "iOS", subtitle: "20 sections", image: "Illustration 2", color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))),
    Course(title: "Plain Swift", subtitle: "20 sections", image: "Illustration 3", color: Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))),
    Course(title: "Hacking with macOS", subtitle: "20 sections", image: "Illustration 4", color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))),
    Course(title: "Reality Kit", subtitle: "20 sections", image: "Illustration 5", color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))),
    Course(title: "CoreML", subtitle: "20 sections", image: "Illustration 6", color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))),
    Course(title: "CoreML 2", subtitle: "20 sections", image: "Illustration 7", color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))),
    Course(title: "Health Kit", subtitle: "20 sections", image: "Illustration 8", color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    Course(title: "UI Design", subtitle: "20 sections", image: "Illustration 9", color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),
    Course(title: "Prototyping", subtitle: "20 sections", image: "Illustration 10", color: Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)))
]
