#!/usr/bin/env python

from argparse import ArgumentParser
import boto3

def read_args():
    ap = ArgumentParser(description='Expanded management of AWS S3')
    ap.add_argument('-n',
                    '--name',
                    type=str,
                    required=True,
                    help='name of new bucket')
    ap.add_argument('-a',
                    '--acl',
                    type=str,
                    required=False,
                    choices=['private',
                             'public-read',
                             'public-read-write',
                             'authenticated-read'],
                    default='private',
                    help='level of security')
    ap.add_argument('-r',
                    '--region',
                    type=str,
                    required=False,
                    choices=['us-east-1',
                             'us-east-2',
                             'us-west-1',
                             'us-west-2'],
                    default='us-east-1',
                    help='AWS region for storage')
    o = ap.parse_args()
    return (o.name,
            o.acl,
            o.region)

class Manage:
    def __init__(self):
        self.s3 = boto3.resource('s3')

    def create(self, name, acl, region, versioning=False):
        if region == 'us-east-1':
            self.bucket = self.s3.create_bucket(ACL=acl,
                                                Bucket=name)
        else:
            self.bucket = self.s3.create_bucket(ACL=acl,
                                                Bucket=name,
                                                CreateBucketConfiguration={'LocationConstraint': region})
        return

    def ls(self):
        '''
        Acl, Cors, Lifecycle, LifecycleConfiguration, Logging, Notification, Object, Policy, RequestPayment, Tagging, Versioning, Website, 
        copy, create, creation_date, delete, delete_objects, download_file, download_fileobj, get_available_subresources, load, meta
        multipart_uploads, name, object_versions, objects, put_object, upload_file, upload_fileobj, wait_until_exists, wait_until_not_exists  
        pages, page_size, limit, iterator, filter, all
        '''
        print('Buckets')
        for bucket in self.s3.buckets.all():
            print(bucket.name)
        return

if __name__ == '__main__':
    (name, acl, region) = read_args()
    m = Manage()
    m.create(name, acl, region)
    m.ls()
    exit()
