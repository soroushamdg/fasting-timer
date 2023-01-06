//
//  ProgressRing.swift
//  Fastimer
//
//  Created by Soro on 2023-01-05.
//

import SwiftUI

struct ProgressRing: View {
    @State var progress = 0.5
    var body: some View {
        ZStack {
            //MARK: Placeholder ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            //MARK: Colored Ring
            Circle()
                .trim(from: 0.0,to: min(progress,1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue,Color.pink,Color.pink,Color.cyan,Color.blue]), center: .center),style: StrokeStyle(lineWidth: 15.0,lineCap: .round,lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                //MARK: Elapsed time
                VStack(spacing: 5) {
                    Text("Elapsed time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top)
                VStack(spacing: 5) {
                    Text("Remaining time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(width: 250,height: 250)
        .padding()
        .onAppear {
            progress = 1
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
    }
}
