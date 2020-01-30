//
//  ContentView.swift
//  PickerDemo
//
//  Created by Arjun on 29/01/20.
//  Copyright © 2020 Arjun Patel. All rights reserved.
//

import SwiftUI

struct RangePicker:View {
    @State private var moonDate = Date()
    
    var withNext30Days:ClosedRange<Date> {
        let currentDate = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
        let next30Day = Calendar.current.date(byAdding: .day, value: 30, to: Date())!
        return currentDate...next30Day
    }
    
    var body: some View {
        VStack(spacing:20) {
            Text("Date Picker")
                .font(.largeTitle)
            Text("Min and Max Date Range")
                .foregroundColor(.gray)
            DatePicker("Next30Days", selection: $moonDate, in: withNext30Days, displayedComponents: .date)
                .labelsHidden()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.yellow)
            )
                .shadow(radius: 20)
            
            Text("(Valid range on 30 next days)")
                .font(.subheadline)
            
            Spacer()
            
        }.font(.title)
    }
}

struct SpecificDate:View {
    @State private var moonTime = Date()
    
    //let fromDate = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
    let fromToday = Calendar.current.date(byAdding: .minute,
                                          value: -1, to: Date())!
    let mainColor = Color("AccentColorDark")
    var body: some View {
        VStack(spacing:20) {
            
            Text("Date Picker")
                .font(.largeTitle)
            
            Text("From date and time")
            
            Text("You can set starting date or time the DatePicker")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            DatePicker("DateTime", selection: $moonTime, in: ...fromToday, displayedComponents: .date)
                .labelsHidden()
                .padding(.horizontal,28)
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.yellow))
            
            Spacer()
        }.font(.title)
    }
}

struct PicekrINForm: View {
    @State private var moonDateTime = Date()
    var body: some View {
        Form {
            Section(header: Text("DatePicker").font(.largeTitle)
            ) {
                Text("Used in form")
                
                Text("The DatePicker looks differently when used form. The first paramter title is used when in form and list")
                    .padding()
                    .listRowBackground(Color.yellow)
                
                DatePicker("Date and Time", selection: $moonDateTime, displayedComponents: .date)
                DatePicker("Hour and minute", selection: $moonDateTime, displayedComponents: .hourAndMinute)
                
            }
            Spacer()
        }.font(.title)
    }
}
struct Pickercomponent: View {
    @State private var nextFullmoonDate = Date()
    var body: some View {
        List{
            VStack(spacing:20) {
                
                Text("Date Picker")
                    .font(.largeTitle)
                
                Text("Display Components")
                    .foregroundColor(.gray)
                
                Text("Show Date and time parts with displayComponents")
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(Color.yellow)
                
                DatePicker("DateAndTime", selection: $nextFullmoonDate, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                
                Text("Combine Date and Time an array")
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(Color.yellow)
                
                DatePicker("Date", selection: $nextFullmoonDate, displayedComponents: [.date,.hourAndMinute])
                    .labelsHidden()
                
                Spacer()
            }
            .font(.title)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
struct TitlePicker: View {
    @State private var nextFullmoonDate = Date()
    var body: some View {
        VStack(spacing:20) {
            Text("Date Picker")
                .font(.largeTitle)
            Text("Your Own Title")
                .foregroundColor(.gray)
            Text("Even you add own title, You still have the problem with date picker identify")
                .padding()
                .background(Color.yellow)
            
            VStack(alignment:.center,spacing:10){
                Text("Date of next fool moon")
                DatePicker("FullMoonPicker", selection: $nextFullmoonDate, displayedComponents: .date)
                    .labelsHidden() // Hide label
            }
            Spacer()
        }.font(.title)
    }
}


struct ContentView: View {
    @State private var nextfullMoonDate = Date()
    
    var body: some View {
        VStack(spacing:10) {
            Text("Date Picker")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            Text("Bind a date variable to get and set the in DatePicker")
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color.yellow)
                .font(.title)
            HStack {
                Spacer()
                Image(systemName: "moon.circle")
                    .background(Color.white)
                
                Spacer()
                Circle().frame(width: 30, height: 30, alignment: Alignment.center)
                Spacer()
                
                Image(systemName: "moon.circle.fill")
                    .background(Color.white)
                
                Spacer()
            }
            .foregroundColor(.yellow)
            
            DatePicker("Full moon date", selection: $nextfullMoonDate, displayedComponents: .date)
                .padding()
            
            Text("Selected Date:\(nextfullMoonDate)")
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            //ContentView()
            TitlePicker()
            //Picker conponents
            Pickercomponent()
            //Picker In Form
            PicekrINForm()
            //From specific date or time
            SpecificDate()
            //Range Picker
            RangePicker()
        }
    }
}
