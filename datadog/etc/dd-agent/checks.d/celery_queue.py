'''
Fetches the Celery queue length
'''

from checks import AgentCheck

class CeleryQueue(AgentCheck):
    error1 = 'required Python Redis module missing'
    error2 = 'required Celery queue keys missing in yaml config'
    def check(self, instance):
        try:
            import redis
        except ImportError:
            raise Exception(cls.error1)
        keys = instance.get('queue_keys', [])
        if not keys:
            raise Exception(cls.error2)
        l_params = ['host', 'port', 'db', 'password']
        c_params = dict((k, instance[k]) for k in l_params if k in instance)
        db = redis.Redis(**c_params)
        for key in keys:
            self.gauge('celery.queue.length',
                       db.llen(key),
                       tags=["queue:%s" % key])
