
import Alamofire
import SwiftyJSON



public func getPoster()  {
    let url = "http://cinema.areas.su/movies?filter=new"
    AF.request(url, method: .get).validate().responseJSON {[self] response in
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            
            for i in 0..<json.count {
                getPosters.append(ModelGetPoster(movieId: json[i]["movieId"].stringValue, name: json[i]["name"].stringValue, age: json[i]["age"].stringValue, poster: json[i]["poster"].stringValue))
            }
//                con!("Успешная регистарция", "Успешная регистарция")
            print("JSON: \(json)")
        case .failure(let error):
//                con!("", error.localizedDescription)
            print(error)
        }
    }
}
