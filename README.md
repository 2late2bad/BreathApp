# Breath
![iOS](https://img.shields.io/badge/iOS-14+%20-white?logo=Apple&logoColor=white)
![Swift](https://img.shields.io/badge/Swift-5.5-red?logo=Swift&logoColor=red)
![Xcode](https://img.shields.io/badge/Xcode-14.3%20-00B2FF?logo=Xcode&logoColor=00B2FF)

Проект находится в стадии отрисовки и разработки.

Собственный дизайн приложения [Figma](https://www.figma.com/proto/CwEIAxo2quX8nz2Nl1KYrt/Breath-App?page-id=46%3A2291&type=design&node-id=46-2292&viewport=279%2C391%2C0.29&t=bwT82qKmQjTg7LVp-1&scaling=min-zoom&starting-point-node-id=46%3A2392&mode=design)

Breath - приложение для людей, страдающих от аллергии на пыльцу:
- Мониторинг качества воздуха и аллергенов по геолокации
- Карта распространения пыльцы в онлайн-режиме
- Ежедневный мониторинг самочувствия
- Новостная лента и социальная лента с отзывами других людей о своем состоянии
- Рекомендации и советы на основе автоматического анализа окружающей среды
- Поддержка светлой и темной темы
- Локализация на русском и английском языках

## Tech stack
* UIKit + SwiftUI
* MVVM + Coordinator
* Reactive: Combine
* Database: Firebase
* Data storage: UserDefaults, CoreData
* async/await, URLSession
* SnapKit, R.swift, SwiftLint
* SPM

## TODO
* Реализация модуляризации приложения (frameworks) + Dependencies: UI, Core -> SDK -> App
* Навигация с помощью координатора (универсальный для UIKit, SwiftUI)
* Flow: Onboarding, Auth, Main (Analytics, News, Social), Settings, Health, AirQuality/Pollen, Map
* Services: Network, Storage, Analytics
* Интеграция Firebase
* UI/UNIT тесты

### Resources
* [API: Open-Meteo](https://open-meteo.com/en/docs)
