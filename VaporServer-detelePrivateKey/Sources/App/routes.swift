import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("events") { req async throws -> MainInfo in
        let eventsList: CulturalEventData = CulturalEventData(events: MainInfo(culturalEventInfo: CulturalEventInfo(row: [])))
        
        let webService: WebService = WebService()
        
        let url: String = "http://openapi.seoul.go.kr:8088/(input your private key)/json/culturalEventInfo/1/20/"
        
        
        eventsList.events = try await webService.fetchCultureData(url: url)
        
        return eventsList.events
    }}
