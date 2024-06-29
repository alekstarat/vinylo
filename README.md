# **"VinylO" - Интернет-магазин виниловых пластинок**

> [!NOTE]
> Все данные взяты с сайта https://disco.market

## Скриншоты

| Home Page | Shop Item Page | Login Page |
|-----------|----------------|------------|
|![homepage](https://github.com/alekstarat/vinylo/assets/90523142/1616b3dc-0616-4e9e-9081-3b0115168421)| ![shopitempage](https://github.com/alekstarat/vinylo/assets/90523142/d0f50402-3ee8-4a30-ac56-43192162501c) | ![loginpage](https://github.com/alekstarat/vinylo/assets/90523142/3572d823-9935-4f14-ba0d-b9d4cbdcc6c7)
| Cart Page | Order Page | Profile Page |
|![cartpage](https://github.com/alekstarat/vinylo/assets/90523142/f2e5bb56-ad3c-4dca-8c95-63662774aa92)|![confirmorderpage](https://github.com/alekstarat/vinylo/assets/90523142/0bbeb1d2-24f6-4d36-96a8-97b731cb9112) | ![profilepage](https://github.com/alekstarat/vinylo/assets/90523142/e7bbd719-9f14-47b5-a80b-572492aaa6e3)



## Стек технологий
> - firebase_auth
> - cloud_firestore
> - flutter_bloc
> - google_sign_in
> - carousel_slider
> - theme_provider
> - cached_network_image
> - dots_indicator
> - equatable

## Архитектура приложения
> ![VinylO](https://github.com/alekstarat/vinylo/assets/90523142/64fa5f82-41ca-4a30-8665-4fe104c72cac)

<details>
  <summary>Дерево файлов проекта</summary>
  
  ```
  |   app.dart
  |   firebase_options.dart
  |   main.dart
  |   theme.dart
  |
  +---assets
  +---blocs
  |   \---authentication_bloc
  |           authentication_bloc.dart
  |           authentication_event.dart
  |           authentication_state.dart
  |
  +---fonts
  |       UbuntuSans_Condensed-Bold.ttf
  |       UbuntuSans_Condensed-Regular.ttf
  |
  +---models
  |       cart.dart
  |
  \---pages
      +---home_page
      |   |   home_page.dart
      |   |   home_page_content.dart
      |   |
      |   +---blocs
      |   |   \---database_bloc
      |   |           database_bloc.dart
      |   |           database_event.dart
      |   |           database_state.dart
      |   |
      |   +---components
      |   |   |   custom_divider.dart
      |   |   |   custom_drawer.dart
      |   |   |
      |   |   +---carousel_slider
      |   |   |       carousel.dart
      |   |   |
      |   |   +---news_widget
      |   |   |       news_tile.dart
      |   |   |       news_widget.dart
      |   |   |
      |   |   +---popular_items
      |   |   |       popular_items.dart
      |   |   |
      |   |   +---recommended_items
      |   |   |       recommended_items.dart
      |   |   |
      |   |   \---shop_item
      |   |           shop_item.dart
      |   |           shop_item_photo.dart
      |   |
      |   \---pages
      |       +---cart_page
      |       |   |   cart_page.dart
      |       |   |
      |       |   +---blocs
      |       |   |   \---cart_bloc
      |       |   |           cart_bloc.dart
      |       |   |           cart_event.dart
      |       |   |           cart_state.dart
      |       |   |
      |       |   +---components
      |       |   |       cart_items.dart
      |       |   |       cart_payments.dart
      |       |   |
      |       |   \---pages
      |       |       \---order_page
      |       |           |   order_page.dart
      |       |           |
      |       |           +---blocs
      |       |           |   \---order_bloc
      |       |           |           order_bloc.dart
      |       |           |           order_event.dart
      |       |           |           order_state.dart
      |       |           |
      |       |           \---components
      |       |                   order_tile.dart
      |       |
      |       +---profile_page
      |       |   |   profile_page.dart
      |       |   |   profile_page_view.dart
      |       |   |
      |       |   +---components
      |       |   |       custom_tile.dart
      |       |   |
      |       |   \---pages
      |       |       +---history_page
      |       |       |   |   history_page.dart
      |       |       |   |
      |       |       |   \---components
      |       |       |           history_page_view.dart
      |       |       |           history_tile.dart
      |       |       |
      |       |       +---notifications_page
      |       |       \---payments_page
      |       |           |   payments_page.dart
      |       |           |
      |       |           +---blocs
      |       |           |   \---payment_bloc
      |       |           |           payment_bloc.dart
      |       |           |           payment_event.dart
      |       |           |           payment_state.dart
      |       |           |
      |       |           \---components
      |       |                   payments_widget.dart
      |       |
      |       +---recommended_items_page
      |       \---shop_item_page
      |           |   shop_item_page.dart
      |           |
      |           \---components
      |                   rating_stars.dart
      |                   toggle_like.dart
      |
      +---login_page
      |   |   login_page.dart
      |   |
      |   +---blocs
      |   |   \---sign_in_bloc
      |   |           sign_in_bloc.dart
      |   |           sign_in_event.dart
      |   |           sign_in_state.dart
      |   |
      |   +---components
      |   |       login_form.dart
      |   |
      |   +---models
      |   |       button_model.dart
      |   |       textfield_model.dart
      |   |
      |   \---views
      |           button_view.dart
      |           textfield_view.dart
      |
      +---registration_page
      |   |   registration_page.dart
      |   |
      |   +---blocs
      |   |   \---sign_up_bloc
      |   |           sign_up_bloc.dart
      |   |           sign_up_event.dart
      |   |           sign_up_state.dart
      |   |
      |   \---components
      |           registration_form.dart
      |
      \---settings_page
          |   settings_page.dart
          |
          +---bloc
          |   \---settings_bloc
          |           settings_bloc.dart
          |           settings_event.dart
          |           settings_state.dart
          |
          \---components
                  change_theme_option.dart
```
</details>



