//
//  ContentView.swift
//  SeoulCulturalEvent
//
//  Created by l1004ga on 2022/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var culturalEventData : CulturalEventData = CulturalEventData()
    
    @State private var path = NavigationPath()
    
    var webService : WebService = WebService<MainInfo>()
    
    let url : String = "http://127.0.0.1:8080/events"
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(culturalEventData.events.culturalEventInfo.row, id: \.self) { event in
                    NavigationLink {
                        ScrollView{
                            VStack(alignment: .leading){
                                Link(destination: URL(string: event.ORG_LINK)!) {
                                    AsyncImage(url: URL(string: event.MAIN_IMG)){ image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        Image(systemName: "photo.fill")
                                    }.frame(maxWidth: .infinity)
                                }
                                
                                VStack(alignment: .leading){
                                    Text("위치 : \(event.PLACE)")
                                    Divider()
                                    Text("관람가 : \(event.USE_TRGT)")
                                    Divider()
                                    Text("가격 : \(event.USE_FEE)")
                                    Divider()
                                    Text("일정 : \(event.STRTDATE) ~ \(event.END_DATE)")
                                    Divider()
                                }.padding(.leading).font(.title3)
                            }
                        }.navigationTitle("\(event.TITLE)")
                    } label: {
                        Text("\(event.TITLE)")
                    }.navigationTitle("서울시 문화이벤트")
                    //                            .task {
                    //                        do {
                    //                            culturalEventData.events = try await webService.fetchCultureData(url: url)
                    //                            print(culturalEventData.events.culturalEventInfo.row[0].PLACE)
                    //                        } catch {
                    //                            return
                    //                        }
                    //                    }
                    
                }
            }.onAppear {
                Task{
                    culturalEventData.events = try await webService.fetchCultureData(url: url)
                    print(culturalEventData.events.culturalEventInfo.row[0].PLACE)
                }
            }
        }
        
        
        //        NavigationView {
        //            List {
        //                NavigationLink("서울시 문화행사"){
        //                    VStack{
        //                        Text("test")
        //                        List{
        //                            ForEach(culturalEventData.events.culturalEventInfo.row, id: \.self) { event in
        //                                VStack{
        //                                    Text("\(event.GUNAME)")
        //                                    Text("\(event.TITLE)")
        //                                    Text("\(event.PLACE)")
        //                                    Text("\(event.USE_TRGT)")
        //                                    Text("\(event.USE_FEE)")
        //                                    Text("\(event.ORG_LINK)")
        //                                    Text("\(event.MAIN_IMG)")
        //                                    Text("\(event.STRTDATE)")
        //                                    Text("\(event.END_DATE)")
        //                                }
        //                            }
        //                        }
        //                    }
        ////                    .onAppear {
        ////                        Task{
        ////                            print("log1")
        ////                            culturalEventData.events = try await webService.fetchCultureData(url: url)
        ////                            print(culturalEventData.events)
        ////                        }
        ////                    }
        //                }
        //            }.task {
        //                do {
        //                    culturalEventData.events = try await webService.fetchCultureData(url: url)
        //                } catch {
        //                    return
        //                }
        //            }
        //
        //        }
        
        
        
        //                NavigationStack {
        //                    List{
        //                        NavigationLink("서울시 문화행사", value: "1")
        //                            .navigationDestination(for: String.self) { value in
        //
        //                                Text("test")
        //
        ////                                VStack{
        ////                                    List{
        ////                                        ForEach(culturalEventData.events, id: \.self) { event in
        ////                                            VStack{
        ////                                                Text("\(event.GUNAME)")
        ////                                                Text("\(event.TITLE)")
        ////                                                Text("\(event.PLACE)")
        ////                                                Text("\(event.USE_TRGT)")
        ////                                                Text("\(event.USE_FEE)")
        ////                                                Text("\(event.ORG_LINK)")
        ////                                                Text("\(event.MAIN_IMG)")
        ////                                                Text("\(event.STRTDATE)")
        ////                                                Text("\(event.END_DATE)")
        ////                                            }
        ////                                        }
        ////                                    }
        //
        //                                }.onAppear {
        //                                    Task{
        //                                        culturalEventData.events = try await webService.fetchData(url: url)
        //                                        print("log")
        //                                        print(culturalEventData)
        //                                    }
        ////                                }
        //                            }
        //                    }
        //
        //                }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
