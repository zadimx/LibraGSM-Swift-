//
//  SwiftUIView.swift
//  LibraGSM
//
//  Created by Zinovatny Maksym on 31.01.2022.
//

import SwiftUI

struct CurvedShape: View {
    var body: some View {
      Path { path in
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 90))
        path.addArc(center: CGPoint(x: UIScreen.main.bounds.width/2, y: 90), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: 90))
      }.fill(Color.green)
      .rotationEffect(.init(degrees: 180))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CurvedShape()
    }
}
