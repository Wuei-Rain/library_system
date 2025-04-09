# library_system
随着数字化管理的普及，传统的图书馆管理方式逐渐暴露出效率低、管理复杂等问题，尤其是在图书借还记录、用户信息维护方面存在局限。基于此，我设计了一款基于Spring Boot的图书管理系统，以简化操作流程并提升图书管理效率。系统采用Spring Boot作为核心框架，结合MyBatis实现数据库交互，运用layui做为ui框架，Thymeleaf模板引擎构建前端页面，提供了图书管理、借阅管理和用户管理等主要功能。基于Spring Boot的图书管理系统具备高效、便捷的特点，适合图书馆及机构书籍管理需求，是信息时代图书管理的理想解决方案。

   --表示层（前端）
    技术：Thymeleaf + Layui + jQuery/Ajax
    界面设计：采用响应式设计，使得前端界面能够在桌面和移动设备上都能良好显示。
    功能模块划分：将页面划分为多个模块（如图书查询模块、借书还书模块、用户反馈模块等），每个模块只处理与其相关的功能。
    异步交互：通过Ajax和jQuery技术，减少页面刷新，提升用户交互体验。
    业务逻辑层（后端）
    技术：Spring Boot + MyBatis
    分层设计：将业务逻辑分为多个层次（服务层、持久层），通过接口和实现类分离关注点，提升代码的可维护性。
    数据层（数据库）
    技术：Mysql + MyBatis
    数据库规范化：设计规范化的数据库表，避免数据冗余。通过外键约束等方式确保数据的一致性。
    查询：合理设计索引，确保在数据量较大时系统仍能高效查询。
