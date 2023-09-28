//
//  OnboardModel.swift
//  OnboardSDK
//
//  Created by Alexander V. on 27.09.2023.
//

import Foundation

struct OnboardModel {
    let image: String?
    let mainText: String
    let description: String
    let buttonText: String
    let tabBarModel: [TabBarModel]?
    
    static let shared: [OnboardModel] = [
        OnboardModel(image: "hand.wave.fill",
                     mainText: "Привет!",
                     description: "Давай я расскажу тебе подробнее о приложении и чем оно может помочь",
                     buttonText: "Хорошо",
                     tabBarModel: nil),
        OnboardModel(image: nil,
                     mainText: "",
                     description: "У тебя есть 4 вкладки, где ты сможешь получить следующую информацию",
                     buttonText: "Отлично!",
                     tabBarModel: [
            .init(image: "house.fill", description: "На главной можно увидеть общий анализ окружающей среды, прочесть актуальные новости и обсудить с другими аллергиками свое состояние"),
            .init(image: "heart.fill", description: "Твое здоровье - следи за рекомендациями, подобранными для тебя, а также веди дневник самочувствия по каждому сезону"),
            .init(image: "aqi.medium", description: "Контроль чистоты воздуха. Узнавай, какие аллергены и загрязнения в твоем районе"),
            .init(image: "map.fill", description: "Карта распространения пыльцы. Планируй свой маршрут передвижения и не подвергай себя излишнему риску")
        ]),
        OnboardModel(image: "eyes.inverse",
                     mainText: "Мы ждем тебя",
                     description: "Для корректной работы приложения необходимо авторизоваться и дать приложению доступ к Вашей геолокации",
                     buttonText: "Продолжить",
                     tabBarModel: nil),
    ]
}

struct TabBarModel: Identifiable {
    let id = UUID()
    let image: String
    let description: String
}
