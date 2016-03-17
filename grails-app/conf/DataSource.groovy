import za.co.nico.cms.ExternalProperties


dataSource {
    pooled = true
//    driverClassName = "org.h2.Driver"
//    username = "sa"
//    password = ""
    driverClassName = "com.mysql.jdbc.Driver"
    username = "buffalo"
    password = "P@55w0rd"
    username = ExternalProperties.getUsername()
    password = ExternalProperties.getPassword()
    println(username)
    println(password)
    println("read propertiesfile : "+ExternalProperties.getPropertiesFile())
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            dbCreate = "create-drop" // the database tables will be dropped and then recreated
            // when you start the server
            dbCreate = "update"
            url = "jdbc:mysql://localhost/nicocms?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = "P@55w0rd"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            url = "jdbc:mysql://localhost/nicocms?useUnicode=yes&characterEncoding=UTF-8"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
