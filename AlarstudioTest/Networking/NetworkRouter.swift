//
//  NetworkRouter.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkRouter: URLRequestConvertible {
    
    enum Constants {
        static let baseURLPath = "http://condor.alarstudios.com/test"
    }
    
    case loginUser(String, String)
    case list(Int, Int)
    
    var method: HTTPMethod {
        switch self {
        case .loginUser, .list:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .loginUser:
            return "/auth.cgi"
        case .list:
            return "data.cgi"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .loginUser(let username, let password):
            return ["username": username,
                    "password": password
            ]
        case .list(let code, let page):
            return ["code" : code,
                    "p"    : page
            ]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURLPath.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
//        request.allHTTPHeaderFields = ["Accept": "application/vnd.github.mercy-preview+json"]
        return  try URLEncoding.default.encode(request, with: parameters)
    }
    
    
}

///-----------------------------------------------------------------------------------------///

/// http://condor.alarstudios.com/test/auth.cgi?username=test&password=123
/// username=test, password=123 ---> "0676833182"

/*
{
    "status": "ok",
    "code": "5669137482"
*/

/// http://condor.alarstudios.com/test/data.cgi?code=0676833182&p=1
/// параметры запроса: code=XXX из предыдущего шага, p=N - страница с 1), выдает по 10 элементов.

/*
 Сделать простое приложение клиент для просмотра онлайн базы данных.
 
 Общие требования:
 - Swift или Objective-C (лучше Swift)
 - Использовать стандартные средства iOS/Cocoa Touch
 - Можно использовать ReactiveCocoa
 - Все должно быть кратко и понятно
 - Цель теста: увидеть, как претендент пишет код и придумывает архитектуру - никаких копи-пейст "стандартных решений"
 
 Три экрана:
 
 1. При запуске. Показывает текстовые поля логин/пароль и кнопку "Войти". При нажатии идет к серверу GET http://condor.alarstudios.com/test/auth.cgi (параметры запроса: username=XXX, password=XXX), он возвращает JSON. Если "status" == "ok", то пропускаем, нет - показываем красиво, что логин/пароль неправильные. Сервер выдаст "ok" на "test"/"123" и тогда идем на следующий экран, запоминая "code".
 
 2. Таблица с данными. Данные получаем по GET http://condor.alarstudios.com/test/data.cgi (параметры запроса: code=XXX из предыдущего шага, p=N - страница с 1), выдает по 10 элементов. В приложении - отображается как бесконечная пагинация. Доходим до "низа" списка - подгружаем данные. Каждый элемент таблицы должен содержать картинку (выберите любой внешний URL), подгружаемую асинхронно и имя (name из полученных данных). При нажатии на элемент, переходим на третий экран.
 
 3. По нажатию на элемент на втором экране переходим сюда и показываем все поля и карту с точкой по координатам в полях "lat"/"lon" из JSON. Даем возможность вернуться к списку.
 
 Все. Очень просто. На выполнение дается 48 часов. Оцениваем не только сам факт и скорость выполнения, но в гораздо большей степени качество, аккуратность и выбранные решения.
 */














