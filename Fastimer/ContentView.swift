//
//  ContentView.swift
//  Fastimer
//
//  Created by Soro on 2023-01-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //MARK: Background
            Color(#colorLiteral(red: 0.03076675162, green: 0.03076675534, blue: 0.03076675162, alpha: 1)).ignoresSafeArea()
            
            content
        }
    }
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                //MARK: Title
                Text("Let's get started")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                //MARK: Fasting plan
                Text("16:8")
                    .fontWeight(.semibold)
                    .padding(.horizontal,24)
                    .padding(.vertical,8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            VStack(spacing:40) {
                //MARK: Progress ring
                ProgressRing()
                
                HStack(spacing: 60) {
                    //MARK: Start Time
                    VStack(spacing: 5) {
                        Text("Start")
                            .opacity(0.7)
                        Text(Date(), format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    
                    //MARK: End Time
                    VStack(spacing: 5) {
                        Text("End")
                            .opacity(0.7)
                        Text(Date().addingTimeInterval(16), format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                //MARK: Button
                Button {
                    
                } label: {
                    Text("Start Fasting")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal,24)
                        .padding(.vertical,8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }

            }
            .padding()
            
        }
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
