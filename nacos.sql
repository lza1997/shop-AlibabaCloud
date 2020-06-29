/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.30 : Database - nacos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nacos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `nacos`;

/*Table structure for table `config_info` */

DROP TABLE IF EXISTS `config_info`;

CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

/*Data for the table `config_info` */

insert  into `config_info`(`id`,`data_id`,`group_id`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`app_name`,`tenant_id`,`c_desc`,`c_use`,`effect`,`type`,`c_schema`) values (19,'gateway-dev.yml','shop','server:\r\n  port: 9999\r\n\r\n\r\nspring:\r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        - id: auth\r\n          uri: lb://auth\r\n          order: 8000\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n#            - SwaggerHeaderFilter\r\n            - StripPrefix=1\r\n        - id: admin\r\n          uri: lb://admin\r\n          order: 8001\r\n          predicates:\r\n            - Path=/admin/**\r\n          filters:\r\n#            - SwaggerHeaderFilter\r\n            - StripPrefix=1\r\n        - id: sms\r\n          uri: lb://sms\r\n          order: 8001\r\n          predicates:\r\n            - Path=/sms/**\r\n          filters:\r\n#            - SwaggerHeaderFilter\r\n            - StripPrefix=1  \r\n        - id: user\r\n          uri: lb://user\r\n          order: 8001\r\n          predicates:\r\n            - Path=/user/**\r\n          filters:\r\n#            - SwaggerHeaderFilter\r\n            - StripPrefix=1             \r\n            ','a505c3d907e10b36300fc47e981cace6','2020-05-07 12:06:39','2020-05-08 18:12:03',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(26,'datasource.yml','common','spring:\r\n  datasource:\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:mysql://192.168.169.130:3306/fanjun?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=UTC\r\n    username: ENC(iTidncEaIStUoVk0pmulew==)\r\n    password: ENC(jTSOj2zVaKE7UQQg7Y+Ufw==)\r\n\r\n\r\n','13842f99966e2b0521dc854d2f36ba0c','2020-05-07 12:24:07','2020-05-18 02:05:11',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(27,'application-dev.yml','common','spring:\r\n  redis:\r\n    host: 39.96.244.233\r\n    password: hosemall\r\n    port: 6379\r\n    timeout: 10000\r\n    database: 0\r\n \r\n  servlet:\r\n    multipart:\r\n      max-file-size: 100MB\r\n      max-request-size: 100MB\r\n  zipkin:\r\n    #他不断的去跟踪所有服务，\r\n    discovery-client-enabled: false       \r\n  cloud:\r\n    sentinel:\r\n      transport:\r\n        dashboard: 39.96.244.233:9081\r\n      eager: true \r\n  output:\r\n    ansi:\r\n      enabled: always\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\nfeign:\r\n  hystrix:\r\n    enabled: false\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\nlogging:\r\n  level:\r\n    com.alibaba: Error\r\n    io.lettuce.core.protocol: Error\r\n\r\n\r\n\r\n\r\n#负载均衡ribbon优化\r\nribbon:\r\n  eureka:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  http:\r\n    client:\r\n      enabled: false\r\n  ReadTimeout: 20000\r\n  ConnectTimeout: 20000\r\n  MaxAutoRetries: 0\r\n  MaxAutoRetriesNextServer: 1\r\n  OkToRetryOnAllOperations: false\r\n  # eager-load:\r\n  #   enabled: true\r\n  #   clients: usercenter,auth,admin,search,hotel,openapi,pay,message\r\n\r\n#负载均衡ribbon中hystrix的优化\r\nhystrix:\r\n  threadpool:\r\n    default:\r\n      coreSize: 1000 ##并发执行的最大线程数，默认10\r\n      maxQueueSize: 1000 ##BlockingQueue的最大队列数\r\n      queueSizeRejectionThreshold: 500 ##即使maxQueueSize没有达到，达到queueSizeRejectionThreshold该值后，请求也会被拒绝\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 800000   \r\n\r\n\r\njasypt:\r\n  encryptor:\r\n    password: lza123    \r\n\r\n\r\n  \r\nshop-cloud:\r\n  tenant:\r\n    tables:\r\n      - oauth_client_details\r\n      - sys_area\r\n      - sys_dict\r\n      - sys_dict_list\r\n      - sys_dict_tree\r\n      - sys_email_template\r\n      - sys_file\r\n      - sys_menu\r\n      - sys_msg\r\n      - sys_msg_config\r\n      - sys_office\r\n      - sys_role\r\n      - sys_user\r\n','5febb34ac08aab4c497cb05229fe4b64','2020-05-07 12:25:37','2020-05-11 17:47:44',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(28,'security.yml','common','security:\r\n  oauth2:\r\n    reuseRefreshToken: false\r\n    client:\r\n      client-id: client\r\n      client-secret: secret\r\n      access-token-uri: http://auth/oauth/token\r\n      user-authorization-uri: http://auth/oauth/authorize\r\n      ignore-urls:\r\n        - /actuator/**\r\n        - /actuator\r\n        - /v2/api-docs\r\n        - /swagger-resources\r\n        - /swagger-resources/**\r\n        - /configuration/ui\r\n        - /configuration/security\r\n        - /swagger-ui.html\r\n        - /webjars/**\r\n        - /token/**\r\n        - /auth/code/**\r\n        - /auth/mobile\r\n        - /auth/**\r\n        - /assets/**\r\n    resource:\r\n      token-info-uri: http://auth/oauth/check_token\r\n      loadBalanced: true','8ad56e5d0e9965faa893585b02a4c262','2020-05-07 12:27:55','2020-05-08 01:37:11',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(30,'auth-dev.yml','shop','server:\r\n port: 9006\r\n\r\n\r\n #mybatis\r\nmybatis-plus:\r\n  mapper-locations: classpath:/mapper/*Mapper.xml\r\n  typeAliasesPackage: com.lza.auth.entity\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      column-underline: true\r\n      #capital-mode: true\r\n      logic-delete-value: 1\r\n      logic-not-delete-value: 0\r\n    refresh: true\r\n  configuration:\r\n    map-underscore-to-camel-case: true\r\n    cache-enabled: false\r\n  performanceInterceptor:\r\n    enabled: true\r\n    \r\nsnowflake:\r\n  workerId: 2\r\n  dataId: 2\r\n    \r\n\r\n','be73ec87368ccfe5c7293d2702ffc436','2020-05-07 15:40:33','2020-05-07 23:40:37',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(37,'swagger.yml','common','swagger:\r\n  enabled: true\r\n  author: 中安\r\n  title: 微服务脚手架\r\n  desc: 微服务脚手架\r\n  version: 1.0\r\n  termsOfServiceUrl: http://za.com\r\n  host: 127.0.0.1:9999\r\n  authUri: http://127.0.0.1:9999/auth/oauth/token','4536b7c428a2ae835916cf1b3ff49319','2020-05-07 21:01:37','2020-05-18 02:09:43',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(38,'discovery-commom.yml','common','spring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 127.0.0.1:8849\r\n        namespace: 62a23f8d-4b8a-4148-98b9-41c456c6723b\r\n        username: nacos\r\n        password: nacos\r\n        cluster-name: nj\r\n        metadata:\r\n          version : v1\r\n            # 允许调用的提供者版本\r\n          target-version: v1','ea45f03ea7d13229205b85cab2a76921','2020-05-07 21:02:36','2020-05-07 21:02:36',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b',NULL,NULL,NULL,'yaml',NULL),(44,'admin-dev.yml','shop','server:\r\n port: 9007\r\n\r\n\r\n #mybatis\r\nmybatis-plus:\r\n  mapper-locations: classpath:/mapper/*Mapper.xml\r\n  typeAliasesPackage: com.lza.admin.beans\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      column-underline: true\r\n      #capital-mode: true\r\n      logic-delete-value: 1\r\n      logic-not-delete-value: 0\r\n    refresh: true\r\n  configuration:\r\n    map-underscore-to-camel-case: true\r\n    cache-enabled: false\r\n  performanceInterceptor:\r\n    enabled: true\r\n    \r\nsnowflake:\r\n  workerId: 2\r\n  dataId: 2\r\n    \r\n\r\n','c449b672bbba3987f09626355add3b3f','2020-05-08 02:31:01','2020-05-08 02:35:09',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(46,'security-admin.yml','shop','\r\nsecurity:\r\n  oauth2:\r\n    resourceId: admin\r\n    client:\r\n      client-id: client\r\n      client-secret: secret\r\n      access-token-uri: http://auth/oauth/token\r\n      user-authorization-uri: http://auth/oauth/authorize\r\n      ignore-urls:\r\n        - /v2/api-docs\r\n        - /swagger-resources\r\n        - /swagger-resources/**\r\n        - /configuration/ui\r\n        - /configuration/security\r\n        - /swagger-ui.html\r\n        - /webjars/**\r\n    resource:\r\n       jwt:\r\n        key-uri: http://auth/oauth/token_key\r\n        key-value: dev\r\n','56ed1776de7f9ba5d911f6c392e819ec','2020-05-08 02:38:13','2020-05-22 00:20:37',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(49,'sms-dev.yml','shop','server:\r\n  port: 9200\r\nspring:\r\n  \r\n  mail:\r\n    host: smtp.163.com\r\n    port:\r\n    protocol: smtp\r\n    username: jxaijm94@163.com\r\n    password: ai123456\r\n\r\n\r\nsecurity:\r\n  oauth2:\r\n    resourceId: sms\r\n    client:\r\n      client-id: client\r\n      client-secret: secret\r\n      access-token-uri: http://auth/oauth/token\r\n      user-authorization-uri: http://auth/oauth/authorize\r\n      ignore-urls:\r\n        - /v2/api-docs\r\n        - /swagger-resources\r\n        - /swagger-resources/**\r\n        - /configuration/ui\r\n        - /configuration/security\r\n        - /swagger-ui.html\r\n        - /webjars/**\r\n    resource:\r\n      token-info-uri: http://auth/oauth/check_token\r\n      loadBalanced: true\r\n#mybatis\r\nmybatis-plus:\r\n  mapper-locations: classpath:/mapper/*Mapper.xml\r\n  typeAliasesPackage: com.lza.sms.beans\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      column-underline: true\r\n      #capital-mode: true\r\n      logic-delete-value: 1\r\n      logic-not-delete-value: 0\r\n    refresh: true\r\n  configuration:\r\n    map-underscore-to-camel-case: true\r\n    cache-enabled: false\r\n  performanceInterceptor:\r\n    enabled: true\r\n    \r\nsnowflake:\r\n  workerId: 2\r\n  dataId: 2    ','66602633b899740496e8139e93cdb78f','2020-05-08 18:03:44','2020-05-08 18:05:59',NULL,'127.0.0.1','','62a23f8d-4b8a-4148-98b9-41c456c6723b','null','null','null','yaml','null'),(50,'application-dev.yml','DEFAULT_GROUP','jasypt:\r\n  encryptor:\r\n    password: lza123\r\n#开启优雅关机    \r\nserver:\r\n  shutdown: graceful \r\n    \r\n    \r\nspring:\r\n  redis:\r\n    host: 192.168.169.129\r\n    # password: 123456\r\n    # port: 16379\r\n    # database: 11\r\n# spring:\r\n#   redis:\r\n#     host: 39.96.244.233\r\n#     password: hosemall\r\n#     port: 6379\r\n#     timeout: 10000\r\n#     database: 11\r\n    \r\n  servlet:\r\n    multipart:\r\n      max-file-size: 100MB\r\n      max-request-size: 100MB\r\n  cloud:\r\n    sentinel:\r\n      eager: true\r\n      filter:\r\n        url-patterns: /** \r\n      transport:\r\n        dashboard: 127.0.0.1:8090\r\n                \r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\nribbon:\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n\r\n#开启灰度\r\ngray:\r\n  rule:\r\n    enabled: true\r\n\r\nmybatis-plus:\r\n  tenant-enable: ture\r\n  mapper-locations: classpath:/mapper/*Mapper.xml\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      id-type: auto\r\n      field-strategy: NOT_EMPTY\r\n  type-handlers-package:  com.lza.common.data.handler\r\n\r\nswagger:\r\n  enabled: true\r\n  author: lza\r\n  title: 中安微服务脚手架\r\n  desc: 中安微服务脚手架\r\n  version: 1.0\r\n  termsOfServiceUrl: http://lza.com\r\n  host: 127.0.0.1:8888\r\n  authUri: http://127.0.0.1:8888/auth/oauth/token\r\n \r\n\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      ignore-urls:\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n         - /actuator/**\r\n        - /actuator\r\n        - /v2/api-docs\r\n        - /swagger-resources\r\n        - /swagger-resources/**\r\n        - /configuration/ui\r\n        - /configuration/security\r\n        - /swagger-ui.html\r\n        - /webjars/**\r\n        - /token/**\r\n        - /auth/**\r\n        - /assets/**\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://auth/oauth/check_token\r\n \r\n\r\n\r\n\r\nlogging:\r\n  level:\r\n    com.alibaba: Error\r\n    io.lettuce.core.protocol: Error \r\n    com.netflix.zuul: Error      ','cb63db80309641d9e9cf6577cf78ca6f','2020-05-12 18:33:00','2020-06-24 00:53:44',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','null','null','null','yaml','null'),(51,'auth-dev.yml','DEFAULT_GROUP','server:\r\n  port: 3000\r\n\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:mysql://192.168.169.129:3306/shop?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=UTC\r\n    username: ENC(krQYvSn+lF6vB1vMms+eTQ==)\r\n    password: ENC(mKsrRHGUTUGDAjUsNMYf6g==)\r\n\r\n','483c02a3f9794ef77a2a507863acfc15','2020-05-12 18:35:22','2020-06-24 01:00:47',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','null','null','null','yaml','null'),(52,'discovery-common.yml','common','spring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 127.0.0.1:8849\r\n        namespace: 832ab7cc-d96c-45fb-9122-dfdd4f3e02e0\r\n        username: nacos\r\n        password: nacos\r\n        cluster-name: bj\r\n        metadata:\r\n          version : v1\r\n            # 允许调用的提供者版本\r\n          target-version: v1','ad962321861750dfd8414d74f2459cdc','2020-05-12 18:36:17','2020-06-15 15:13:00',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','null','null','null','yaml','null'),(57,'gateway-dev.yml','shop','server:\r\n  port: 8888\r\n\r\n  \r\nsecurity:\r\n  encode:\r\n    key: \'lza1234jfhfhgdfg\'\r\n\r\ncaptcha:\r\n  water:\r\n    mark: lza123\r\n\r\nribbon:\r\n  rule:\r\n    gray-enabled: true\r\n\r\nspring:\r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      \r\n      sentinel:\r\n       datasource.ds1.nacos:\r\n         server-addr: 127.0.0.1:8849\r\n         data-id: lza\r\n         group-id: DEFAULT_GROUP\r\n         ruleType: lza-api-group\r\n      filter:\r\n        enabled: true    \r\n      routes:  \r\n        - id: admin\r\n          uri: lb://admin\r\n          order: 8000\r\n          predicates:\r\n            - Path=/admin/**\r\n          filters:\r\n#            - SwaggerHeaderFilter\r\n            - StripPrefix=1\r\n        - id: pay\r\n          uri: lb://pay\r\n          order: 8001\r\n          predicates:\r\n            - Path=/pay/**\r\n          filters:\r\n#            - SwaggerHeaderFilter\r\n             - StripPrefix=1\r\n        - id: auth\r\n          uri: lb://auth\r\n          order: 8002\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n             - StripPrefix=1          \r\n             - PasswordDecoderFilter\r\n             - ValidateCodeGatewayFilter\r\n              \r\n\r\n        ','ef7c6409f3dba36cb3166264e5812dc1','2020-05-12 20:11:43','2020-06-23 19:08:37',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','null','null','null','yaml','null'),(58,'admin-dev.yml','DEFAULT_GROUP','server:\r\n  port: 3001\r\n## spring security 配置\r\n## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(0HkwymsTREBToVIlmv9+3Q==)\r\n      client-secret: ENC(0HkwymsTREBToVIlmv9+3Q==)\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:mysql://192.168.169.129:3306/shop?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=UTC\r\n    username: ENC(krQYvSn+lF6vB1vMms+eTQ==)\r\n    password: ENC(mKsrRHGUTUGDAjUsNMYf6g==)\r\n\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.lza.admin.mapper: debug\r\n\r\n# 租户表维护\r\nza:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - sys_user\r\n      - sys_role\r\n      - sys_menu\r\n      - sys_dept\r\n      - sys_log\r\n      - sys_social_details\r\n      - sys_dict\r\n      - sys_dict_item\r\n      - sys_public_param\r\n      - sys_log\r\n      - sys_file\r\n      - sys_oauth_client_details\r\n   ','a10b50f9e6089e10efcc39adf08ffb9f','2020-05-13 15:09:10','2020-06-24 01:00:13',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','null','null','null','yaml','null'),(64,'pay-dev.yml','DEFAULT_GROUP','server:\r\n  port: 3003\r\n## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(1faUkRC2WBZxY51hiU4NBg==)\r\n      client-secret: ENC(1faUkRC2WBZxY51hiU4NBg==)\r\n      scope: server\r\n\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:mysql://192.168.169.129:3306/pay?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=UTC\r\n    username: ENC(iTidncEaIStUoVk0pmulew==)\r\n    password: ENC(jTSOj2zVaKE7UQQg7Y+Ufw==)\r\n\r\n# 租户表维护\r\nlza:\r\n  pay:\r\n    test: lza\r\n    aliPayConfig:\r\n      expire-time: 30\r\n      return-url: http://lza.com\r\n      notify-url: https://lza.com/pay/notify/ali/callbak\r\n    wxPayConfig:\r\n  \r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - pay_channel\r\n      - pay_trade_order\r\n      - pay_goods_order\r\n      - pay_notify_record','983aab480c977d3d0a48ed88a8db42e3','2020-05-14 03:02:34','2020-06-21 19:14:41',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','null','null','null','yaml','null'),(67,'lza','DEFAULT_GROUP','[\r\n   {\r\n    \"resource\": \"admin\",\r\n    \"count\": 50,\r\n    \"paramItem\": {\r\n      \"parseStrategy\": 2\r\n    }\r\n   }\r\n]','ff36aa382e4f0ece96982fef82957983','2020-06-02 00:35:12','2020-06-02 00:35:12',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0',NULL,NULL,NULL,'json',NULL),(70,'seata-storage.yml','DEFAULT_GROUP','#服务器端口\r\nserver:\r\n  port: 8502\r\n\r\n#数据源配置\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/seata_storage?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: root\r\n  application:\r\n    name: seata-storage','76acd6e028d327143996266269197661','2020-06-03 19:12:50','2020-06-03 19:12:50',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0',NULL,NULL,NULL,'yaml',NULL),(71,'seata-order.yml','DEFAULT_GROUP','#服务器端口\r\nserver:\r\n  port: 8501\r\n\r\n#数据源配置\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/seata_order?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: root\r\n  application:\r\n    name: seata-order\r\n\r\n\r\n','34e62aeba60acaba2e349c75d1114134','2020-06-03 19:13:54','2020-06-03 19:13:54',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0',NULL,NULL,NULL,'yaml',NULL),(72,'codegen-dev.yml','DEFAULT_GROUP','server:\r\n  port: 3005\r\n## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(1faUkRC2WBZxY51hiU4NBg==)\r\n      client-secret: ENC(1faUkRC2WBZxY51hiU4NBg==)\r\n      scope: server\r\n\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:mysql://192.168.169.129:3306/codegen?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=UTC\r\n    username: ENC(iTidncEaIStUoVk0pmulew==)\r\n    password: ENC(jTSOj2zVaKE7UQQg7Y+Ufw==)\r\n  resources:\r\n   static-locations: classpath:/static/,classpath:/views/\r\n\r\n\r\nza:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - gen_datasource_conf','20fc6cc14059daa2925c1b2b923ad625','2020-06-24 15:11:19','2020-06-24 15:30:49',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','','','','yaml',''),(79,'monitor-dev.yml','DEFAULT_GROUP','server:\r\n  port: 3008\r\nspring:\r\n  # 安全配置\r\n  security:\r\n    user:\r\n      name: ENC(HBZUTavAVeRCz78Kk8AmAQ==)     # lza\r\n      password: ENC(HBZUTavAVeRCz78Kk8AmAQ==) # lza\r\n  boot:\r\n    admin:\r\n      ui:\r\n        title: \'中安 服务状态监控\'\r\n        brand: \'中安 服务状态监控\'\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS  #显示详细信息','b79fbb3821e21df1352efaa7887055d4','2020-06-24 17:26:21','2020-06-24 17:32:31',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','','','','yaml',''),(80,'elastic-job-dev.yml','DEFAULT_GROUP','server:\r\n  port: 3010\r\n## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(1faUkRC2WBZxY51hiU4NBg==)\r\n      client-secret: ENC(1faUkRC2WBZxY51hiU4NBg==)\r\n      scope: server\r\n\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:mysql://192.168.169.129:3306/myjob?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=UTC\r\n    username: ENC(iTidncEaIStUoVk0pmulew==)\r\n    password: ENC(jTSOj2zVaKE7UQQg7Y+Ufw==)\r\n\r\n\r\nxxl:\r\n  job:\r\n    admin:\r\n      addresses: http://127.0.0.1:9080/xxl-job-admin','2df6b798c8f38d6e695212a16ef57bbe','2020-06-25 01:12:54','2020-06-25 01:18:52',NULL,'127.0.0.1','','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','','','','yaml','');

/*Table structure for table `config_info_aggr` */

DROP TABLE IF EXISTS `config_info_aggr`;

CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

/*Data for the table `config_info_aggr` */

/*Table structure for table `config_info_beta` */

DROP TABLE IF EXISTS `config_info_beta`;

CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

/*Data for the table `config_info_beta` */

/*Table structure for table `config_info_tag` */

DROP TABLE IF EXISTS `config_info_tag`;

CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

/*Data for the table `config_info_tag` */

/*Table structure for table `config_tags_relation` */

DROP TABLE IF EXISTS `config_tags_relation`;

CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

/*Data for the table `config_tags_relation` */

/*Table structure for table `group_capacity` */

DROP TABLE IF EXISTS `group_capacity`;

CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

/*Data for the table `group_capacity` */

/*Table structure for table `his_config_info` */

DROP TABLE IF EXISTS `his_config_info`;

CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

/*Data for the table `his_config_info` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `resource` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`role`,`resource`,`action`) values ('电商开发组','62a23f8d-4b8a-4148-98b9-41c456c6723b:*:*','rw');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`username`,`role`) values ('lza','电商开发组'),('nacos','ROLE_ADMIN');

/*Table structure for table `tenant_capacity` */

DROP TABLE IF EXISTS `tenant_capacity`;

CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

/*Data for the table `tenant_capacity` */

/*Table structure for table `tenant_info` */

DROP TABLE IF EXISTS `tenant_info`;

CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

/*Data for the table `tenant_info` */

insert  into `tenant_info`(`id`,`kp`,`tenant_id`,`tenant_name`,`tenant_desc`,`create_source`,`gmt_create`,`gmt_modified`) values (1,'1','62a23f8d-4b8a-4148-98b9-41c456c6723b','电商组','电商组','nacos',1588824236490,1588824236490),(2,'1','832ab7cc-d96c-45fb-9122-dfdd4f3e02e0','营销中心','运营中心','nacos',1589279253904,1591175671392);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`username`,`password`,`enabled`) values ('lza','$2a$10$uIN3NgBC8KY9UV0afezrueWY9ye3/5wFN2ERN/zW35ILJGxn3Kmz2',1),('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
