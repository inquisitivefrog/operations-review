
node db-default {
        $cluster = 'db1'
        $mysql_server = 'db1-prod1.mysite.com'
        $cassandra_server = 'db2-prod1.mysite.com'
        $mongo_server = 'db3-prod1.mysite.com'
        $memcached_server = 'db4-prod1.mysite.com'
        $redis_server = 'db5-prod1.mysite.com'
        $email_host = 'mail.mysite.com'

        $cassandra_cluster_name = 'prod1'
        $cassandra_seeds = 'cas1-prod1.mysite.com,cas2-prod1.mysite.com,cas3-prod1.mysite.com,cas4-prod1.mysite.com,cas5-prod1.mysite.com,cas6-prod1.mysite.com'
}
node /^db.*-prod1.*$/ inherits db-default {
        include default-modules
        include mysql
        include mongo
        include cassandra
        include redis
        include memcached
        include datadog
        include zabbix-agent
}

node prod1-default {

        # Used by sb* server type
        # Points to the db machine
        $cassandra_server = 'db2-prod1.mysite.com'

        # Used by db* server type
        # Number of nodes in ring
        $cassandra_ring_count = 1

        $cluster = 'prod1'
        $mysql_server = 'db1-prod1.mysite.com'
        $mongo_server = 'db1-prod1.mysite.com'
        $email_host = 'mail.mysite.com'
}

node /.*-prod1\..*$/ inherits prod1-default {
        notify "this is a prod1 machine"
        include default-modules
        include httpd
        include nginx
        include celery
        include acui
        include datadog
        include zabbix-agent
}

