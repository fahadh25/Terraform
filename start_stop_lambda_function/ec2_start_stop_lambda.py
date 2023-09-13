import boto3

tag_key = 'project'
tag_value = 'terraform'
ec2_region = 'ap-southeast-1'

def start_stop_ec2_instances(tag_key, tag_value):
    ec2_client = boto3.client('ec2','ec2_region')
    
    # Get EC2 instances with the specified tag
    response = ec2_client.describe_instances(Filters=[
        {
            'Name': f'tag:{tag_key}',
            'Values': [tag_value]
        }
    ])

    instances = []
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instances.append(instance['InstanceId'])
    
    if not instances:
        print("No instances found with the specified tag.")
        return
    
    # Check instance state and perform start or stop action
    for instance_id in instances:
        response = ec2_client.describe_instances(InstanceIds=[instance_id])
        state = response['Reservations'][0]['Instances'][0]['State']['Name']
        
        if state == 'running':
            print(f"Stopping instance: {instance_id}")
            ec2_client.stop_instances(InstanceIds=[instance_id])
        elif state == 'stopped':
            print(f"Starting instance: {instance_id}")
            ec2_client.start_instances(InstanceIds=[instance_id])
        else:
            print(f"Instance {instance_id} is in an unknown state: {state}")
