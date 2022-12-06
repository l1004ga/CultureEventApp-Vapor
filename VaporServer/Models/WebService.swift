//
//  WebService.swift
//  SeoulCulturalEvent
//
//  Created by danny.ho_2PC on 2022/11/24.
//

import Foundation
import Vapor

class WebService{
    //3. 따라서 row 구조체 선언부와 같은 타입으로 반환형을 설정해줘야 한다.
    func fetchCultureData(url:String) async throws -> MainInfo {
        let fetchURL = URL(string: url)!
        // URLSession task
        
        print("JSON 가져오기 전")
        let (data,_) = try await URLSession.shared.data(from: fetchURL)
        // JSONDecode (지금은 String 타입으로 변환)
        //        let dataToString = String(data: data, encoding: .utf8)!
        let mainInfo = try JSONDecoder().decode(MainInfo.self, from: data)
        
        print("JSON 가져온 후")
        return mainInfo
    }
    
}

//func fetchCafeData(url: String) async throws -> Cafe {
//        // url 변환
//        let fetchURL = URL(string: url)!
//        // URLSession task
//        let (data,_) = try await URLSession.shared.data(from: fetchURL)
//        // JSONDecode (지금은 String 타입으로 변환)
//        //        let dataToString = String(data: data, encoding: .utf8)!
//        let cafes = try JSONDecoder().decode(Cafe.self, from: data)
//        return cafes
//        
//    }
