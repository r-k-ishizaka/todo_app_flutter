# TODOアプリ
Flutter の勉強用に作成している Todo 管理アプリ

以下の issue に沿って実装を行う
- https://github.com/r-k-ishizaka/todo_app_flutter/issues/1

# アーキテクチャ
```mermaid
---
title: アーキテクチャ - クラス図
---
classDiagram
  direction LR
    Component <.. Page
    Page ..> ViewModel
    ViewModel ..> Repository
    ViewModel ..> UseCase
    ViewModel ..> Validator
    UseCase ..> Repository
    Repository ..> Model
    Repository <|-- RepositoryImpl
    RepositoryImpl ..> DatabaseHelper

    namespace UI {
      class Component {
      }
      class Page{
      }
      class ViewModel{
      }
    }
    namespace Domain {
      class Repository{
        <<interface>>
      }
      class UseCase{
      }
      class Validator{
      }
      class Model {
      }
    }
    namespace Data {
      class RepositoryImpl{
      }
      class DatabaseHelper{
      }
    }

```
